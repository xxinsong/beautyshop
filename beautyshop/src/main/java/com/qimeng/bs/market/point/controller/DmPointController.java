package com.qimeng.bs.market.point.controller;

import com.qimeng.common.Page;
import com.qimeng.bs.common.controller.GenericController;
import com.qimeng.bs.login.bean.LoginInfo;
import com.qimeng.bs.market.point.service.DmPointService;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@RemoteProxy
@Controller
@RequestMapping("/point")
public class DmPointController extends GenericController{
  
  @Autowired
  private DmPointService dmPointService;
  
  @RemoteMethod
  public Page selectCustPointList(Map params, int pageIndex, int pageSize){
      LoginInfo currUser = getCurrentLoginUser();
      params.put("merchantId", currUser.getMerchantId());
      return dmPointService.selectCustPointList(params, pageIndex, pageSize);
  }
  
  @RequestMapping("mypoint")
  public String listMyPoint(HttpServletRequest request){
      return "/market/point/mypoint.jsp";
  }
}
