package com.qimeng.bs.common.dao;

import com.qimeng.bs.common.bean.DcSystemConfig;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DcSystemConfigMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dc_system_config
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dc_system_config
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    int insert(DcSystemConfig record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dc_system_config
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    int insertSelective(DcSystemConfig record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dc_system_config
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    DcSystemConfig selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dc_system_config
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    int updateByPrimaryKeySelective(DcSystemConfig record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dc_system_config
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    int updateByPrimaryKey(DcSystemConfig record);

    DcSystemConfig selectByParamCode(String paramCode);

    List<DcSystemConfig> selectAll();
}