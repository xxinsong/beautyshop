package com.qimeng.bs.login.controller;

import javax.servlet.http.HttpSession;

import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Controller;

import com.qimeng.common.Constants;
import com.qimeng.bs.common.controller.GenericController;
import com.qimeng.bs.login.bean.AdminLoginInfo;

@Controller
@RemoteProxy
public class LoginController extends GenericController {

	public AdminLoginInfo getLoginInfo() {
		return (AdminLoginInfo) getSessionAttribute(Constants.ADMIN_LOGIN_INFO);
	}

	public void logout() {
		HttpSession session = getSession();
		if (session != null) {
			session.invalidate();
		}
	}
}
