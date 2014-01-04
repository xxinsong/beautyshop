package com.qimeng.bs.market.goods.bean;

import com.qimeng.bs.admin.goods.bean.DmGoodsPlan;
import org.directwebremoting.annotations.DataTransferObject;

import java.util.Date;
@DataTransferObject
public class DmGoodsInst {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_goods_inst.INST_ID
     *
     * @mbggenerated Tue Dec 10 11:29:07 CST 2013
     */
    private Integer instId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_goods_inst.MERCHANT_ID
     *
     * @mbggenerated Wed Dec 11 10:26:31 CST 2013
     */
    private Integer merchantId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_goods_inst.GOODS_ID
     *
     * @mbggenerated Tue Dec 10 11:29:07 CST 2013
     */
    private Integer goodsId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_goods_inst.PLAN_ID
     *
     * @mbggenerated Mon Dec 23 11:20:09 CST 2013
     */
    private Integer planId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_goods_inst.GOODS_NAME
     *
     * @mbggenerated Tue Dec 10 11:29:07 CST 2013
     */
    private String goodsName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_goods_inst.GOODS_TYPE
     *
     * @mbggenerated Tue Dec 10 11:29:07 CST 2013
     */
    private String goodsType;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_goods_inst.DATA_START_TIME
     *
     * @mbggenerated Tue Dec 10 11:29:07 CST 2013
     */
    private Date dataStartTime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_goods_inst.DATA_END_TIME
     *
     * @mbggenerated Tue Dec 10 11:29:07 CST 2013
     */
    private Date dataEndTime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_goods_inst.MAX_NUM
     *
     * @mbggenerated Tue Dec 10 11:29:07 CST 2013
     */
    private Integer maxNum;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_goods_inst.EFF_DATE
     *
     * @mbggenerated Tue Dec 10 11:29:07 CST 2013
     */
    private Date effDate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_goods_inst.EXP_DATE
     *
     * @mbggenerated Tue Dec 10 11:29:07 CST 2013
     */
    private Date expDate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_goods_inst.STATE
     *
     * @mbggenerated Tue Dec 10 11:29:07 CST 2013
     */
    private String state;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_goods_inst.INST_ID
     *
     * @return the value of dm_goods_inst.INST_ID
     *
     * @mbggenerated Tue Dec 10 11:29:07 CST 2013
     */
    public Integer getInstId() {
        return instId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_goods_inst.INST_ID
     *
     * @param instId the value for dm_goods_inst.INST_ID
     *
     * @mbggenerated Tue Dec 10 11:29:07 CST 2013
     */
    public void setInstId(Integer instId) {
        this.instId = instId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_goods_inst.MERCHANT_ID
     *
     * @return the value of dm_goods_inst.MERCHANT_ID
     *
     * @mbggenerated Wed Dec 11 10:26:31 CST 2013
     */
    public Integer getMerchantId() {
        return merchantId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_goods_inst.MERCHANT_ID
     *
     * @param merchantId the value for dm_goods_inst.MERCHANT_ID
     *
     * @mbggenerated Wed Dec 11 10:26:31 CST 2013
     */
    public void setMerchantId(Integer merchantId) {
        this.merchantId = merchantId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_goods_inst.GOODS_ID
     *
     * @return the value of dm_goods_inst.GOODS_ID
     *
     * @mbggenerated Tue Dec 10 11:29:07 CST 2013
     */
    public Integer getGoodsId() {
        return goodsId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_goods_inst.GOODS_ID
     *
     * @param goodsId the value for dm_goods_inst.GOODS_ID
     *
     * @mbggenerated Tue Dec 10 11:29:07 CST 2013
     */
    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_goods_inst.PLAN_ID
     *
     * @return the value of dm_goods_inst.PLAN_ID
     *
     * @mbggenerated Mon Dec 23 11:20:09 CST 2013
     */
    public Integer getPlanId() {
        return planId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_goods_inst.PLAN_ID
     *
     * @param planId the value for dm_goods_inst.PLAN_ID
     *
     * @mbggenerated Mon Dec 23 11:20:09 CST 2013
     */
    public void setPlanId(Integer planId) {
        this.planId = planId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_goods_inst.GOODS_NAME
     *
     * @return the value of dm_goods_inst.GOODS_NAME
     *
     * @mbggenerated Tue Dec 10 11:29:07 CST 2013
     */
    public String getGoodsName() {
        return goodsName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_goods_inst.GOODS_NAME
     *
     * @param goodsName the value for dm_goods_inst.GOODS_NAME
     *
     * @mbggenerated Tue Dec 10 11:29:07 CST 2013
     */
    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_goods_inst.GOODS_TYPE
     *
     * @return the value of dm_goods_inst.GOODS_TYPE
     *
     * @mbggenerated Tue Dec 10 11:29:07 CST 2013
     */
    public String getGoodsType() {
        return goodsType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_goods_inst.GOODS_TYPE
     *
     * @param goodsType the value for dm_goods_inst.GOODS_TYPE
     *
     * @mbggenerated Tue Dec 10 11:29:07 CST 2013
     */
    public void setGoodsType(String goodsType) {
        this.goodsType = goodsType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_goods_inst.DATA_START_TIME
     *
     * @return the value of dm_goods_inst.DATA_START_TIME
     *
     * @mbggenerated Tue Dec 10 11:29:07 CST 2013
     */
    public Date getDataStartTime() {
        return dataStartTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_goods_inst.DATA_START_TIME
     *
     * @param dataStartTime the value for dm_goods_inst.DATA_START_TIME
     *
     * @mbggenerated Tue Dec 10 11:29:07 CST 2013
     */
    public void setDataStartTime(Date dataStartTime) {
        this.dataStartTime = dataStartTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_goods_inst.DATA_END_TIME
     *
     * @return the value of dm_goods_inst.DATA_END_TIME
     *
     * @mbggenerated Tue Dec 10 11:29:07 CST 2013
     */
    public Date getDataEndTime() {
        return dataEndTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_goods_inst.DATA_END_TIME
     *
     * @param dataEndTime the value for dm_goods_inst.DATA_END_TIME
     *
     * @mbggenerated Tue Dec 10 11:29:07 CST 2013
     */
    public void setDataEndTime(Date dataEndTime) {
        this.dataEndTime = dataEndTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_goods_inst.MAX_NUM
     *
     * @return the value of dm_goods_inst.MAX_NUM
     *
     * @mbggenerated Tue Dec 10 11:29:07 CST 2013
     */
    public Integer getMaxNum() {
        return maxNum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_goods_inst.MAX_NUM
     *
     * @param maxNum the value for dm_goods_inst.MAX_NUM
     *
     * @mbggenerated Tue Dec 10 11:29:07 CST 2013
     */
    public void setMaxNum(Integer maxNum) {
        this.maxNum = maxNum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_goods_inst.EFF_DATE
     *
     * @return the value of dm_goods_inst.EFF_DATE
     *
     * @mbggenerated Tue Dec 10 11:29:07 CST 2013
     */
    public Date getEffDate() {
        return effDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_goods_inst.EFF_DATE
     *
     * @param effDate the value for dm_goods_inst.EFF_DATE
     *
     * @mbggenerated Tue Dec 10 11:29:07 CST 2013
     */
    public void setEffDate(Date effDate) {
        this.effDate = effDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_goods_inst.EXP_DATE
     *
     * @return the value of dm_goods_inst.EXP_DATE
     *
     * @mbggenerated Tue Dec 10 11:29:07 CST 2013
     */
    public Date getExpDate() {
        return expDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_goods_inst.EXP_DATE
     *
     * @param expDate the value for dm_goods_inst.EXP_DATE
     *
     * @mbggenerated Tue Dec 10 11:29:07 CST 2013
     */
    public void setExpDate(Date expDate) {
        this.expDate = expDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_goods_inst.STATE
     *
     * @return the value of dm_goods_inst.STATE
     *
     * @mbggenerated Tue Dec 10 11:29:07 CST 2013
     */
    public String getState() {
        return state;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_goods_inst.STATE
     *
     * @param state the value for dm_goods_inst.STATE
     *
     * @mbggenerated Tue Dec 10 11:29:07 CST 2013
     */
    public void setState(String state) {
        this.state = state;
    }


    private DmGoodsPlan dmGoodsPlan;

    public DmGoodsPlan getDmGoodsPlan() {
        return dmGoodsPlan;
    }

    public void setDmGoodsPlan(DmGoodsPlan dmGoodsPlan) {
        this.dmGoodsPlan = dmGoodsPlan;
    }
}