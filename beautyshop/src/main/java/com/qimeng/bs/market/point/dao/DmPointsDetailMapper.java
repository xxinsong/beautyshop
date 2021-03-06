package com.qimeng.bs.market.point.dao;

import com.qimeng.bs.market.point.bean.DmPointsDetail;
import org.springframework.stereotype.Repository;

@Repository
public interface DmPointsDetailMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_points_detail
     *
     * @mbggenerated Thu Mar 06 23:15:04 CST 2014
     */
    int deleteByPrimaryKey(Integer pointId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_points_detail
     *
     * @mbggenerated Thu Mar 06 23:15:04 CST 2014
     */
    int insert(DmPointsDetail record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_points_detail
     *
     * @mbggenerated Thu Mar 06 23:15:04 CST 2014
     */
    int insertSelective(DmPointsDetail record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_points_detail
     *
     * @mbggenerated Thu Mar 06 23:15:04 CST 2014
     */
    DmPointsDetail selectByPrimaryKey(Integer pointId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_points_detail
     *
     * @mbggenerated Thu Mar 06 23:15:04 CST 2014
     */
    int updateByPrimaryKeySelective(DmPointsDetail record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_points_detail
     *
     * @mbggenerated Thu Mar 06 23:15:04 CST 2014
     */
    int updateByPrimaryKey(DmPointsDetail record);
}