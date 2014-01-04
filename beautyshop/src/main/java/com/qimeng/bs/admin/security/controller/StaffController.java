package com.qimeng.bs.admin.security.controller;

import java.util.HashMap;
import java.util.Map;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.qimeng.common.Page;
import com.qimeng.bs.admin.security.bean.DmStaff;
import com.qimeng.bs.admin.security.service.DmStaffService;

@Controller
@RemoteProxy
@SuppressWarnings("unchecked")
public class StaffController {

	@Autowired
	private DmStaffService dmStaffService;

	@RemoteMethod
	public Page queryPage(Map params, int pageIndex, int pageSize) {
		Page<DmStaff> page = new Page<DmStaff>(pageIndex,pageSize);
		page.setParams(params);
		page = dmStaffService.queryPage(page);
		return page;
	}
	
	@RemoteMethod
	public Map<String,Object> addAction(DmStaff staff){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		ret.put("msg", "添加成功");
		dmStaffService.save(staff);
		return ret;
	}
	
	@RemoteMethod
	public Map<String,Object> updateAction(DmStaff staff){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		ret.put("msg", "更新成功");
		dmStaffService.update(staff);
		return ret;
	}
	
	@RemoteMethod
	public Map<String,Object> deleteAction(DmStaff staff){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		ret.put("msg", "删除成功");
		dmStaffService.delete(staff);
		return ret;
	}
	
	@RemoteMethod
	public Map<String,Object> attachPrivilege(DmStaff staff){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		ret.put("msg", "个性化权限分配成功");
		dmStaffService.attachPrivilege(staff);
		return ret;
	} 
	
	@RemoteMethod
	public Map<String,Object> attachRole(DmStaff staff){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		ret.put("msg", "角色分配成功");
		dmStaffService.attachRole(staff);
		return ret;
	} 
}
