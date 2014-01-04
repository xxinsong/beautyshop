package com.qimeng.bs.market.user.bean;

import java.util.Date;

import org.directwebremoting.annotations.DataTransferObject;

@DataTransferObject
public class DmUser {
    private Integer userId;

    private String logonName;

    private String userName;

    private String headImage;

    private String email;

    private String passwd;

    private String passwdQuestion;

    private String passwdAnswer;

    private String state;

    private Date createTime;

    private Date activeTime;

    private Date modifyPwdTime;

    private Date lockTime;

    private Integer logonFailedCount;

    private Date lastLoginTime;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getLogonName() {
        return logonName;
    }

    public void setLogonName(String logonName) {
        this.logonName = logonName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getHeadImage() {
        return headImage;
    }

    public void setHeadImage(String headImage) {
        this.headImage = headImage;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public String getPasswdQuestion() {
        return passwdQuestion;
    }

    public void setPasswdQuestion(String passwdQuestion) {
        this.passwdQuestion = passwdQuestion;
    }

    public String getPasswdAnswer() {
        return passwdAnswer;
    }

    public void setPasswdAnswer(String passwdAnswer) {
        this.passwdAnswer = passwdAnswer;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getActiveTime() {
        return activeTime;
    }

    public void setActiveTime(Date activeTime) {
        this.activeTime = activeTime;
    }

    public Date getModifyPwdTime() {
        return modifyPwdTime;
    }

    public void setModifyPwdTime(Date modifyPwdTime) {
        this.modifyPwdTime = modifyPwdTime;
    }

    public Date getLockTime() {
        return lockTime;
    }

    public void setLockTime(Date lockTime) {
        this.lockTime = lockTime;
    }

    public Integer getLogonFailedCount() {
        return logonFailedCount;
    }

    public void setLogonFailedCount(Integer logonFailedCount) {
        this.logonFailedCount = logonFailedCount;
    }

    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }
}