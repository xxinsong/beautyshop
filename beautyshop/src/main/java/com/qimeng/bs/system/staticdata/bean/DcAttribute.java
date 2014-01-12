package com.qimeng.bs.system.staticdata.bean;

import java.util.List;

import org.directwebremoting.annotations.DataTransferObject;

@DataTransferObject
public class DcAttribute {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dc_attribute.ATTR_ID
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    private Integer attrId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dc_attribute.ATTR_CODE
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    private String attrCode;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dc_attribute.ATTR_NAME
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    private String attrName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dc_attribute.ATTR_DESC
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    private String attrDesc;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dc_attribute.VALUE_TYPE
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    private String valueType;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dc_attribute.INPUT_METHOD
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    private String inputMethod;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dc_attribute.NULLABLE
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    private String nullable;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dc_attribute.DEFAULT_VALUE
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    private String defaultValue;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dc_attribute.MIN_VALUE
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    private String minValue;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dc_attribute.MAX_VALUE
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    private String maxValue;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dc_attribute.STATE
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    private String state;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dc_attribute.ATTR_ID
     *
     * @return the value of dc_attribute.ATTR_ID
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    public Integer getAttrId() {
        return attrId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dc_attribute.ATTR_ID
     *
     * @param attrId the value for dc_attribute.ATTR_ID
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    public void setAttrId(Integer attrId) {
        this.attrId = attrId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dc_attribute.ATTR_CODE
     *
     * @return the value of dc_attribute.ATTR_CODE
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    public String getAttrCode() {
        return attrCode;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dc_attribute.ATTR_CODE
     *
     * @param attrCode the value for dc_attribute.ATTR_CODE
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    public void setAttrCode(String attrCode) {
        this.attrCode = attrCode;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dc_attribute.ATTR_NAME
     *
     * @return the value of dc_attribute.ATTR_NAME
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    public String getAttrName() {
        return attrName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dc_attribute.ATTR_NAME
     *
     * @param attrName the value for dc_attribute.ATTR_NAME
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    public void setAttrName(String attrName) {
        this.attrName = attrName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dc_attribute.ATTR_DESC
     *
     * @return the value of dc_attribute.ATTR_DESC
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    public String getAttrDesc() {
        return attrDesc;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dc_attribute.ATTR_DESC
     *
     * @param attrDesc the value for dc_attribute.ATTR_DESC
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    public void setAttrDesc(String attrDesc) {
        this.attrDesc = attrDesc;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dc_attribute.VALUE_TYPE
     *
     * @return the value of dc_attribute.VALUE_TYPE
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    public String getValueType() {
        return valueType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dc_attribute.VALUE_TYPE
     *
     * @param valueType the value for dc_attribute.VALUE_TYPE
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    public void setValueType(String valueType) {
        this.valueType = valueType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dc_attribute.INPUT_METHOD
     *
     * @return the value of dc_attribute.INPUT_METHOD
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    public String getInputMethod() {
        return inputMethod;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dc_attribute.INPUT_METHOD
     *
     * @param inputMethod the value for dc_attribute.INPUT_METHOD
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    public void setInputMethod(String inputMethod) {
        this.inputMethod = inputMethod;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dc_attribute.NULLABLE
     *
     * @return the value of dc_attribute.NULLABLE
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    public String getNullable() {
        return nullable;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dc_attribute.NULLABLE
     *
     * @param nullable the value for dc_attribute.NULLABLE
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    public void setNullable(String nullable) {
        this.nullable = nullable;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dc_attribute.DEFAULT_VALUE
     *
     * @return the value of dc_attribute.DEFAULT_VALUE
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    public String getDefaultValue() {
        return defaultValue;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dc_attribute.DEFAULT_VALUE
     *
     * @param defaultValue the value for dc_attribute.DEFAULT_VALUE
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    public void setDefaultValue(String defaultValue) {
        this.defaultValue = defaultValue;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dc_attribute.MIN_VALUE
     *
     * @return the value of dc_attribute.MIN_VALUE
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    public String getMinValue() {
        return minValue;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dc_attribute.MIN_VALUE
     *
     * @param minValue the value for dc_attribute.MIN_VALUE
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    public void setMinValue(String minValue) {
        this.minValue = minValue;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dc_attribute.MAX_VALUE
     *
     * @return the value of dc_attribute.MAX_VALUE
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    public String getMaxValue() {
        return maxValue;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dc_attribute.MAX_VALUE
     *
     * @param maxValue the value for dc_attribute.MAX_VALUE
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    public void setMaxValue(String maxValue) {
        this.maxValue = maxValue;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dc_attribute.STATE
     *
     * @return the value of dc_attribute.STATE
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    public String getState() {
        return state;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dc_attribute.STATE
     *
     * @param state the value for dc_attribute.STATE
     *
     * @mbggenerated Fri Nov 29 17:29:36 CST 2013
     */
    public void setState(String state) {
        this.state = state;
    }

    private List<DcAttrValue> valueList;

    public List<DcAttrValue> getValueList() {
        return valueList;
    }

    public void setValueList(List<DcAttrValue> valueList) {
        this.valueList = valueList;
    }
}