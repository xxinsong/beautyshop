package com.qimeng.bs.system.staticdata.bean;

import org.directwebremoting.annotations.DataTransferObject;

@DataTransferObject
public class DcAttrValue {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dc_attr_value.ATTR_VALUE_ID
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    private Integer attrValueId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dc_attr_value.ATTR_ID
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    private Integer attrId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dc_attr_value.ATTR_VALUE
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    private String attrValue;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dc_attr_value.ATTR_VALUE_DESC
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    private String attrValueDesc;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dc_attr_value.SORTBY
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    private Integer sortby;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dc_attr_value.ATTR_VALUE_ID
     *
     * @return the value of dc_attr_value.ATTR_VALUE_ID
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    public Integer getAttrValueId() {
        return attrValueId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dc_attr_value.ATTR_VALUE_ID
     *
     * @param attrValueId the value for dc_attr_value.ATTR_VALUE_ID
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    public void setAttrValueId(Integer attrValueId) {
        this.attrValueId = attrValueId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dc_attr_value.ATTR_ID
     *
     * @return the value of dc_attr_value.ATTR_ID
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    public Integer getAttrId() {
        return attrId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dc_attr_value.ATTR_ID
     *
     * @param attrId the value for dc_attr_value.ATTR_ID
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    public void setAttrId(Integer attrId) {
        this.attrId = attrId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dc_attr_value.ATTR_VALUE
     *
     * @return the value of dc_attr_value.ATTR_VALUE
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    public String getAttrValue() {
        return attrValue;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dc_attr_value.ATTR_VALUE
     *
     * @param attrValue the value for dc_attr_value.ATTR_VALUE
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    public void setAttrValue(String attrValue) {
        this.attrValue = attrValue;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dc_attr_value.ATTR_VALUE_DESC
     *
     * @return the value of dc_attr_value.ATTR_VALUE_DESC
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    public String getAttrValueDesc() {
        return attrValueDesc;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dc_attr_value.ATTR_VALUE_DESC
     *
     * @param attrValueDesc the value for dc_attr_value.ATTR_VALUE_DESC
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    public void setAttrValueDesc(String attrValueDesc) {
        this.attrValueDesc = attrValueDesc;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dc_attr_value.SORTBY
     *
     * @return the value of dc_attr_value.SORTBY
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    public Integer getSortby() {
        return sortby;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dc_attr_value.SORTBY
     *
     * @param sortby the value for dc_attr_value.SORTBY
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    public void setSortby(Integer sortby) {
        this.sortby = sortby;
    }
}