package com.qimeng.bs.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.qimeng.common.Constants;
import com.qimeng.bs.login.bean.AdminLoginInfo;
import com.qimeng.bs.login.bean.LoginRequest;
import com.qimeng.bs.login.bean.LoginRespond;
import com.qimeng.bs.login.service.LoginService;

@SuppressWarnings("unchecked")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public LoginServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		LoginRequest loginRequest = new LoginRequest();
		loginRequest.setStaffCode(request.getParameter("staffCode"));
		loginRequest.setPassword(request.getParameter("password"));
		ApplicationContext appCtx = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
		LoginService service = (LoginService) appCtx.getBean("loginService");
		LoginRespond loginRespond = null;
		try {
			loginRespond = service.login(loginRequest);
		} catch (Exception e) {
			e.printStackTrace();
			loginRespond = new LoginRespond();
			loginRespond.setSuccess("0");
			loginRespond.setReason(e.getMessage());
		}

		if ("1".equals(loginRespond.getSuccess())) {
			AdminLoginInfo loginInfo = (AdminLoginInfo) service.getLoginInfo(loginRespond.getStaff());
			request.getSession().setAttribute(Constants.ADMIN_LOGIN_INFO, loginInfo);
		}
		
		PrintWriter out = response.getWriter();
		out.print("{\"staffCode\":\"" + loginRequest.getStaffCode()
				+ "\",\"success\":\"" + loginRespond.getSuccess()
				+ "\",\"reason\":\"" + loginRespond.getReason() + "\"}");
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
