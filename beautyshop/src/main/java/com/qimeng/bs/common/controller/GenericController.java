package com.qimeng.bs.common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.qimeng.common.web.ApplicationContextUtil;
import com.qimeng.bs.common.exception.LoginException;
import com.qimeng.bs.market.goods.ShoppingCart;
import com.qimeng.bs.login.bean.LoginInfo;

public class GenericController {

    protected HttpServletRequest getRequest() {
        return ApplicationContextUtil.getRequest();
    }

    protected HttpSession getSession() {
    	 return ApplicationContextUtil.getSession();
    }

    protected HttpSession getSession(boolean create) {
    	 return ApplicationContextUtil.getSession(create);
    }

    protected Object getRequestAttribute(String name){
 	   return ApplicationContextUtil.getRequestAttribute(name);
    }

    protected Object getRequestParameter(String name){
        return ApplicationContextUtil.getRequestParameter(name);
    }

    protected Object getSessionAttribute(String name){
    	   return ApplicationContextUtil.getSessionAttribute(name);
    }

    protected void setSessionAttribute(String name,Object attribute){
 	     ApplicationContextUtil.setSessionAttribute(name,attribute);
    }

    protected LoginInfo getCurrentLoginUser() throws LoginException {
    	 return ApplicationContextUtil.getCurrentLoginUser( );
    }
    
    protected ShoppingCart getShoppingCart()     {
    	 return ApplicationContextUtil.getShoppingCart( );
       
    }
}
