package com.qimeng.bs.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qimeng.bs.market.goods.service.DmShoppingCartService;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.qimeng.common.tools.DateFormatUtils;
import com.qimeng.bs.login.bean.UserLoginRequest;
import com.qimeng.bs.login.bean.UserLoginRespond;
import com.qimeng.bs.login.service.UserLoginService;
import com.qimeng.bs.market.user.service.DmUserService;

@SuppressWarnings("unchecked")
public class UserLoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public UserLoginServlet() {
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
        String from = request.getHeader("Referer");
		UserLoginRequest loginRequest = new UserLoginRequest();
		loginRequest.setLogonName(request.getParameter("logon_name"));
		loginRequest.setPasswd(request.getParameter("passwd"));
		ApplicationContext appCtx = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
		UserLoginService service = (UserLoginService) appCtx.getBean("userLoginService");
		DmUserService dmUserService = (DmUserService) appCtx.getBean("dmUserService");
        DmShoppingCartService shoppingCartService = (DmShoppingCartService) appCtx.getBean("dmShoppingCartService");
		UserLoginRespond loginRespond = null;
		try {
			loginRespond = service.login(loginRequest);
		} catch (Exception e) {
			e.printStackTrace();
			loginRespond = new UserLoginRespond();
			loginRespond.setSuccess(false);
			loginRespond.setReason(e.getMessage());
		}

		if ("1".equals(loginRespond.isSuccess())) {
			Map sqlParams = new HashMap();
			sqlParams.put("lastLoginTime", DateFormatUtils.getFormatedDateTime());
			sqlParams.put("userId", loginRespond.getDmUser().getUserId());
			dmUserService.updateUser(sqlParams);
//			LoginInfo loginInfo = service.getLoginInfo(loginRespond.getDmUser());
//			request.getSession().setAttribute(Constants.LOGIN_INFO, loginInfo);
		} else {
			if (loginRespond.getDmUser() != null) {
				Map sqlParams = new HashMap();
				sqlParams.put("logonFailedCount", loginRespond.getDmUser().getLogonFailedCount() + 1);
				sqlParams.put("userId", loginRespond.getDmUser().getUserId());
				dmUserService.updateUser(sqlParams);
			}
		}

		PrintWriter out = response.getWriter();
		out.print("{\"success\":\"" + loginRespond.isSuccess()
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
