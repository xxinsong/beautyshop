package com.qimeng.bs.admin.goods.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.qimeng.bs.admin.goods.bean.DmTags;
import com.qimeng.bs.admin.goods.service.DmGoodsTagService;
import com.qimeng.bs.admin.goods.service.DmTagsService;
import com.qimeng.bs.common.controller.GenericController;
import com.qimeng.bs.login.bean.LoginInfo;

@Controller
@RemoteProxy
public class TagsController extends GenericController{

	@Autowired
	private DmTagsService dmTagsService;
	@Autowired
	private DmGoodsTagService dmGoodsTagService;

	@RemoteMethod
	public List<DmTags> query(DmTags dmtag){
		List<DmTags> ret = dmTagsService.query(dmtag);
		return  ret;
	}
	
	@RemoteMethod
	public Boolean existChildrenTag(DmTags dmtag){
		Boolean ret = true;
		List<DmTags> children = dmTagsService.query(dmtag);
		if(children.isEmpty())
			ret = false;
		return  ret;
	}
	
	@RemoteMethod
	public Map<String,Object> addAction(DmTags dmtag){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		ret.put("msg", "添加成功");
		LoginInfo loginInfo = getCurrentLoginUser();
		if(loginInfo!=null&&loginInfo.getUserId()!=0){
		  dmtag.setCreateOperId(loginInfo.getUserId());
		}
		dmTagsService.save(dmtag);
		ret.put("me", dmtag);
		return ret;
	}
	
	@RemoteMethod
	public Map<String,Object> updateAction(DmTags dmtag){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		ret.put("msg", "更新成功");
		dmTagsService.update(dmtag);
		return ret;
	}
	
	@RemoteMethod
	public Map<String,Object> deleteAction(DmTags dmtag){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		ret.put("msg", "删除成功");
		dmTagsService.delete(dmtag);
		return ret;
	}
	
	@RemoteMethod
    public Boolean exitsChildrenCheckedTags(DmTags dmtag){
		Boolean ret = dmGoodsTagService.exitsChildrenCheckedTags(dmtag);
	    return ret;
	}
}
