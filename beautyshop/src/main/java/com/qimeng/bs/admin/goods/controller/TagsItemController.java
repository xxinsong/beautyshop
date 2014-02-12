package com.qimeng.bs.admin.goods.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;

import com.qimeng.common.Page;
import com.qimeng.bs.admin.goods.bean.DmTagsItem;
import com.qimeng.bs.admin.goods.service.DmTagsItemService;

@Controller
@RemoteProxy
@SuppressWarnings("unchecked")
public class TagsItemController {

	@Autowired
	private DmTagsItemService dmTagsItemService;

	/**
	 * params中tagGroupId!=null
	 * -->查询特定商品params.tagId标签的条目列表(带checkbox状态,见DmTagsItem.getChecked())
	 * @param params
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	@RemoteMethod
	public Page queryPage(Map params, int pageIndex, int pageSize) {
		Page<DmTagsItem> page = new Page<DmTagsItem>(pageIndex,pageSize);
		page.setParams(params);
		page = dmTagsItemService.queryPage(page);
		return page;
	}
	
	@RemoteMethod
	public Map<String,Object> addAction(DmTagsItem item){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		ret.put("msg", "添加成功");
		dmTagsItemService.save(item);
		return ret;
	}
	
	@RemoteMethod
	public Map<String,Object> updateAction(DmTagsItem item){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		ret.put("msg", "更新成功");
		dmTagsItemService.update(item);
		return ret;
	}
	
	@RemoteMethod
	public Map<String,Object> deleteAction(DmTagsItem item){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		ret.put("msg", "删除成功");
		dmTagsItemService.delete(item);
		return ret;
	}
	
	@RemoteMethod
	public List<Map>  findGoodsTag(Map param){
		return dmTagsItemService.findGoodsTag(param);
	}
	
}
