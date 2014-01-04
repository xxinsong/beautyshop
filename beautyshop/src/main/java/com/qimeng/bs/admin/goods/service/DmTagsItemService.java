package com.qimeng.bs.admin.goods.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qimeng.common.Page;
import com.qimeng.bs.admin.goods.bean.DmTagsItem;
import com.qimeng.bs.admin.goods.dao.DmGoodsTagValueMapper;
import com.qimeng.bs.admin.goods.dao.DmTagsItemMapper;

@Service
public class DmTagsItemService {
	
	@Autowired
	public DmTagsItemMapper dmTagsItemMapper ;
	@Autowired
	private DmGoodsTagValueMapper dmGoodsTagValueMapper;
	
	public Page<DmTagsItem> queryPage(Page<DmTagsItem> page){
		List<DmTagsItem> rows = dmTagsItemMapper.findAllTagsItems(page);
		page.setRows(rows);
		return page;
	}
	
	@Transactional
	public int save(DmTagsItem item){
		int rows = dmTagsItemMapper.insert(item);
		return rows;
	}
	
	@Transactional
	public int update(DmTagsItem item){
		return dmTagsItemMapper.updateByPrimaryKeySelective(item);
	}
	
	@Transactional
	public int delete(DmTagsItem item){
		 Integer itemId = item.getItemId();
		 //根据当前标签值id删除商品可选标签值所有记录
		 dmGoodsTagValueMapper.deleteAllTagsItemsByItemId(itemId);
		 return dmTagsItemMapper.deleteByPrimaryKey(itemId);
	}
	@Transactional
	public  List<Map>  findGoodsTag(Map  param){
	 
		List<Map> result =  dmTagsItemMapper.findGoodsTag(param);
		return result;
	}
}
