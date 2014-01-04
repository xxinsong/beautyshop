package com.qimeng.bs.system.menu.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.qimeng.common.Constants;
import com.qimeng.common.Page;
import com.qimeng.bs.admin.security.bean.DmPrivilege;
import com.qimeng.bs.admin.security.service.DmStaffService;
import com.qimeng.bs.common.controller.GenericController;
import com.qimeng.bs.login.bean.AdminLoginInfo;
import com.qimeng.bs.system.menu.service.MenuService;

@Controller
@RemoteProxy
@SuppressWarnings("unchecked")
public class MenuController extends GenericController {

	@Autowired
	private MenuService service;
	
	@Autowired
	private DmStaffService dmStaffService;

	public Page searchMenus(Map params, int pageIndex, int pageSize) {
		Page result = service.searchMenus(params, pageIndex, pageSize);
		return result;
	}
	
	public Page searchMenus(Map params) {
		int pageIndex = Integer.parseInt((String) params.get("page"));
		int pageSize = Integer.parseInt((String) params.get("rows"));
		Page result = service.searchMenus(params, pageIndex, pageSize);
		return result;
	}
	
	public List searchMenusTree(Map params) {
		List result = service.searchMenusTree(params);
		return result;
	}
	
	public List searchAllMenus(Map params) {
		AdminLoginInfo loginInfo = (AdminLoginInfo) getSessionAttribute(Constants.ADMIN_LOGIN_INFO);
		List result = new ArrayList();
		if (dmStaffService.isAdmin(loginInfo.getStaffId())) {
			result.addAll(service.searchAdminMenus(params));
		} else {
			List<DmPrivilege> privs = loginInfo.getPrivs();
			List privIds = new ArrayList();
			for (DmPrivilege priv : privs) {
				if ("MENU".equals(priv.getType())) {
					privIds.add(priv.getPrivilegeId());
				}
			}
			params.put("privIds", privIds);
			params.put("staffId", loginInfo.getStaffId());
			result.addAll(service.searchAllMenus(params));
		}
		return result;
	}
	
	public boolean insertMenu(Map params) {
		return service.insertMenu(params);
	}
	
	public boolean updateMenu(Map params) {
		return service.updateMenu(params);
	}
	
	public boolean deleteMenu(Map params) {
		return service.deleteMenu(params);
	}
}
