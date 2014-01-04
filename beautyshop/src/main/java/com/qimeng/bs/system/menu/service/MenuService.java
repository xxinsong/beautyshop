package com.qimeng.bs.system.menu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qimeng.common.Page;
import com.qimeng.bs.system.menu.bean.DmMenu;
import com.qimeng.bs.system.menu.dao.DmMenuMapper;

@Service
@SuppressWarnings("unchecked")
public class MenuService {

	@Autowired
	private DmMenuMapper dmMenuMapper;

	public Page searchMenus(Map params, int pageIndex, int pageSize) {
		Page page = new Page();
		page.setPageIndex(pageIndex);
		page.setPageSize(pageSize);
		page.setRows(dmMenuMapper.searchAllMenus(page));
		return page;
	}
	
	public List searchMenusTree(Map params) {
		List<DmMenu> dmMenus = dmMenuMapper.searchMenus(params);
//		for (DmMenu dmMenu : dmMenus) {
//			Map m = new HashMap();
//			m.put("parentMenu", dmMenu.getMenuId());
//			dmMenu.setChildren(searchMenusTree(m));
//		}
		return dmMenus;
	}
	
	public List searchAdminMenus(Map params) {
		List<DmMenu> dmMenus = dmMenuMapper.searchMenus(params);
		for (DmMenu dmMenu : dmMenus) {
			Map m = new HashMap();
			m.put("parentMenu", dmMenu.getMenuId());
			dmMenu.setChildren(searchAdminMenus(m));
		}
		return dmMenus;
	}
	
	public List searchAllMenus(Map params) {
		List<DmMenu> dmMenus = dmMenuMapper.searchMenusByPriv(params);
		for (DmMenu dmMenu : dmMenus) {
			Map m = new HashMap();
			m.put("parentMenu", dmMenu.getMenuId());
			m.put("privIds", params.get("privIds"));
			m.put("staffId", params.get("staffId"));
			dmMenu.setChildren(searchAllMenus(m));
		}
		return dmMenus;
	}

	public List searchChildMenu(String parentMenu) {
		Map params = new HashMap();
		params.put("parentMenu", parentMenu);
		List<DmMenu> children = dmMenuMapper.searchMenus(params);
		for (DmMenu dmMenu : children) {
			dmMenu.setChildren(searchChildMenu(String.valueOf(dmMenu.getParentMenu())));
		}
		return children;
	}

	public boolean insertMenu(Map params) {
		dmMenuMapper.insertMenu(params);
		return true;
	}
	
	public boolean updateMenu(Map params) {
		DmMenu dmMenu = new DmMenu();
		dmMenu.loadFromMap(params);
		dmMenuMapper.updateByPrimaryKeySelective(dmMenu);
		return true;
	}
	
	public boolean deleteMenu(Map params) {
		dmMenuMapper.deleteByPrimaryKey(Integer.parseInt((String) params.get("menuId")));
		return true;
	}
}
