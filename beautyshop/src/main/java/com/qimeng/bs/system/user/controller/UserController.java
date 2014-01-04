package com.qimeng.bs.system.user.controller;

import com.qimeng.common.Page;
import com.qimeng.bs.common.controller.GenericController;
import com.qimeng.bs.system.user.bean.User;
import com.qimeng.bs.system.user.service.UserService;
import org.apache.commons.collections.MapUtils;
import org.apache.log4j.Logger;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;


@Controller
@RemoteProxy
@RequestMapping("/user")
public class UserController extends GenericController{
    private Logger logger = Logger.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @RemoteMethod
    public List<User> findUsers(){
        return userService.findUsers();
    }

    @RemoteMethod
    public boolean insertUser(){
        getCurrentLoginUser();
        return userService.insertUser();
    }

    @RemoteMethod
    public Page findUsersByPage(Map map){
        int pageIndex = MapUtils.getInteger(map,"page");
        int pageSize = MapUtils.getInteger(map, "rows");
//        int pageIndex = 1;
//        int pageSize = 5;
        return userService.findUsersByPage(pageIndex,pageSize);
    }

    @RequestMapping("/doLogin")
    public String doLogin(){
        logger.info("***********************"+getSession().getId());

        return "forward:/index2.jsp";
    }
}
