package com.qimeng.bs.system.menu.bean;

import java.util.List;
import java.util.Map;

import org.directwebremoting.annotations.DataTransferObject;

@DataTransferObject
@SuppressWarnings("unchecked")
public class DmMenu {
	private Integer menuId;

	private String menuCode;

	private String menuName;

	private Integer parentMenu;

	private String url;

	private String icon;

	private String isLeaf;

	private String menuPath;

	private String menuDesc;

	private Integer menuOrder;
	
	private List<DmMenu> children;
	
	public void loadFromMap(Map data) {
		this.setMenuId(Integer.parseInt((String) data.get("menuId")));
		this.setMenuCode((String) data.get("menuCode"));
		this.setMenuName((String) data.get("menuName"));
		this.setParentMenu(Integer.parseInt((String) data.get("parentMenu")));
		this.setUrl((String) data.get("url"));
		this.setIcon((String) data.get("icon"));
		this.setIsLeaf((String) data.get("isLeaf"));
		this.setMenuPath((String) data.get("menuPath"));
		this.setMenuDesc((String) data.get("menuDesc"));
		this.setMenuOrder(((String) data.get("menuOrder")).equals("") ? null : Integer.parseInt((String) data.get("menuOrder")));
	}

	public Integer getMenuId() {
		return menuId;
	}

	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}

	public String getMenuCode() {
		return menuCode;
	}

	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public Integer getParentMenu() {
		return parentMenu;
	}

	public void setParentMenu(Integer parentMenu) {
		this.parentMenu = parentMenu;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getIsLeaf() {
		return isLeaf;
	}

	public void setIsLeaf(String isLeaf) {
		this.isLeaf = isLeaf;
	}

	public String getMenuPath() {
		return menuPath;
	}

	public void setMenuPath(String menuPath) {
		this.menuPath = menuPath;
	}

	public String getMenuDesc() {
		return menuDesc;
	}

	public void setMenuDesc(String menuDesc) {
		this.menuDesc = menuDesc;
	}

	public Integer getMenuOrder() {
		return menuOrder;
	}

	public void setMenuOrder(Integer menuOrder) {
		this.menuOrder = menuOrder;
	}

	public List<DmMenu> getChildren() {
		return children;
	}

	public void setChildren(List<DmMenu> children) {
		this.children = children;
	}
	
}