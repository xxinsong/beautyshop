package com.qimeng.bs.market.user.controller;

import com.qimeng.bs.common.controller.GenericController;
import com.qimeng.bs.login.bean.LoginInfo;
import com.qimeng.bs.login.service.UserLoginService;
import com.qimeng.bs.market.user.bean.DmUser;
import com.qimeng.bs.market.user.bean.RegisterInfo;
import com.qimeng.bs.market.user.service.DmUserService;
import com.qimeng.common.Constants;
import com.qimeng.common.tools.Const;
import org.directwebremoting.annotations.RemoteProxy;
import org.jboss.resteasy.annotations.Form;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RemoteProxy
@Path("/rs")
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
//		params.put("s_verificCode", getSessionAttribute("s_verificCode"));
		Map result = dmUserService.insertUser(params);
		if ("0".equals(Const.getStrValue(result, "flag"))) {
			//注销验证码
//			getSession().removeAttribute("s_verificCode");
			
			//注册成功后自动登录
			Map sqlParams = new HashMap();
			sqlParams.put("userId", Const.getStrValue(result, "userId"));
			List<DmUser> dmUsers = dmUserService.searchUser(sqlParams);
			setSessionAttribute(Constants.LOGIN_INFO, userLoginService.getLoginInfo(dmUsers.get(0)));
		}
		return result;
	}
    @POST
    @Produces({MediaType.APPLICATION_JSON})
    @Path("register")
    public String appRegister(@Form RegisterInfo registerInfo) throws JSONException {
        Map param = new HashMap();
        param.put("logon_name",registerInfo.getLogon_name());
        param.put("user_name", registerInfo.getUser_name());
        param.put("passwd",registerInfo.getPasswd());
        param.put("referrerMobileNo", registerInfo.getReferrerMobileNo());

        Map retMap = insertUser(param);
        JSONObject result = new JSONObject();
        if ("0".equals(Const.getStrValue(retMap, "flag"))) {
            result.put("success", true);
        }else{
            result.put("success", false);
            result.put("reason",Const.getStrValue(retMap,"reason"));
        }
        return result.toString();
    }

	/*public String getVerificCode() {
		String verificCode = dmUserService.getVerificCode();
		setSessionAttribute("s_verificCode", verificCode);
		return verificCode;
	}*/
	
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

    @PUT
    @Produces({MediaType.APPLICATION_JSON})
    @Path("card")
    public String modifyMerchant(@FormParam("realName")String realName,@FormParam("cardType")String cardType,@FormParam("cardNo")String cardNo) throws JSONException {
        JSONObject result = new JSONObject();
        LoginInfo loginInfo = (LoginInfo) getSessionAttribute(Constants.LOGIN_INFO);
        if(loginInfo!=null){
            Map param = new HashMap();
            param.put("merchantName",realName);
            param.put("cardType",cardType);
            param.put("cardNo", cardNo);

            boolean ret = modifyBaseInfo(param);
            if (ret) {
                result.put("success", true);
            }else{
                result.put("success", false);
            }
        }else{
            result.put("success", false);
            result.put("reason", "未登录！");
        }

        return result.toString();
    }
    @GET
    @Produces({MediaType.APPLICATION_JSON})
    @Path("card")
    public String getMerchantCard() throws JSONException {
        JSONObject result = new JSONObject();
        LoginInfo loginInfo = (LoginInfo) getSessionAttribute(Constants.LOGIN_INFO);
        if(loginInfo!=null){
            result.put("success", true);
            result.put("realName",loginInfo.getMerchantName());
            result.put("cardType",loginInfo.getCardType());
            result.put("cardNo",loginInfo.getCardNo());
        }else{
            result.put("success", false);
            result.put("reason", "未登录！");
        }

        return result.toString();
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
    /**
     * 用户有效积分
     */
    public int queryUserPoint() {
        LoginInfo loginInfo = getCurrentLoginUser();
        if (loginInfo == null)
            return 0;
        Integer userId = loginInfo.getUserId();
        return dmUserService.queryMyEffPoint(userId);
    }

    /**
     * 用户待营销
     */
    /*public int queryUserActivity() {
        LoginInfo loginInfo = getCurrentLoginUser();
        if (loginInfo == null) {
            return 0;
        }
        Integer merchantId = loginInfo.getMerchantId();
        return dmUserService.queryUserActivity(merchantId);
    }*/

    /**
     * 用户待支付
     */
    public int queryUserBePaid() {
        LoginInfo loginInfo = getCurrentLoginUser();
        if (loginInfo == null) {
            return 0;
        }
        Integer merchantId = loginInfo.getMerchantId();
        return dmUserService.queryBePaid(merchantId);
    }
    /**
     * 已发货
     */
    public int queryDeliver() {
        LoginInfo loginInfo = getCurrentLoginUser();
        if (loginInfo == null) {
            return 0;
        }
        Integer merchantId = loginInfo.getMerchantId();
        return dmUserService.queryDeliver(merchantId);
    }

    @RequestMapping("/setting/account")
    public ModelAndView userInfoPage(){
        return new ModelAndView("/market/user/user_info.jsp");
    }
    @RequestMapping("/register")
    public ModelAndView registerPage(){
        return new ModelAndView("/market/main/register.jsp");
    }



    //下面涉及的是安全设置
    @RequestMapping("/setting/security")
    public String UserSecurity(){
        return "/market/security/security.jsp";
    }

    @SuppressWarnings("rawtypes")
    public List getUserSecurity() {
        LoginInfo currUser = getCurrentLoginUser();
        Map param=new HashMap();
        param.put("userId", currUser.getUserId());
        return dmUserService.getUserSecurity(param);
    }


    @SuppressWarnings("rawtypes")
    public Map updateUserReg(Map param) {
        /*if (!(param.get("type").equals("ques_yz"))) {
            param.put("s_yzCode", getSessionAttribute("s_verificCode"));
        }*/
        param.put("userId",getCurrentLoginUser().getUserId());
        param.put("logonName",getCurrentLoginUser().getLogonName());
        Map result=dmUserService.updateUserReg(param);
        userLoginService.refreshLoginInfo(getCurrentLoginUser().getUserId());
        return result;
    }
}
