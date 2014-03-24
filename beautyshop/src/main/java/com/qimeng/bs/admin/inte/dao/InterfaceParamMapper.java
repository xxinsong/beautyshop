package com.qimeng.bs.admin.inte.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.qimeng.common.Page;
import com.qimeng.bs.admin.inte.bean.InterfaceParam;

@Repository
public interface InterfaceParamMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table interface_param
     *
     * @mbggenerated Mon Jan 13 16:42:31 CST 2014
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table interface_param
     *
     * @mbggenerated Mon Jan 13 16:42:31 CST 2014
     */
    int insert(InterfaceParam record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table interface_param
     *
     * @mbggenerated Mon Jan 13 16:42:31 CST 2014
     */
    int insertSelective(InterfaceParam record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table interface_param
     *
     * @mbggenerated Mon Jan 13 16:42:31 CST 2014
     */
    InterfaceParam selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table interface_param
     *
     * @mbggenerated Mon Jan 13 16:42:31 CST 2014
     */
    int updateByPrimaryKeySelective(InterfaceParam record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table interface_param
     *
     * @mbggenerated Mon Jan 13 16:42:31 CST 2014
     */
    int updateByPrimaryKey(InterfaceParam record);
    
    @SuppressWarnings("unchecked")
	List<InterfaceParam> searchAllByPage(Page page);
    @SuppressWarnings("unchecked")
	List<InterfaceParam> selectParamsByCode(Map map);
}