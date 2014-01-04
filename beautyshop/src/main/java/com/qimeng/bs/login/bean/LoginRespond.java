package com.qimeng.bs.login.bean;

import com.qimeng.bs.admin.security.bean.DmStaff;

public class LoginRespond {

	private String success = ""; // 1 : 成功， 0 : 失败
	private String reason = "";

	private DmStaff staff;

	public String getSuccess() {
		return success;
	}

	public void setSuccess(String success) {
		this.success = success;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public DmStaff getStaff() {
		return staff;
	}

	public void setStaff(DmStaff staff) {
		this.staff = staff;
	}

}
