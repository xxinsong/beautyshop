package com.qimeng.bs.market.order.controller;

import com.qimeng.bs.common.controller.GenericController;
import com.qimeng.bs.login.bean.AdminLoginInfo;
import com.qimeng.bs.market.order.bean.DmOrderInvoice;
import com.qimeng.bs.market.order.service.DmOrderInvoiceService;
import com.qimeng.common.Constants;
import com.qimeng.common.Page;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RemoteProxy
@SuppressWarnings("unchecked")
public class DmOrderInvoiceController extends GenericController {

	@Autowired
	private DmOrderInvoiceService dmOrderInvoiceService;
	
	@RemoteMethod
	public Page selectPage(Map params, int pageIndex, int pageSize) {
		return dmOrderInvoiceService.selectPage(params, pageIndex, pageSize);
	}
	
	@RemoteMethod
	public Map<String,Object> updateInvoice(DmOrderInvoice dmOrderInvoice){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		dmOrderInvoice.setIsDrawup("Y");
		dmOrderInvoice.setDrawupTime(new Date());

        AdminLoginInfo loginInfo = (AdminLoginInfo) getSessionAttribute(Constants.ADMIN_LOGIN_INFO);
		if(loginInfo!=null && !StringUtils.isEmpty(loginInfo.getStaffName())){
			dmOrderInvoice.setOperator(loginInfo.getStaffName());		
		}
		dmOrderInvoiceService.issueInvoice(dmOrderInvoice);
		return ret;
	}
	
	@RemoteMethod
	public Map<String,Object> updateInvoiceNo(DmOrderInvoice dmOrderInvoice){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		dmOrderInvoice.setIsDrawup("N");
		dmOrderInvoice.setDrawupTime(null);
		AdminLoginInfo loginInfo = (AdminLoginInfo) getSessionAttribute(Constants.ADMIN_LOGIN_INFO);
		if(loginInfo!=null && !StringUtils.isEmpty(loginInfo.getStaffName())){
			dmOrderInvoice.setOperator(loginInfo.getStaffName());		
		}
		dmOrderInvoiceService.updateInvoice(dmOrderInvoice);
		return ret;
	}
}
