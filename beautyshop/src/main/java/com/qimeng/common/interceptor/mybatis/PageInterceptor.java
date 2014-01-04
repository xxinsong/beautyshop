package com.qimeng.common.interceptor.mybatis;

import com.qimeng.common.Page;
import org.apache.commons.lang3.reflect.FieldUtils;
import org.apache.ibatis.binding.MapperMethod;
import org.apache.ibatis.executor.statement.PreparedStatementHandler;
import org.apache.ibatis.executor.statement.RoutingStatementHandler;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.plugin.*;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.RowBounds;
import org.apache.log4j.Logger;

import java.sql.Connection;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * 分页拦截器，用于拦截需要进行分页查询的操作，然后对其进行分页处理。
 * 利用拦截器实现Mybatis分页的原理：
 * 要利用JDBC对数据库进行操作就必须要有一个对应的Statement对象，Mybatis在执行Sql语句前就会产生一个包含Sql语句的Statement对象，而且对应的Sql语句
 * 是在Statement之前产生的，所以我们就可以在它生成Statement之前对用来生成Statement的Sql语句下手。在Mybatis中Statement语句是通过RoutingStatementHandler对象的
 * prepare方法生成的。所以利用拦截器实现Mybatis分页的一个思路就是拦截StatementHandler接口的prepare方法，然后在拦截器方法中把Sql语句改成对应的分页查询Sql语句，之后再调用
 * StatementHandler对象的prepare方法，即调用invocation.proceed()。
 * 对于分页而言，在拦截器里面我们还需要做的一个操作就是统计满足当前条件的记录一共有多少，这是通过获取到了原始的Sql语句后，把它改为对应的统计语句再利用Mybatis封装好的参数和设
 * 置参数的功能把Sql语句中的参数进行替换，之后再执行查询记录数的Sql语句进行总记录数的统计。
 *
 */
@Intercepts({
        @Signature(method = "prepare", type = StatementHandler.class, args = {Connection.class}) })
public class PageInterceptor implements Interceptor {

    private String databaseType;//数据库类型，不同的数据库有不同的分页方法
    private final static Logger logger = Logger.getLogger(PageInterceptor.class);
    public static final String CONFIGURATION = "configuration";
//    private static Dialect dialect = null;
    private static final String ROW_BOUNDS = "rowBounds";
    private static final String BOUND_SQL = "boundSql";
    private static final String DIALECT = "dialect";
    private static final String SQL = "sql";
    private static final String OFFSET = "offset";
    private static final String LIMIT = "limit";
    public static final String DELEGATE = "delegate";
    public static final String PARAMTER_OBJECT = "parameterObject";
    private static final int CONNECTION_INDEX = 0;

    /**
     * 拦截后要执行的方法
     */
    public Object intercept(Invocation invocation) throws Throwable {
        RoutingStatementHandler handler = (RoutingStatementHandler) invocation.getTarget();
        //通过反射获取到当前RoutingStatementHandler对象的delegate属性
        PreparedStatementHandler preparedStatHandler =
                (PreparedStatementHandler) FieldUtils.readField(handler, DELEGATE, true);
        final Object[] queryArgs = invocation.getArgs();
        Connection connection = (Connection) queryArgs[CONNECTION_INDEX];

        RowBounds rowBounds = (RowBounds) FieldUtils.readField(preparedStatHandler, ROW_BOUNDS, true);
        BoundSql boundSql = (BoundSql) FieldUtils.readField(preparedStatHandler, BOUND_SQL, true);
        Object obj = boundSql.getParameterObject();
        Page<?> page = null;

        if(obj instanceof Page){
            page = (Page<?>) obj;
            Configuration configuration = (Configuration) FieldUtils.readField(preparedStatHandler, CONFIGURATION, true);

            String originalSql = boundSql.getSql();

            //1.重新设置SQL参数
            MapperMethod.ParamMap paramMap = new MapperMethod.ParamMap();
            paramMap.putAll(page.getParams());
            FieldUtils.writeField(boundSql,PARAMTER_OBJECT,paramMap,true);
            FieldUtils.writeField(preparedStatHandler.getParameterHandler(),PARAMTER_OBJECT,paramMap,true);

            //2.获取总行数，将行数绑定到当前线程中
            String countSql = MybatisHelper.getCountSql(originalSql);
            CountHelper.getCount(countSql, preparedStatHandler, configuration, boundSql, connection);
            page.setTotal(CountHelper.getTotalRowCount());

            //3.获取分页的结果集
            String pagingSql = getPageSql(page,originalSql);
            FieldUtils.writeField(boundSql, SQL, pagingSql, true);

            int size = 0;
            size = getPageParamNum(originalSql, pagingSql);

            if (size == 1) {
                ParameterMapping.Builder builder = new ParameterMapping.Builder(configuration, LIMIT, Integer.class);
                boundSql.getParameterMappings().add(builder.build());
                boundSql.setAdditionalParameter(LIMIT, rowBounds.getLimit());
            }
            if (size == 2) {

                ParameterMapping.Builder builder = new ParameterMapping.Builder(
                        configuration, OFFSET, Integer.class);
                boundSql.getParameterMappings().add(builder.build());
                boundSql.setAdditionalParameter(OFFSET, rowBounds.getOffset());

                builder = new ParameterMapping.Builder(configuration, LIMIT,
                        Integer.class);
                boundSql.getParameterMappings().add(builder.build());
                boundSql.setAdditionalParameter(LIMIT, rowBounds.getLimit());
            }
            FieldUtils.writeField(rowBounds, OFFSET, RowBounds.NO_ROW_OFFSET, true);
            FieldUtils.writeField(rowBounds, LIMIT, RowBounds.NO_ROW_LIMIT, true);

            if (logger.isDebugEnabled()) {
                logger.debug("\n" + originalSql +
                        "\n对应的分页SQL:\n" +
                        boundSql.getSql() +
                        "\n对应的count SQL:\n" +
                        countSql);
            }
        }

        return invocation.proceed();
    }


    /**
     * 拦截器对应的封装原始对象的方法
     */
    public Object plugin(Object target) {
        return Plugin.wrap(target, this);
    }

    /**
     * 设置注册拦截器时设定的属性
     */
    public void setProperties(Properties properties) {
        this.databaseType = properties.getProperty("databaseType");
    }

    /**
     * 获取用于控制分页的问号的个数
     *
     * @param originalSql
     * @param pagingSql
     * @return
     */
    private int getPageParamNum(String originalSql, String pagingSql) {
        int size = 0;
        String addSql = pagingSql.replace(originalSql, "");

        Pattern pattern = Pattern.compile("[?]");
        Matcher matcher = pattern.matcher(addSql);
        while (matcher.find()) {
            size++;
        }
        return size;
    }

    /**
     * 根据page对象获取对应的分页查询Sql语句，这里只做了两种数据库类型，Mysql和Oracle
     * 其它的数据库都 没有进行分页
     *
     * @param page 分页对象
     * @param sql 原sql语句
     * @return
     */
    private String getPageSql(Page<?> page, String sql) {
        StringBuffer sqlBuffer = new StringBuffer(sql);
        if ("mysql".equalsIgnoreCase(databaseType)) {
            return getMysqlPageSql(page, sqlBuffer);
        } else if ("oracle".equalsIgnoreCase(databaseType)) {
            return getOraclePageSql(page, sqlBuffer);
        }
        return sqlBuffer.toString();
    }

    /**
     * 获取Mysql数据库的分页查询语句
     * @param page 分页对象
     * @param sqlBuffer 包含原sql语句的StringBuffer对象
     * @return Mysql数据库分页语句
     */
    private String getMysqlPageSql(Page<?> page, StringBuffer sqlBuffer) {
        //计算第一条记录的位置，Mysql中记录的位置是从0开始的。
        int offset = (page.getPageIndex() - 1) * page.getPageSize();
        sqlBuffer.append(" limit ").append(offset).append(",").append(page.getPageSize());
        return sqlBuffer.toString();
    }

    /**
     * 获取Oracle数据库的分页查询语句
     * @param page 分页对象
     * @param sqlBuffer 包含原sql语句的StringBuffer对象
     * @return Oracle数据库的分页查询语句
     */
    private String getOraclePageSql(Page<?> page, StringBuffer sqlBuffer) {
        //计算第一条记录的位置，Oracle分页是通过rownum进行的，而rownum是从1开始的
        int offset = (page.getPageIndex() - 1) * page.getPageSize() + 1;
        sqlBuffer.insert(0, "select u.*, rownum r from (").append(") u where rownum < ").append(offset + page.getPageSize());
        sqlBuffer.insert(0, "select * from (").append(") where r >= ").append(offset);
        //上面的Sql语句拼接之后大概是这个样子：
        //select * from (select u.*, rownum r from (select * from t_user) u where rownum < 31) where r >= 16
        return sqlBuffer.toString();
    }

    public void setDatabaseType(String databaseType) {
        this.databaseType = databaseType;
    }


}
