package com.qimeng.bs.login.bean;

import java.util.ArrayList;
import java.util.List;

import org.directwebremoting.annotations.DataTransferObject;

import com.qimeng.bs.admin.security.bean.DmPrivilege;

@DataTransferObject
public class AdminLoginInfo {
	private int staffId;
	private String staffName;
	private String staffCode;
	private int party_id;
	private List<DmPrivilege> privs = new ArrayList<DmPrivilege>();

	public int getStaffId() {
		return staffId;
	}

	public void setStaffId(int staffId) {
		this.staffId = staffId;
	}

	public String getStaffName() {
		return staffName;
	}

	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}

	public String getStaffCode() {
		return staffCode;
	}

	public void setStaffCode(String staffCode) {
		this.staffCode = staffCode;
	}

	public int getParty_id() {
		return party_id;
	}

	public void setParty_id(int partyId) {
		party_id = partyId;
	}

	public List<DmPrivilege> getPrivs() {
		return privs;
	}

	public void setPrivs(List<DmPrivilege> privs) {
		this.privs = privs;
	}

}
