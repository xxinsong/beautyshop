package com.qimeng.bs.admin.security.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.qimeng.bs.admin.security.bean.DmOrganization;
import com.qimeng.bs.admin.security.service.DmOrganizationService;

@Controller
@RemoteProxy
public class OrganizationController {

	@Autowired
	private DmOrganizationService dmOrganizationService;

	@RemoteMethod
	public List<DmOrganization> query(DmOrganization dmorg){
		List<DmOrganization> ret = dmOrganizationService.query(dmorg);
		return  ret;
	}
	
	@RemoteMethod
	public Boolean existChildrenOrg(DmOrganization dmorg){
		Boolean ret = true;
		List<DmOrganization> childrenOrgs = dmOrganizationService.query(dmorg);
		if(childrenOrgs.isEmpty())
			ret = false;
		return  ret;
	}
	
	@RemoteMethod
	public Map<String,Object> addAction(DmOrganization dmorg){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		ret.put("msg", "添加成功");
		dmOrganizationService.save(dmorg);
		ret.put("me", dmorg);
		return ret;
	}
	
	@RemoteMethod
	public Map<String,Object> updateAction(DmOrganization dmorg){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		ret.put("msg", "更新成功");
		dmOrganizationService.update(dmorg);
		return ret;
	}
	
	@RemoteMethod
	public Map<String,Object> deleteAction(DmOrganization dmorg){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		ret.put("msg", "删除成功");
		dmOrganizationService.delete(dmorg);
		return ret;
	}
}
