package com.qimeng.bs.market.goods.bean;

import org.apache.commons.lang3.StringUtils;
import org.directwebremoting.annotations.DataTransferObject;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.Date;

@DataTransferObject
public class DmShoppingCartItem {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_shopping_cart.ID
     *
     * @mbggenerated Thu Dec 19 16:21:31 CST 2013
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_shopping_cart.GOODS_INST_ID
     *
     * @mbggenerated Thu Dec 19 16:21:31 CST 2013
     */
    private Integer goodsId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_shopping_cart.MERCHANT_ID
     *
     * @mbggenerated Thu Dec 19 16:21:31 CST 2013
     */
    private Integer merchantId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_shopping_cart.ORDER_ID
     *
     * @mbggenerated Thu Dec 19 16:21:31 CST 2013
     */
    private Integer orderId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_shopping_cart.GOODS_ITEM_NO
     *
     * @mbggenerated Thu Dec 19 16:21:31 CST 2013
     */
    private Integer itemNo;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_shopping_cart.CTEATE_TIME
     *
     * @mbggenerated Thu Dec 19 16:21:31 CST 2013
     */
    private Date cteateTime = new Date();

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_shopping_cart.STATE
     *
     * @mbggenerated Thu Dec 19 16:21:31 CST 2013
     */
    private String state = "00A";

    public DmShoppingCartItem(){

    }

    public DmShoppingCartItem(Integer goodsId, int num) {
        this.goodsId = goodsId;
        this.itemNo = num;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_shopping_cart.ID
     *
     * @return the value of dm_shopping_cart.ID
     *
     * @mbggenerated Thu Dec 19 16:21:31 CST 2013
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_shopping_cart.ID
     *
     * @param id the value for dm_shopping_cart.ID
     *
     * @mbggenerated Thu Dec 19 16:21:31 CST 2013
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_shopping_cart.GOODS_ID
     *
     * @return the value of dm_shopping_cart.GOODS_ID
     *
     * @mbggenerated Sun Jan 05 16:51:30 CST 2014
     */
    public Integer getGoodsId() {
        return goodsId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_shopping_cart.GOODS_ID
     *
     * @param goodsId the value for dm_shopping_cart.GOODS_ID
     *
     * @mbggenerated Sun Jan 05 16:51:30 CST 2014
     */
    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_shopping_cart.MERCHANT_ID
     *
     * @return the value of dm_shopping_cart.MERCHANT_ID
     *
     * @mbggenerated Thu Dec 19 16:21:31 CST 2013
     */
    public Integer getMerchantId() {
        return merchantId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_shopping_cart.MERCHANT_ID
     *
     * @param merchantId the value for dm_shopping_cart.MERCHANT_ID
     *
     * @mbggenerated Thu Dec 19 16:21:31 CST 2013
     */
    public void setMerchantId(Integer merchantId) {
        this.merchantId = merchantId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_shopping_cart.ORDER_ID
     *
     * @return the value of dm_shopping_cart.ORDER_ID
     *
     * @mbggenerated Thu Dec 19 16:21:31 CST 2013
     */
    public Integer getOrderId() {
        return orderId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_shopping_cart.ORDER_ID
     *
     * @param orderId the value for dm_shopping_cart.ORDER_ID
     *
     * @mbggenerated Thu Dec 19 16:21:31 CST 2013
     */
    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_shopping_cart.GOODS_ITEM_NO
     *
     * @return the value of dm_shopping_cart.GOODS_ITEM_NO
     *
     * @mbggenerated Thu Dec 19 16:21:31 CST 2013
     */
    public Integer getItemNo() {
        return itemNo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_shopping_cart.GOODS_ITEM_NO
     *
     * @param itemNo the value for dm_shopping_cart.GOODS_ITEM_NO
     *
     * @mbggenerated Thu Dec 19 16:21:31 CST 2013
     */
    public void setItemNo(Integer itemNo) {
        this.itemNo = itemNo;
        calcAmount();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_shopping_cart.CTEATE_TIME
     *
     * @return the value of dm_shopping_cart.CTEATE_TIME
     *
     * @mbggenerated Thu Dec 19 16:21:31 CST 2013
     */
    public Date getCteateTime() {
        return cteateTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_shopping_cart.CTEATE_TIME
     *
     * @param cteateTime the value for dm_shopping_cart.CTEATE_TIME
     *
     * @mbggenerated Thu Dec 19 16:21:31 CST 2013
     */
    public void setCteateTime(Date cteateTime) {
        this.cteateTime = cteateTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_shopping_cart.STATE
     *
     * @return the value of dm_shopping_cart.STATE
     *
     * @mbggenerated Thu Dec 19 16:21:31 CST 2013
     */
    public String getState() {
        return state;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_shopping_cart.STATE
     *
     * @param state the value for dm_shopping_cart.STATE
     *
     * @mbggenerated Thu Dec 19 16:21:31 CST 2013
     */
    public void setState(String state) {
        this.state = state;
    }

    private String goodsNo;
    private String goodsName;
    private String goodsImage;
    private float price;
    private float amount;

    public String getGoodsNo() {
        return goodsNo;
    }

    public void setGoodsNo(String goodsNo) {
        this.goodsNo = goodsNo;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getGoodsImage() {
        return getSmallImageUri(goodsImage);
    }

    public void setGoodsImage(String goodsImage) {
        this.goodsImage = goodsImage;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
        calcAmount();
    }

    public float getAmount() {
        calcAmount();
        return amount;
    }

    private void calcAmount() {
        BigDecimal price = new BigDecimal(Float.toString(this.price));
        DecimalFormat format = new DecimalFormat("#.00");
        format.format(price.multiply(new BigDecimal(itemNo)));
        amount = new Float(price.multiply(new BigDecimal(itemNo)).floatValue());
    }

    public boolean isSameGoods(DmShoppingCartItem sessionItem) {
        return this.goodsId.intValue()==sessionItem.getGoodsId().intValue();
    }

    public void increase(Integer goodsItemNo) {
        this.itemNo += goodsItemNo;
        calcAmount();
    }

    private String getSmallImageUri(String imageUri) {
        if(StringUtils.isNotEmpty(imageUri)){
            int subfixPos = imageUri.lastIndexOf(".");
            if(!imageUri.contains("_mini")){
                return imageUri.substring(0,subfixPos)+"_mini"+imageUri.substring(subfixPos);
            }
        }
        return imageUri;
    }
}