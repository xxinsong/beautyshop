package com.qimeng.bs.login.bean;

import java.util.HashMap;
import java.util.Map;

@SuppressWarnings("unchecked")
public class LoginRequest {
	
	private String staffCode = "";
	private String password = "";
	
	public Map unloadToMap() {
		Map map = new HashMap();
		map.put("staffCode", staffCode);
		return map;
	}

	public String getStaffCode() {
		return staffCode;
	}

	public void setStaffCode(String staffCode) {
		this.staffCode = staffCode;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
