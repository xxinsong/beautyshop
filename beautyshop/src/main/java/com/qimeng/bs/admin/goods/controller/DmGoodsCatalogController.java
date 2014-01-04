package com.qimeng.bs.admin.goods.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;

import com.qimeng.bs.admin.goods.bean.DmGoodsCatalog;
import com.qimeng.bs.admin.goods.service.DmGoodsCatalogService;
import com.qimeng.bs.common.controller.GenericController;
import com.qimeng.bs.login.bean.LoginInfo;

@Controller
@RemoteProxy
@SuppressWarnings("unchecked")
public class DmGoodsCatalogController  extends GenericController{
	
	@Autowired
	private DmGoodsCatalogService dmGoodsCatalogService;
	
	@RemoteMethod
	public List<Map> searchAllDmGoodsCatalogs(Map params) {
		List<Map> catas = dmGoodsCatalogService.searchAllDmGoodsCatalogs(params);
		return catas;
	}
	
	@RemoteMethod
	public String queryFullCataName(String catalog_id) {
		return dmGoodsCatalogService.queryFullCataName(catalog_id);
	}
	
	@RemoteMethod
	public List<DmGoodsCatalog> query(DmGoodsCatalog catalog){
		List<DmGoodsCatalog> ret = dmGoodsCatalogService.query(catalog);
		return  ret;
	}
	
	
	@RemoteMethod
	public Boolean existChildrenCatalog(DmGoodsCatalog catalog){
		Boolean ret = true;
		List<DmGoodsCatalog> childrenOrgs = dmGoodsCatalogService.query(catalog);
		if(childrenOrgs.isEmpty())
			ret = false;
		return  ret;
	}
	
	@RemoteMethod
	public Map<String,Object> addAction(DmGoodsCatalog catalog){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		ret.put("msg", "添加成功");
		LoginInfo loginInfo = getCurrentLoginUser();
    if(loginInfo!=null
        &&!StringUtils.isEmpty(loginInfo.getLogonName())){
      catalog.setCreateStaffNo(loginInfo.getLogonName());
    }
		dmGoodsCatalogService.save(catalog);
		ret.put("me", catalog);
		return ret;
	}
	
	@RemoteMethod
	public Map<String,Object> updateAction(DmGoodsCatalog catalog){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		ret.put("msg", "更新成功");
		dmGoodsCatalogService.update(catalog);
		return ret;
	}
	
	@RemoteMethod
	public Map<String,Object> deleteAction(DmGoodsCatalog catalog){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		ret.put("msg", "删除成功");
		dmGoodsCatalogService.delete(catalog);
		return ret;
	}
}
