package com.qimeng.bs.market.order.bean;

import org.directwebremoting.annotations.DataTransferObject;

import java.math.BigDecimal;
import java.util.Date;
@DataTransferObject
public class DmSubCustOrder {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_sub_cust_order.SUB_ORDER_ID
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    private Integer subOrderId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_sub_cust_order.PLAN_ID
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    private Integer planId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_sub_cust_order.ORDER_ID
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    private Integer orderId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_sub_cust_order.GOODS_INST_ID
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    private Integer goodsInstId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_sub_cust_order.GOODS_NAME
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    private String goodsName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_sub_cust_order.ITEMS_COUNT
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    private Integer itemNo;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_sub_cust_order.PRICE
     *
     * @mbggenerated Mon Dec 23 15:00:55 CST 2013
     */
    private Float price;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_sub_cust_order.CREATE_DATE
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    private Date createDate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_sub_cust_order.COMMENTATED
     *
     * @mbggenerated Wed Dec 18 18:11:02 CST 2013
     */
    private String commentated;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_sub_cust_order.STATE
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    private String state;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_sub_cust_order.NOTES
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    private String notes;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_sub_cust_order.OPER_DATE
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    private Date operDate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_sub_cust_order.OPER_STAFF_NO
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    private String operStaffNo;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_sub_cust_order.OPER_NOTES
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    private String operNotes;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_sub_cust_order.SUB_ORDER_ID
     *
     * @return the value of dm_sub_cust_order.SUB_ORDER_ID
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    public Integer getSubOrderId() {
        return subOrderId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_sub_cust_order.SUB_ORDER_ID
     *
     * @param subOrderId the value for dm_sub_cust_order.SUB_ORDER_ID
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    public void setSubOrderId(Integer subOrderId) {
        this.subOrderId = subOrderId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_sub_cust_order.PLAN_ID
     *
     * @return the value of dm_sub_cust_order.PLAN_ID
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    public Integer getPlanId() {
        return planId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_sub_cust_order.PLAN_ID
     *
     * @param planId the value for dm_sub_cust_order.PLAN_ID
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    public void setPlanId(Integer planId) {
        this.planId = planId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_sub_cust_order.ORDER_ID
     *
     * @return the value of dm_sub_cust_order.ORDER_ID
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    public Integer getOrderId() {
        return orderId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_sub_cust_order.ORDER_ID
     *
     * @param orderId the value for dm_sub_cust_order.ORDER_ID
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_sub_cust_order.GOODS_INST_ID
     *
     * @return the value of dm_sub_cust_order.GOODS_INST_ID
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    public Integer getGoodsInstId() {
        return goodsInstId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_sub_cust_order.GOODS_INST_ID
     *
     * @param goodsInstId the value for dm_sub_cust_order.GOODS_INST_ID
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    public void setGoodsInstId(Integer goodsInstId) {
        this.goodsInstId = goodsInstId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_sub_cust_order.GOODS_NAME
     *
     * @return the value of dm_sub_cust_order.GOODS_NAME
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    public String getGoodsName() {
        return goodsName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_sub_cust_order.GOODS_NAME
     *
     * @param goodsName the value for dm_sub_cust_order.GOODS_NAME
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_sub_cust_order.ITEMS_COUNT
     *
     * @return the value of dm_sub_cust_order.ITEMS_COUNT
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    public Integer getItemNo() {
        return itemNo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_sub_cust_order.ITEMS_COUNT
     *
     * @param itemNo the value for dm_sub_cust_order.ITEMS_COUNT
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    public void setItemNo(Integer itemNo) {
        this.itemNo = itemNo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_sub_cust_order.PRICE
     *
     * @return the value of dm_sub_cust_order.PRICE
     *
     * @mbggenerated Mon Dec 23 15:00:55 CST 2013
     */
    public Float getPrice() {
        return price;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_sub_cust_order.PRICE
     *
     * @param price the value for dm_sub_cust_order.PRICE
     *
     * @mbggenerated Mon Dec 23 15:00:55 CST 2013
     */
    public void setPrice(Float price) {
//        calcAmount();
        this.price = price;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_sub_cust_order.CREATE_DATE
     *
     * @return the value of dm_sub_cust_order.CREATE_DATE
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_sub_cust_order.CREATE_DATE
     *
     * @param createDate the value for dm_sub_cust_order.CREATE_DATE
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_sub_cust_order.COMMENTATED
     *
     * @return the value of dm_sub_cust_order.COMMENTATED
     *
     * @mbggenerated Wed Dec 18 18:11:02 CST 2013
     */
    public String getCommentated() {
        return commentated;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_sub_cust_order.COMMENTATED
     *
     * @param commentated the value for dm_sub_cust_order.COMMENTATED
     *
     * @mbggenerated Wed Dec 18 18:11:02 CST 2013
     */
    public void setCommentated(String commentated) {
        this.commentated = commentated;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_sub_cust_order.STATE
     *
     * @return the value of dm_sub_cust_order.STATE
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    public String getState() {
        return state;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_sub_cust_order.STATE
     *
     * @param state the value for dm_sub_cust_order.STATE
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    public void setState(String state) {
        this.state = state;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_sub_cust_order.NOTES
     *
     * @return the value of dm_sub_cust_order.NOTES
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    public String getNotes() {
        return notes;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_sub_cust_order.NOTES
     *
     * @param notes the value for dm_sub_cust_order.NOTES
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    public void setNotes(String notes) {
        this.notes = notes;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_sub_cust_order.OPER_DATE
     *
     * @return the value of dm_sub_cust_order.OPER_DATE
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    public Date getOperDate() {
        return operDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_sub_cust_order.OPER_DATE
     *
     * @param operDate the value for dm_sub_cust_order.OPER_DATE
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    public void setOperDate(Date operDate) {
        this.operDate = operDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_sub_cust_order.OPER_STAFF_NO
     *
     * @return the value of dm_sub_cust_order.OPER_STAFF_NO
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    public String getOperStaffNo() {
        return operStaffNo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_sub_cust_order.OPER_STAFF_NO
     *
     * @param operStaffNo the value for dm_sub_cust_order.OPER_STAFF_NO
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    public void setOperStaffNo(String operStaffNo) {
        this.operStaffNo = operStaffNo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_sub_cust_order.OPER_NOTES
     *
     * @return the value of dm_sub_cust_order.OPER_NOTES
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    public String getOperNotes() {
        return operNotes;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_sub_cust_order.OPER_NOTES
     *
     * @param operNotes the value for dm_sub_cust_order.OPER_NOTES
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    public void setOperNotes(String operNotes) {
        this.operNotes = operNotes;
    }

    private Integer goodsId;
    private String goodsNo;
    private String goodsImage;
    private float amount;

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsNo() {
        return goodsNo;
    }

    public void setGoodsNo(String goodsNo) {
        this.goodsNo = goodsNo;
    }

    public String getGoodsImage() {
        return goodsImage;
    }

    public void setGoodsImage(String goodsImage) {
        this.goodsImage = goodsImage;
    }

    public float getAmount() {
        calcAmount();
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }

    private void calcAmount() {
        BigDecimal goodsPrice = new BigDecimal(String.valueOf(price));
        amount = goodsPrice.multiply(new BigDecimal(itemNo)).floatValue();
    }
}