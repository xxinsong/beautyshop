package com.qimeng.bs.admin.msg.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.qimeng.bs.login.bean.AdminLoginInfo;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qimeng.common.Page;
import com.qimeng.bs.admin.msg.bean.DmSiteMsg;
import com.qimeng.bs.admin.msg.service.DmMessageService;
import com.qimeng.bs.common.controller.GenericController;
import com.qimeng.bs.login.bean.LoginInfo;

@RemoteProxy
@Controller
@RequestMapping("/msg")
public class DmMessageController extends GenericController {
  
  @Autowired
  DmMessageService dmMessageService;
  
  @RequestMapping("mymessage")
  public String listMyMessage(HttpServletRequest request) {
    return "/market/msg/mymessage.jsp";
  }
  
  @RemoteMethod
  @SuppressWarnings({"rawtypes", "unchecked"})
  public Page selectMyMessageList(Map params, int pageIndex, int pageSize) {
    Page<DmSiteMsg> page = new Page<DmSiteMsg>(pageIndex, pageSize);
    LoginInfo currUser = getCurrentLoginUser();
    if (currUser != null) {
      params.put("receiverId", currUser.getUserId());
      params.put("receiverAll", true);
      params.put("orderbySendTime", "desc");
      page.setParams(params);
      page = dmMessageService.queryPage(page);
    }
    return page;
  }
  
  @SuppressWarnings({ "rawtypes", "unchecked" })
  @RemoteMethod
  public Page queryPage(Map params, int pageIndex, int pageSize) {
    Page<DmSiteMsg> page = new Page<DmSiteMsg>(pageIndex, pageSize);
    page.setParams(params);
    page = dmMessageService.queryPage(page);
    return page;
  }
  
  
  @RemoteMethod
  public Map<String, Object> addAction(DmSiteMsg siteMsg) {
      Map<String, Object> ret = new HashMap<String, Object>();
      ret.put("success", true);
      ret.put("msg", "添加成功");
      AdminLoginInfo loginUser = getCurrentLoginAdmin();
      if(loginUser!=null){
        siteMsg.setSendUser(loginUser.getStaffId());
      }
      siteMsg.setSendTime(new Date());
      dmMessageService.save(siteMsg);
      return ret;
  }

  @RemoteMethod
  public Map<String, Object> updateAction(DmSiteMsg siteMsg) {
      Map<String, Object> ret = new HashMap<String, Object>();
      ret.put("success", true);
      ret.put("msg", "更新成功");
      dmMessageService.update(siteMsg);
      return ret;
  }

  @RemoteMethod
  public Map<String, Object> deleteAction(DmSiteMsg siteMsg) {
      Map<String, Object> ret = new HashMap<String, Object>();
      ret.put("success", true);
      ret.put("msg", "删除成功");
      dmMessageService.delete(siteMsg);
      return ret;
  }
  
  @RemoteMethod
  @SuppressWarnings("rawtypes")
  public Map<String,Object> delMsgReceiverById(Map param){
	  Map<String, Object> ret = new HashMap<String, Object>();
      ret.put("success", true);
      ret.put("msg", "删除成功");
      dmMessageService.delMsgReceiverById(param);
      return ret;
  }
}
