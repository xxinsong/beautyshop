package com.qimeng.bs.market.order.bean;

import org.directwebremoting.annotations.DataTransferObject;

import java.math.BigDecimal;
import java.util.Date;

@DataTransferObject
public class DmTradeLog {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_trade_log.TRADE_ID
     *
     * @mbggenerated Fri Jan 03 14:27:27 CST 2014
     */
    private Integer tradeId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_trade_log.ORDER_ID
     *
     * @mbggenerated Fri Jan 03 14:27:27 CST 2014
     */
    private Integer orderId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_trade_log.INTERFACE_ID
     *
     * @mbggenerated Fri Jan 03 14:27:27 CST 2014
     */
    private Integer interfaceId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_trade_log.AMOUNT
     *
     * @mbggenerated Fri Jan 03 14:27:27 CST 2014
     */
    private BigDecimal amount;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_trade_log.SEND_CONTENT
     *
     * @mbggenerated Fri Jan 03 14:27:27 CST 2014
     */
    private String sendContent;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_trade_log.ACCEPT_CONTENT
     *
     * @mbggenerated Fri Jan 03 14:27:27 CST 2014
     */
    private String acceptContent;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_trade_log.TRADE_RESULT
     *
     * @mbggenerated Fri Jan 03 14:27:27 CST 2014
     */
    private String tradeResult;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_trade_log.START_TIME
     *
     * @mbggenerated Fri Jan 03 14:27:27 CST 2014
     */
    private Date startTime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_trade_log.END_TIME
     *
     * @mbggenerated Fri Jan 03 14:27:27 CST 2014
     */
    private Date endTime;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_trade_log.TRADE_ID
     *
     * @return the value of dm_trade_log.TRADE_ID
     *
     * @mbggenerated Fri Jan 03 14:27:27 CST 2014
     */
    public Integer getTradeId() {
        return tradeId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_trade_log.TRADE_ID
     *
     * @param tradeId the value for dm_trade_log.TRADE_ID
     *
     * @mbggenerated Fri Jan 03 14:27:27 CST 2014
     */
    public void setTradeId(Integer tradeId) {
        this.tradeId = tradeId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_trade_log.ORDER_ID
     *
     * @return the value of dm_trade_log.ORDER_ID
     *
     * @mbggenerated Fri Jan 03 14:27:27 CST 2014
     */
    public Integer getOrderId() {
        return orderId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_trade_log.ORDER_ID
     *
     * @param orderId the value for dm_trade_log.ORDER_ID
     *
     * @mbggenerated Fri Jan 03 14:27:27 CST 2014
     */
    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_trade_log.INTERFACE_ID
     *
     * @return the value of dm_trade_log.INTERFACE_ID
     *
     * @mbggenerated Fri Jan 03 14:27:27 CST 2014
     */
    public Integer getInterfaceId() {
        return interfaceId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_trade_log.INTERFACE_ID
     *
     * @param interfaceId the value for dm_trade_log.INTERFACE_ID
     *
     * @mbggenerated Fri Jan 03 14:27:27 CST 2014
     */
    public void setInterfaceId(Integer interfaceId) {
        this.interfaceId = interfaceId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_trade_log.AMOUNT
     *
     * @return the value of dm_trade_log.AMOUNT
     *
     * @mbggenerated Fri Jan 03 14:27:27 CST 2014
     */
    public BigDecimal getAmount() {
        return amount;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_trade_log.AMOUNT
     *
     * @param amount the value for dm_trade_log.AMOUNT
     *
     * @mbggenerated Fri Jan 03 14:27:27 CST 2014
     */
    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_trade_log.SEND_CONTENT
     *
     * @return the value of dm_trade_log.SEND_CONTENT
     *
     * @mbggenerated Fri Jan 03 14:27:27 CST 2014
     */
    public String getSendContent() {
        return sendContent;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_trade_log.SEND_CONTENT
     *
     * @param sendContent the value for dm_trade_log.SEND_CONTENT
     *
     * @mbggenerated Fri Jan 03 14:27:27 CST 2014
     */
    public void setSendContent(String sendContent) {
        this.sendContent = sendContent;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_trade_log.ACCEPT_CONTENT
     *
     * @return the value of dm_trade_log.ACCEPT_CONTENT
     *
     * @mbggenerated Fri Jan 03 14:27:27 CST 2014
     */
    public String getAcceptContent() {
        return acceptContent;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_trade_log.ACCEPT_CONTENT
     *
     * @param acceptContent the value for dm_trade_log.ACCEPT_CONTENT
     *
     * @mbggenerated Fri Jan 03 14:27:27 CST 2014
     */
    public void setAcceptContent(String acceptContent) {
        this.acceptContent = acceptContent;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_trade_log.TRADE_RESULT
     *
     * @return the value of dm_trade_log.TRADE_RESULT
     *
     * @mbggenerated Fri Jan 03 14:27:27 CST 2014
     */
    public String getTradeResult() {
        return tradeResult;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_trade_log.TRADE_RESULT
     *
     * @param tradeResult the value for dm_trade_log.TRADE_RESULT
     *
     * @mbggenerated Fri Jan 03 14:27:27 CST 2014
     */
    public void setTradeResult(String tradeResult) {
        this.tradeResult = tradeResult;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_trade_log.START_TIME
     *
     * @return the value of dm_trade_log.START_TIME
     *
     * @mbggenerated Fri Jan 03 14:27:27 CST 2014
     */
    public Date getStartTime() {
        return startTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_trade_log.START_TIME
     *
     * @param startTime the value for dm_trade_log.START_TIME
     *
     * @mbggenerated Fri Jan 03 14:27:27 CST 2014
     */
    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_trade_log.END_TIME
     *
     * @return the value of dm_trade_log.END_TIME
     *
     * @mbggenerated Fri Jan 03 14:27:27 CST 2014
     */
    public Date getEndTime() {
        return endTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_trade_log.END_TIME
     *
     * @param endTime the value for dm_trade_log.END_TIME
     *
     * @mbggenerated Fri Jan 03 14:27:27 CST 2014
     */
    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }
}