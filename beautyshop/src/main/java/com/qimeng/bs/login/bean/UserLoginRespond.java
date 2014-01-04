package com.qimeng.bs.login.bean;

import com.qimeng.bs.market.user.bean.DmUser;

public class UserLoginRespond {
    public static final String ERROR_USER_NOT_EXISTS = "用户不存在！";
    public static final String ERROR_USER_INVALID = "用户已失效！";
    public static final String ERROR_USER_LOCKED = "用户被锁定！";
    public static final String ERROR_UNKONWN = "用户状态异常，请联系管理员！";
    public static final String ERROR_PASSWORD_INCORRECT = "密码错误！";
    private boolean success;
	private String reason = "";

	private DmUser dmUser;

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public DmUser getDmUser() {
		return dmUser;
	}

	public void setDmUser(DmUser dmUser) {
		this.dmUser = dmUser;
	}


}
