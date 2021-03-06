package com.qimeng.bs.market.point.bean;

import org.directwebremoting.annotations.DataTransferObject;

import java.util.Date;
@DataTransferObject
public class DmPointsDetail {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_points_detail.POINT_ID
     *
     * @mbggenerated Thu Mar 06 23:15:04 CST 2014
     */
    private Integer pointId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_points_detail.USER_ID
     *
     * @mbggenerated Sun Mar 09 16:06:59 CST 2014
     */
    private Integer userId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_points_detail.PRESENTEE_ID
     *
     * @mbggenerated Sun Mar 09 16:06:59 CST 2014
     */
    private Integer presenteeId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_points_detail.POINT
     *
     * @mbggenerated Thu Mar 06 23:15:04 CST 2014
     */
    private Integer point;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_points_detail.ORDER_NO
     *
     * @mbggenerated Thu Mar 06 23:15:04 CST 2014
     */
    private String orderNo;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_points_detail.POINT_DESC
     *
     * @mbggenerated Thu Mar 06 23:15:04 CST 2014
     */
    private String pointDesc;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_points_detail.GAIN_TIME
     *
     * @mbggenerated Thu Mar 06 23:15:04 CST 2014
     */
    private Date gainTime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_points_detail.EFF_TIME
     *
     * @mbggenerated Thu Mar 06 23:15:04 CST 2014
     */
    private Date effTime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_points_detail.EXP_TIME
     *
     * @mbggenerated Thu Mar 06 23:15:04 CST 2014
     */
    private Date expTime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_points_detail.STATE
     *
     * @mbggenerated Thu Mar 06 23:15:04 CST 2014
     */
    private String state;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_points_detail.POINT_ID
     *
     * @return the value of dm_points_detail.POINT_ID
     *
     * @mbggenerated Thu Mar 06 23:15:04 CST 2014
     */
    public Integer getPointId() {
        return pointId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_points_detail.POINT_ID
     *
     * @param pointId the value for dm_points_detail.POINT_ID
     *
     * @mbggenerated Thu Mar 06 23:15:04 CST 2014
     */
    public void setPointId(Integer pointId) {
        this.pointId = pointId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_points_detail.USER_ID
     *
     * @return the value of dm_points_detail.USER_ID
     *
     * @mbggenerated Sun Mar 09 16:06:59 CST 2014
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_points_detail.USER_ID
     *
     * @param userId the value for dm_points_detail.USER_ID
     *
     * @mbggenerated Sun Mar 09 16:06:59 CST 2014
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_points_detail.PRESENTEE_ID
     *
     * @return the value of dm_points_detail.PRESENTEE_ID
     *
     * @mbggenerated Sun Mar 09 16:06:59 CST 2014
     */
    public Integer getPresenteeId() {
        return presenteeId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_points_detail.PRESENTEE_ID
     *
     * @param presenteeId the value for dm_points_detail.PRESENTEE_ID
     *
     * @mbggenerated Sun Mar 09 16:06:59 CST 2014
     */
    public void setPresenteeId(Integer presenteeId) {
        this.presenteeId = presenteeId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_points_detail.POINT
     *
     * @return the value of dm_points_detail.POINT
     *
     * @mbggenerated Thu Mar 06 23:15:04 CST 2014
     */
    public Integer getPoint() {
        return point;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_points_detail.POINT
     *
     * @param point the value for dm_points_detail.POINT
     *
     * @mbggenerated Thu Mar 06 23:15:04 CST 2014
     */
    public void setPoint(Integer point) {
        this.point = point;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_points_detail.ORDER_NO
     *
     * @return the value of dm_points_detail.ORDER_NO
     *
     * @mbggenerated Thu Mar 06 23:15:04 CST 2014
     */
    public String getOrderNo() {
        return orderNo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_points_detail.ORDER_NO
     *
     * @param orderNo the value for dm_points_detail.ORDER_NO
     *
     * @mbggenerated Thu Mar 06 23:15:04 CST 2014
     */
    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_points_detail.POINT_DESC
     *
     * @return the value of dm_points_detail.POINT_DESC
     *
     * @mbggenerated Thu Mar 06 23:15:04 CST 2014
     */
    public String getPointDesc() {
        return pointDesc;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_points_detail.POINT_DESC
     *
     * @param pointDesc the value for dm_points_detail.POINT_DESC
     *
     * @mbggenerated Thu Mar 06 23:15:04 CST 2014
     */
    public void setPointDesc(String pointDesc) {
        this.pointDesc = pointDesc;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_points_detail.GAIN_TIME
     *
     * @return the value of dm_points_detail.GAIN_TIME
     *
     * @mbggenerated Thu Mar 06 23:15:04 CST 2014
     */
    public Date getGainTime() {
        return gainTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_points_detail.GAIN_TIME
     *
     * @param gainTime the value for dm_points_detail.GAIN_TIME
     *
     * @mbggenerated Thu Mar 06 23:15:04 CST 2014
     */
    public void setGainTime(Date gainTime) {
        this.gainTime = gainTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_points_detail.EFF_TIME
     *
     * @return the value of dm_points_detail.EFF_TIME
     *
     * @mbggenerated Thu Mar 06 23:15:04 CST 2014
     */
    public Date getEffTime() {
        return effTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_points_detail.EFF_TIME
     *
     * @param effTime the value for dm_points_detail.EFF_TIME
     *
     * @mbggenerated Thu Mar 06 23:15:04 CST 2014
     */
    public void setEffTime(Date effTime) {
        this.effTime = effTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_points_detail.EXP_TIME
     *
     * @return the value of dm_points_detail.EXP_TIME
     *
     * @mbggenerated Thu Mar 06 23:15:04 CST 2014
     */
    public Date getExpTime() {
        return expTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_points_detail.EXP_TIME
     *
     * @param expTime the value for dm_points_detail.EXP_TIME
     *
     * @mbggenerated Thu Mar 06 23:15:04 CST 2014
     */
    public void setExpTime(Date expTime) {
        this.expTime = expTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_points_detail.STATE
     *
     * @return the value of dm_points_detail.STATE
     *
     * @mbggenerated Thu Mar 06 23:15:04 CST 2014
     */
    public String getState() {
        return state;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_points_detail.STATE
     *
     * @param state the value for dm_points_detail.STATE
     *
     * @mbggenerated Thu Mar 06 23:15:04 CST 2014
     */
    public void setState(String state) {
        this.state = state;
    }
}