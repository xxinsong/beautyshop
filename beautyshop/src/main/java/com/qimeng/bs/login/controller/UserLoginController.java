package com.qimeng.bs.login.controller;

import com.qimeng.common.Constants;
import com.qimeng.common.tools.DateFormatUtils;
import com.qimeng.common.web.ApplicationContextUtil;
import com.qimeng.bs.common.controller.GenericController;
import com.qimeng.bs.login.bean.LoginInfo;
import com.qimeng.bs.login.bean.UserLoginRequest;
import com.qimeng.bs.login.bean.UserLoginRespond;
import com.qimeng.bs.login.service.UserLoginService;
import com.qimeng.bs.market.goods.ShoppingCart;
import com.qimeng.bs.market.goods.bean.DmGoodsInst;
import com.qimeng.bs.market.goods.service.DmShoppingCartService;
import com.qimeng.bs.market.user.bean.DmUser;
import com.qimeng.bs.market.user.service.DmUserService;
import org.directwebremoting.annotations.RemoteProxy;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RemoteProxy
public class UserLoginController extends GenericController {
    @Autowired
    private UserLoginService userLoginservice;
    @Autowired
    private DmUserService dmUserService;
    @Autowired
    private DmShoppingCartService shoppingCartService;

    public LoginInfo getLoginInfo() {
        return (LoginInfo) getSessionAttribute(Constants.LOGIN_INFO);
    }

    @RequestMapping("/logout")
    public String logout() {
        HttpSession session = getSession(false);
        if (session != null) {
            session.removeAttribute(Constants.LOGIN_INFO);
            session.removeAttribute(Constants.CAR_INFO);
        }
        return "redirect:/welcome";
    }

    @RequestMapping("/welcome")
    public String mainpage(HttpServletRequest request) {
        return "/market/main/main.jsp";
    }

    @RequestMapping("/login")
    public String loginpage(HttpServletRequest request) {
        return "/market/main/login.jsp";
    }

    @RequestMapping(value = "/login/doLogin",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String doLogin(HttpServletRequest request) {
        String from = request.getHeader("Referer");
        UserLoginRequest loginRequest = new UserLoginRequest();
        loginRequest.setLogonName(request.getParameter("logon_name"));
        loginRequest.setPasswd(request.getParameter("passwd"));

        UserLoginRespond loginRespond = userLoginservice.login(loginRequest);

        if (loginRespond.isSuccess()) {
            //  登录成功，初始化session
            initSession(loginRespond.getDmUser());
            saveLoginSucessLog(loginRespond);
        } else {
            saveLoginFailureLog(loginRespond);
        }
        JSONObject json = new JSONObject();
        try {
            json.put("success",loginRespond.isSuccess());
            json.put("reason",loginRespond.getReason());
            json.put("from",from);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return json.toString();
    }

    private void saveLoginFailureLog(UserLoginRespond loginRespond) {
        if (loginRespond.getDmUser() != null) {
            Map sqlParams = new HashMap();
            sqlParams.put("logonFailedCount", loginRespond.getDmUser().getLogonFailedCount() + 1);
            sqlParams.put("userId", loginRespond.getDmUser().getUserId());
            dmUserService.updateUser(sqlParams);
        }
    }

    private void saveLoginSucessLog(UserLoginRespond loginRespond) {
        Map sqlParams = new HashMap();
        sqlParams.put("lastLoginTime", DateFormatUtils.getFormatedDateTime());
        sqlParams.put("userId", loginRespond.getDmUser().getUserId());
        sqlParams.put("logonFailedCount", 0);
        dmUserService.updateUser(sqlParams);
    }

    private void initSession(DmUser user) {
        LoginInfo currUser = userLoginservice.getLoginInfo(user);
//        加载用户信息到Session
        ApplicationContextUtil.setCurrentLoginUser(currUser);
//        加载用户购物车信息到Session
        ApplicationContextUtil.setShoppingCart(loadShoppingCart(currUser.getMerchantId()));
    }

    private ShoppingCart loadShoppingCart(int merchantId) {
        List<DmGoodsInst> dmGoodsInsts = shoppingCartService.selectGoodsInstInCart(merchantId);
        ShoppingCart cart = getShoppingCart();
        List<DmGoodsInst> selectedGoodsInstList = cart.getAllGoodsInCart();
        shoppingCartService.saveShoppingCart(selectedGoodsInstList);
        cart.putGoodsInCart(dmGoodsInsts);
        return cart;
    }



}
