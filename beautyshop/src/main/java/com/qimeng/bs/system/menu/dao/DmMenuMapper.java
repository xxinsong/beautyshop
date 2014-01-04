package com.qimeng.bs.system.menu.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.qimeng.common.Page;
import com.qimeng.bs.system.menu.bean.DmMenu;

@Repository
@SuppressWarnings("unchecked")
public interface DmMenuMapper {
	int deleteByPrimaryKey(Integer menuId);

	int insert(DmMenu record);
	
	int insertMenu(Map record);

	int insertSelective(DmMenu record);

	DmMenu selectByPrimaryKey(Integer menuId);

	int updateByPrimaryKeySelective(DmMenu record);

	int updateByPrimaryKey(DmMenu record);

	List<DmMenu> searchAllMenus();

	List<DmMenu> searchAllMenus(Page page);
	
	List<DmMenu> searchMenus(Map params);
	
	List<DmMenu> searchMenusByPriv(Map params);
}