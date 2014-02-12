package com.qimeng.bs.admin.security.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.qimeng.bs.admin.security.bean.DmPrivilege;
import com.qimeng.bs.admin.security.service.DmPrivilegeService;

@Controller
@RemoteProxy
public class PrivilegeController {

	@Autowired
	private DmPrivilegeService dmPrivilegeService;

	@RemoteMethod
	public List<DmPrivilege> query(DmPrivilege dmPrivilege){
		Assert.isTrue("false".equals(dmPrivilege.getChecked()), "if you bound privilege with the role or staff Instance,please refer to queryPrivilegeOnStaff method");
		List<DmPrivilege> ret = dmPrivilegeService.query(dmPrivilege);
		return  ret;
	}
	
	/**
	 * 获取与员工绑定的权限实例集合
	 * @param dmPrivilege
	 * @return
	 */
	@RemoteMethod
	public List<DmPrivilege> queryPrivilegeOnStaff(DmPrivilege dmPrivilege){
		Assert.isTrue(dmPrivilege.getStaffId()!=-1, "please offer the staffId~");
		return dmPrivilegeService.query(dmPrivilege);
	}
	
	/**
	 * 获取与角色绑定的权限实例集合
	 * @param dmPrivilege
	 * @return
	 */
	@RemoteMethod
	public List<DmPrivilege> queryPrivilegeOnRole(DmPrivilege dmPrivilege){
		Assert.isTrue(dmPrivilege.getRoleId()!=-1, "please offer the roleId~");
		return dmPrivilegeService.query(dmPrivilege);
	}
	
	@RemoteMethod
	public Map<String,Object> addAction(DmPrivilege pri){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		ret.put("msg", "添加成功");
		dmPrivilegeService.save(pri);
		ret.put("me", pri);
		return ret;
	}
	
	@RemoteMethod
	public Map<String,Object> updateAction(DmPrivilege pri){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		ret.put("msg", "更新成功");
		dmPrivilegeService.update(pri);
		return ret;
	}
	
	@RemoteMethod
	public Map<String,Object> deleteAction(DmPrivilege pri){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		ret.put("msg", "删除成功");
		dmPrivilegeService.delete(pri);
		return ret;
	}
}
