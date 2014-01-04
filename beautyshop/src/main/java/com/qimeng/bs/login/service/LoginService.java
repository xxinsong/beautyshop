package com.qimeng.bs.login.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qimeng.common.tools.PasswordEncoder;
import com.qimeng.bs.admin.security.bean.DmStaff;
import com.qimeng.bs.admin.security.dao.DmPrivilegeMapper;
import com.qimeng.bs.admin.security.dao.DmStaffMapper;
import com.qimeng.bs.login.bean.AdminLoginInfo;
import com.qimeng.bs.login.bean.LoginRequest;
import com.qimeng.bs.login.bean.LoginRespond;

@Service
@SuppressWarnings("unchecked")
public class LoginService {
	
	@Autowired
	private DmStaffMapper dmStaffMapper;
	
	@Autowired
	private DmPrivilegeMapper dmPrivilegeMapper;

	public LoginRespond login(LoginRequest loginRequest) {
		LoginRespond loginRespond = new LoginRespond();
		List<DmStaff> dmStaffs = dmStaffMapper.findStaffs(loginRequest.unloadToMap());
		if (dmStaffs.size() == 0) {
			loginRespond.setSuccess("0");
			loginRespond.setReason("工号不存在！");
			return loginRespond;
		}
		DmStaff dmStaff = dmStaffs.get(0);
		if (!"00A".equals(dmStaff.getState())) {
			loginRespond.setSuccess("0");
			loginRespond.setReason("工号无效！");
			return loginRespond;
		}
		boolean validFlag = PasswordEncoder.validate(
				loginRequest.getPassword(), dmStaff.getStaffCode().toString(),
				dmStaff.getPassword());
		if (!validFlag) {
			loginRespond.setSuccess("0");
			loginRespond.setReason("密码错误，请重新输入！");
			return loginRespond;
		}

		loginRespond.setSuccess("1");
		loginRespond.setStaff(dmStaff);
		return loginRespond;
	}
	
	public AdminLoginInfo getLoginInfo(DmStaff staff) {
		AdminLoginInfo loginInfo = new AdminLoginInfo();
		loginInfo.setStaffId(staff.getStaffId());
		loginInfo.setStaffName(staff.getStaffName());
		loginInfo.setStaffCode(staff.getStaffCode());
		//loginInfo.setParty_id(staff.getPartyId());
		loginInfo.setPrivs(dmPrivilegeMapper.searchStaffPrivs(staff.getStaffId()));
		return loginInfo;
	}
}
