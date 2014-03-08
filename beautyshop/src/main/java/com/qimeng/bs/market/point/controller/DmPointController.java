package com.qimeng.bs.market.point.controller;

import com.qimeng.bs.market.point.bean.DmPoints;
import com.qimeng.common.Page;
import com.qimeng.bs.common.controller.GenericController;
import com.qimeng.bs.login.bean.LoginInfo;
import com.qimeng.bs.market.point.service.DmPointService;
import org.apache.commons.collections.MapUtils;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RemoteProxy
@Controller
@RequestMapping("/point")
public class DmPointController extends GenericController{
  
  @Autowired
  private DmPointService dmPointService;
  
  @RemoteMethod
  public Page queryMyPoints(Map params, int pageIndex, int pageSize){
      LoginInfo currUser = getCurrentLoginUser();
//      params.put("merchantId", currUser.getUserId());
      Page page = new Page();
      page.setPageCount(1);
      page.setTotal(1);
      DmPoints points = dmPointService.selectPointsByUserId(currUser.getUserId());
      List list = new ArrayList();
      list.add(points);
      page.setRows(list);
      return page;
  }

  @RemoteMethod
  public Page queryAllPoints(Map params, int pageIndex, int pageSize){
//      LoginInfo currUser = getCurrentLoginUser();
//      params.put("merchantId", currUser.getMerchantId());
      return dmPointService.queryAllPoints(pageIndex, pageSize);
  }

    @RemoteMethod
    public boolean exchangePoints(Map params){
//      LoginInfo currUser = getCurrentLoginUser();
//      params.put("merchantId", currUser.getMerchantId());
        return dmPointService.exchangePoints(MapUtils.getInteger(params,"userId"),MapUtils.getInteger(params,"points"));
    }

  @RequestMapping("mypoint")
  public String listMyPoint(HttpServletRequest request){
      return "/market/point/mypoint.jsp";
  }
}
