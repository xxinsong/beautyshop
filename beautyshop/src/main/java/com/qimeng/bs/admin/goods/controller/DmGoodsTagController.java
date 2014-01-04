package com.qimeng.bs.admin.goods.controller;

import java.util.Map;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.qimeng.common.Page;
import com.qimeng.bs.admin.goods.bean.DmTags;
import com.qimeng.bs.admin.goods.service.DmGoodsTagService;

@Controller
@RemoteProxy
public class DmGoodsTagController {

	@Autowired
	private DmGoodsTagService dmGoodsTagService;
	
	/**
	 * 根据商品查找商品所有的标签--分页显示
	 * @param params
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	@RemoteMethod
	public Page queryPageTagsOnGoods(Map params, int pageIndex, int pageSize){
		Page<DmTags> page = new Page<DmTags>(pageIndex,pageSize);
		page.setParams(params);
		page = dmGoodsTagService.findAllTagOnGoods(page);
		return page;
	}
}
