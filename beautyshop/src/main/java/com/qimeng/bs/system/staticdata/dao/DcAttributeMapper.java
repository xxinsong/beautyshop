package com.qimeng.bs.system.staticdata.dao;

import com.qimeng.bs.system.staticdata.bean.DcAttribute;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DcAttributeMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dc_attribute
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    int deleteByPrimaryKey(Integer attrId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dc_attribute
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    int insert(DcAttribute record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dc_attribute
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    int insertSelective(DcAttribute record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dc_attribute
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    DcAttribute selectByPrimaryKey(Integer attrId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dc_attribute
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    int updateByPrimaryKeySelective(DcAttribute record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dc_attribute
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    int updateByPrimaryKey(DcAttribute record);

    DcAttribute selectStaticDataByCode(String attrCode);

    List<DcAttribute> selectAllStaticData();
}