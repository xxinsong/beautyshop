package com.qimeng.bs.admin.inte.bean;

import org.directwebremoting.annotations.DataTransferObject;

@DataTransferObject
public class InterfaceParam {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column interface_param.ID
     *
     * @mbggenerated Mon Jan 13 16:42:31 CST 2014
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column interface_param.INTERFACE_ID
     *
     * @mbggenerated Mon Jan 13 16:42:31 CST 2014
     */
    private Integer interfaceId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column interface_param.PARAM_CODE
     *
     * @mbggenerated Mon Jan 13 16:42:31 CST 2014
     */
    private String paramCode;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column interface_param.PARAM_VALUE
     *
     * @mbggenerated Mon Jan 13 16:42:31 CST 2014
     */
    private String paramValue;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column interface_param.PARAM_DESC
     *
     * @mbggenerated Mon Jan 13 16:42:31 CST 2014
     */
    private String paramDesc;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column interface_param.ID
     *
     * @return the value of interface_param.ID
     *
     * @mbggenerated Mon Jan 13 16:42:31 CST 2014
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column interface_param.ID
     *
     * @param id the value for interface_param.ID
     *
     * @mbggenerated Mon Jan 13 16:42:31 CST 2014
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column interface_param.INTERFACE_ID
     *
     * @return the value of interface_param.INTERFACE_ID
     *
     * @mbggenerated Mon Jan 13 16:42:31 CST 2014
     */
    public Integer getInterfaceId() {
        return interfaceId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column interface_param.INTERFACE_ID
     *
     * @param interfaceId the value for interface_param.INTERFACE_ID
     *
     * @mbggenerated Mon Jan 13 16:42:31 CST 2014
     */
    public void setInterfaceId(Integer interfaceId) {
        this.interfaceId = interfaceId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column interface_param.PARAM_CODE
     *
     * @return the value of interface_param.PARAM_CODE
     *
     * @mbggenerated Mon Jan 13 16:42:31 CST 2014
     */
    public String getParamCode() {
        return paramCode;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column interface_param.PARAM_CODE
     *
     * @param paramCode the value for interface_param.PARAM_CODE
     *
     * @mbggenerated Mon Jan 13 16:42:31 CST 2014
     */
    public void setParamCode(String paramCode) {
        this.paramCode = paramCode;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column interface_param.PARAM_VALUE
     *
     * @return the value of interface_param.PARAM_VALUE
     *
     * @mbggenerated Mon Jan 13 16:42:31 CST 2014
     */
    public String getParamValue() {
        return paramValue;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column interface_param.PARAM_VALUE
     *
     * @param paramValue the value for interface_param.PARAM_VALUE
     *
     * @mbggenerated Mon Jan 13 16:42:31 CST 2014
     */
    public void setParamValue(String paramValue) {
        this.paramValue = paramValue;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column interface_param.PARAM_DESC
     *
     * @return the value of interface_param.PARAM_DESC
     *
     * @mbggenerated Mon Jan 13 16:42:31 CST 2014
     */
    public String getParamDesc() {
        return paramDesc;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column interface_param.PARAM_DESC
     *
     * @param paramDesc the value for interface_param.PARAM_DESC
     *
     * @mbggenerated Mon Jan 13 16:42:31 CST 2014
     */
    public void setParamDesc(String paramDesc) {
        this.paramDesc = paramDesc;
    }
}