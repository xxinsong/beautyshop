package com.qimeng.common.tools;

import com.qimeng.bs.common.exception.SequenceNotDefinedException;
import com.qimeng.bs.system.sequence.dao.SysSequenceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

/**
 * User: Simon
 * Date: 13-12-4
 * 主键生成工具
 * 提供mysql数据库两种获取主键的方式,两种方式不可混用
 * 插入前获取：
 *      nextVal(tableName)
 *      用于用户自管理主键序列的方式，获取下一个主键，主键序列需在SYS_SEQUENCE表中定义
 *
 *      约束：需在SYS_SEQUENCE表中定义主键序列，建表时不要使用自增主键
 *
 * 插入后获取：
 *      lastInsertId()
 *      使用mysql系统函数LAST_INSERT_ID()获取同一事务中上次插入自动生成的ID，
 *      该函数获取的是在当前连接中上次生成的主键，不区分表，所以需在上次插入语句紧邻处调用，否则会取到错误的ID。
 *      用于自增长主键的获取，需在同一事务中调用，并且需在紧邻上一条插入语句之后。
 *
 *      约束：需在建表时使用自增主键
 */
@Component
public class PKUtils {

    private static PKUtils instance;

    @Autowired
    private SysSequenceMapper sysSequenceMapper;

    @PostConstruct
    public void init(){
        instance = this;
    }

    /**
     * 用于用户自管理主键序列的方式，获取下一个主键，主键序列需在SYS_SEQUENCE表中定义
     * @return  ID
     */
    public static int nextVal(String tableName){
        int id = instance.sysSequenceMapper.nextVal(tableName);
        if(id == 0){
            throw new SequenceNotDefinedException(tableName);
        }
        return id;
    }

    /**
     * 用于自增长主键的获取，需在同一事务中调用，并且需在紧邻上一条插入语句之后。
     * @return  ID
     */
    public static int lastInsertId(){
        int id = instance.sysSequenceMapper.selectLastInsertId();
        return id;
    }

    public static int currVal(String tableName){
        int id = instance.sysSequenceMapper.currVal(tableName);
        if(id == 0){
            throw new SequenceNotDefinedException(tableName);
        }
        return id;
    }
}
