package com.qimeng.common.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.qimeng.bs.common.exception.LoginException;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.qimeng.common.Constants;
import com.qimeng.bs.market.goods.ShoppingCart;
import com.qimeng.bs.login.bean.LoginInfo;

/**
 * 这个类取得上下文相关的数据
 *
 * @author Administrator
 */
public class ApplicationContextUtil {
    public static HttpServletRequest getRequest() {
        return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
    }

    public static HttpSession getSession() {
        return getSession(true);
    }

    public static HttpSession getSession(boolean create) {
        return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest().getSession(create);
    }


    public static Object getRequestAttribute(String name) {
        HttpServletRequest request = getRequest();
        return request.getAttribute(name);
    }

    public static Object getRequestParameter(String name) {
        HttpServletRequest request = getRequest();
        return request.getParameter(name);
    }

    public static Object getSessionAttribute(String name) {
        HttpSession session = getSession();
        return session.getAttribute(name);
    }

    public static void setSessionAttribute(String name, Object attribute) {
        HttpSession session = getSession();
        session.setAttribute(name, attribute);
    }

    public static LoginInfo getCurrentLoginUser() throws LoginException {
        try {
            return (LoginInfo) getSessionAttribute(Constants.LOGIN_INFO);
        } catch (Exception e) {
            throw new LoginException("用户未登录或者登录已失效！");
        }
    }

    public static void setCurrentLoginUser(LoginInfo currUser) throws LoginException {
        setSessionAttribute(Constants.LOGIN_INFO,currUser);
    }

    public static ShoppingCart getShoppingCart() {
        ShoppingCart shoppingCart = (ShoppingCart) getSessionAttribute(Constants.CAR_INFO);
        if (shoppingCart == null) {
            setShoppingCart(new ShoppingCart());
        }
        return (ShoppingCart) getSessionAttribute(Constants.CAR_INFO);
    }

    public static void setShoppingCart(ShoppingCart shoppingCart) {
        setSessionAttribute(Constants.CAR_INFO, shoppingCart);
    }

}
