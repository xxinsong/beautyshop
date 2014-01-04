package com.qimeng.bs.admin.goods.controller;

import java.util.HashMap;
import java.util.Map;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.qimeng.common.Page;
import com.qimeng.bs.admin.goods.bean.DmAdvertisement;
import com.qimeng.bs.admin.goods.service.DmAdvertisementService;
@Controller
@RemoteProxy
public class DmAdvertisementController {
	@Autowired
	private DmAdvertisementService dmAdvertisementService;

	@RemoteMethod
	public Page queryPage(Map params, int pageIndex, int pageSize) {
		Page<DmAdvertisement> page = new Page<DmAdvertisement>(pageIndex,pageSize);
		page.setParams(params);
		page = dmAdvertisementService.queryPage(page);
		return page;
	}
	
	@RemoteMethod
	public Map<String,Object> addAction(DmAdvertisement ad){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		ret.put("msg", "添加成功");
		dmAdvertisementService.save(ad);
		return ret;
	}
	
	@RemoteMethod
	public Map<String,Object> updateAction(DmAdvertisement ad){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		ret.put("msg", "更新成功");
		dmAdvertisementService.update(ad);
		return ret;
	}
	
	@RemoteMethod
	public Map<String,Object> deleteAction(DmAdvertisement ad){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		ret.put("msg", "删除成功");
		dmAdvertisementService.delete(ad);
		return ret;
	}
}
