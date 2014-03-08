package com.qimeng.bs.market.user.bean;

import javax.ws.rs.FormParam;

/**
 * User: Simon
 * Date: 14-3-1
 */
public class RegisterInfo {
    @FormParam("logon_name")
    private String logon_name;
    @FormParam("user_name")
    private String user_name;
    @FormParam("passwd")
    private String passwd;
    @FormParam("referrerMobileNo")
    private String referrerMobileNo;

    public String getLogon_name() {
        return logon_name;
    }

    public void setLogon_name(String logon_name) {
        this.logon_name = logon_name;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public String getReferrerMobileNo() {
        return referrerMobileNo;
    }

    public void setReferrerMobileNo(String referrerMobileNo) {
        this.referrerMobileNo = referrerMobileNo;
    }
}
