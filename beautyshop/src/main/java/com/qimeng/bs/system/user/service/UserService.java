package com.qimeng.bs.system.user.service;

import com.qimeng.common.Page;
import com.qimeng.bs.system.user.bean.User;
import com.qimeng.bs.system.user.dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;

    @Transactional
    public boolean insertUser(){
        User user = new User();
        user.setName("ZouQimeng");
        user.setPassword("123");
        int ret = userMapper.insert(user);
        return ret > 0;
    }
    @Transactional
    public void deleteUser(){
        User user = new User();
        user.setName("邹启蒙");
        user.setPassword("123");
        userMapper.insert(user);
    }

    public Page findUsersByPage(int pageIndex, int pageSize){
        Page page = new Page(pageIndex,pageSize);
        Map param = new HashMap();
        List<String> names = new ArrayList<String>();
//        names.add("ZouQimeng");
//        names.add("ZouQimeng2");
        param.put("names",names);
        page.setParams(param);
        List<User> list = userMapper.findAllUsersByPage(page);
        page.setRows(list);
        return page;
    }

    public List<User> findUsers(){
        Map param = new HashMap();
        param.put("id",new Integer(1));
        param.put("name","ZouQimeng");

        List<User> list = userMapper.findAllUsers(param);
        return list;
    }
}

