package com.qimeng.bs.admin.merchant.controller;

import java.util.HashMap;
import java.util.Map;

import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.qimeng.common.Page;
import com.qimeng.bs.admin.merchant.bean.DmMerchant;
import com.qimeng.bs.admin.merchant.service.DmMerchantService;

@Controller
@RemoteProxy
@SuppressWarnings("unchecked")
public class DmMerchantController {

	@Autowired
	private DmMerchantService dmMerchantService;

	public Page queryPage(Map params, int pageIndex, int pageSize) {
		return dmMerchantService.queryPage(params, pageIndex, pageSize);
	}
		
	public Map<String,Object> updateAction(DmMerchant dmMerchant){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		ret.put("msg", "更新成功");
		dmMerchantService.updateMerchant(dmMerchant);
		return ret;
	}
	
	public Map<String,Object> auditYes(DmMerchant dmMerchant){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		dmMerchant.setState("00A");
		dmMerchantService.updateStateByPrimaryKey(dmMerchant);
		return ret;
	}
	
	public Map<String,Object> auditNo(DmMerchant dmMerchant){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		dmMerchant.setState("00L");
		dmMerchantService.updateStateByPrimaryKey(dmMerchant);
		return ret;
	}
	
}
