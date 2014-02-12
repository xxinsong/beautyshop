package com.qimeng.bs.market.consult.controller;

import com.qimeng.common.Page;
import com.qimeng.bs.common.controller.GenericController;
import com.qimeng.bs.login.bean.LoginInfo;
import com.qimeng.bs.market.consult.bean.DmConsultation;
import com.qimeng.bs.market.consult.service.DmMyConsultService;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RemoteProxy
@Controller
@RequestMapping("/consult")
public class DmMyConsultController extends GenericController {
  @Autowired
  DmMyConsultService dmMyConsultService;
  
  @RequestMapping("myconsult")
  public String listMyConsult(HttpServletRequest request) {
    return "/market/consult/myconsult.jsp";
  }
  
  @RemoteMethod
  @SuppressWarnings({"rawtypes", "unchecked"})
  public Page selectCustConsultList(Map params, int pageIndex, int pageSize) {
    LoginInfo currUser = getCurrentLoginUser();
    params.put("merchantId", currUser.getMerchantId());
    return dmMyConsultService.selectMyConsultGoodsList(params, pageIndex,
        pageSize);
  }
  
  @RemoteMethod
  @SuppressWarnings("rawtypes")
  public List getGoodsByIdAndMerchantId(DmConsultation dmConsultation) {
    LoginInfo currUser = getCurrentLoginUser();
    dmConsultation.setMerchantId(currUser.getMerchantId());
    return dmMyConsultService.getMyConsultByGoodsId(dmConsultation);
  }
  
  @RemoteMethod
  public String inserMyConsult(DmConsultation dmConsultation) {
    LoginInfo currUser = getCurrentLoginUser();
    dmConsultation.setMerchantId(currUser.getMerchantId());
    dmConsultation.setCommitTime(new Date());
    return dmMyConsultService.inserMyConsult(dmConsultation);
  }
  
  @RemoteMethod
  public Page queryPage(Map params, int pageIndex, int pageSize) {
    Page<DmConsultation> page = new Page<DmConsultation>(pageIndex, pageSize);
    page.setParams(params);
    page = dmMyConsultService.queryPage(page);
    return page;
  }
  
  @RemoteMethod
  public Map<String, Object> updateAction(DmConsultation dmConsultation) {
      Map<String, Object> ret = new HashMap<String, Object>();
      ret.put("success", true);
      ret.put("msg", "回复成功");
      dmConsultation.setReplyTime(new Date());
      dmMyConsultService.update(dmConsultation);
      return ret;
  }
  
	@RemoteMethod
	public String userMes() {
		LoginInfo currUser = getCurrentLoginUser();
		if (currUser != null) {
			return "user";
		} else {
			return "noUser";
		}
	}
}
