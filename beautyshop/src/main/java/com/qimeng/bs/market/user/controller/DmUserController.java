package com.qimeng.bs.market.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.qimeng.common.Constants;
import com.qimeng.common.tools.Const;
import com.qimeng.bs.common.controller.GenericController;
import com.qimeng.bs.login.bean.LoginInfo;
import com.qimeng.bs.login.service.UserLoginService;
import com.qimeng.bs.market.user.bean.DmUser;
import com.qimeng.bs.market.user.service.DmUserService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RemoteProxy
@SuppressWarnings("unchecked")
public class DmUserController extends GenericController {

	@Autowired
	private DmUserService dmUserService;
	
	@Autowired
	private UserLoginService userLoginService;
	
	/**
	 * 注册专用
	 * @return
	 *      flag=0：成功<br>
	 *      flag=1：用户已存在<br>
	 *      flag=2：验证码不正确<br>
	 */
	public Map insertUser(Map params) {
		params.put("s_verificCode", getSessionAttribute("s_verificCode"));
		Map result = dmUserService.insertUser(params);
		if ("0".equals(Const.getStrValue(result, "flag"))) {
			//注销验证码
			getSession().removeAttribute("s_verificCode");
			
			//注册成功后自动登录
			Map sqlParams = new HashMap();
			sqlParams.put("userId", Const.getStrValue(result, "userId"));
			List<DmUser> dmUsers = dmUserService.searchUser(sqlParams);
			setSessionAttribute(Constants.LOGIN_INFO, userLoginService.getLoginInfo(dmUsers.get(0)));
		}
		return result;
	}
	
	public String getVerificCode() {
		String verificCode = dmUserService.getVerificCode();
		setSessionAttribute("s_verificCode", verificCode);
		return verificCode;
	}
	
	/**
	 * 基本信息修改
	 */
	public boolean modifyBaseInfo(Map params) {
		LoginInfo loginInfo = (LoginInfo) getSessionAttribute(Constants.LOGIN_INFO);
		params.put("userId", loginInfo.getUserId());
		params.put("merchantId", loginInfo.getMerchantId());
		boolean result = dmUserService.modifyBaseInfo(params);

		// 修改成功刷新登录信息
		userLoginService.refreshLoginInfo(loginInfo.getUserId());
		return result;
	}
	
	public Map modifyLogonName(Map params) {
		Map result = new HashMap();
		LoginInfo loginInfo = (LoginInfo) getSessionAttribute(Constants.LOGIN_INFO);
		if (loginInfo == null) {
			result.put("flag", "1");
			result.put("reason", "请重新登录");
			return result;
		}
		params.put("userId", loginInfo.getUserId());
		result = dmUserService.modifyLogonName(params);
		
		// 修改成功刷新登录信息
		userLoginService.refreshLoginInfo(loginInfo.getUserId());
		return result;
	}

	public Map modifyEmail(Map params) {
		Map result = new HashMap();
		LoginInfo loginInfo = (LoginInfo) getSessionAttribute(Constants.LOGIN_INFO);
		if (loginInfo == null) {
			result.put("flag", "1");
			result.put("reason", "请重新登录");
			return result;
		}
		params.put("userId", loginInfo.getUserId());
		result = dmUserService.modifyEmail(params);
		
		// 修改成功刷新登录信息
		userLoginService.refreshLoginInfo(loginInfo.getUserId());
		return result;
	}

    @RequestMapping("/setting/account")
    public ModelAndView userInfoPage(){
        return new ModelAndView("/market/user/user_info.jsp");
    }
    @RequestMapping("/register")
    public ModelAndView registerPage(){
        return new ModelAndView("/market/main/register.jsp");
    }
}
