package com.qimeng.bs.admin.goods.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.qimeng.common.Page;
import com.qimeng.bs.admin.goods.bean.DmGoods;
import com.qimeng.bs.admin.goods.bean.DmGoodsTag;
import com.qimeng.bs.admin.goods.bean.DmTags;
import com.qimeng.bs.admin.goods.bean.DmTagsItem;
import com.qimeng.bs.admin.goods.dao.DmGoodsMapper;
import com.qimeng.bs.admin.goods.dao.DmGoodsTagMapper;
import com.qimeng.bs.admin.goods.dao.DmGoodsTagValueMapper;
import com.qimeng.bs.admin.goods.dao.DmTagsItemMapper;
import com.qimeng.bs.admin.goods.dao.DmTagsMapper;

@Service
public class DmGoodsTagService {
	@Autowired
	public DmGoodsTagMapper dmGoodsTagMapper ;
	@Autowired
	public DmTagsMapper dmTagsMapper ;
	@Autowired
	private DmGoodsMapper dmGoodsMapper;
	@Autowired
	public DmTagsItemMapper dmTagsItemMapper ;
	@Autowired
	public DmGoodsTagValueMapper dmGoodsTagsValueMapper ;
	
	public Page<DmTags> findAllTagOnGoods(Page<DmTags> page){
		List<DmTags> rows = dmGoodsTagMapper.findAllTags(page);
		page.setRows(rows);
		return page;
	}
	
	/**
	 * 根据tag中的parentTagId查询是否孩子节点checked状态为true的，
	 * 任何一个孩子节点状态checked为true则返回true
	 * @param tag
	 * @return
	 */
	public Boolean exitsChildrenCheckedTags(DmTags tag){
		Boolean result = false;
		 List<DmTags> list = dmTagsMapper.findTags(tag);
		 for(DmTags t: list){
			 if("true".equals(t.getChecked())){
				 result = true;
				 break;
			 }
		 }
		return result;
	}
	
	/**
	 * 商品绑定标签（标签默认所有条目作为商品可选值）
	 * @param good
	 */
	@Transactional
	public void attachTagsAndAllItems(DmGoods good){
		Set<DmTags> goodtags = good.getTags();
		DmGoodsTag goodsTag = null;
		for(DmTags tag : goodtags){
			goodsTag = new DmGoodsTag(tag.getTagId(),good.getGoodsId());
			dmGoodsTagMapper.insert(goodsTag);                          //持久化当前商品与当前标签的关系
			good.setTagGroupId(goodsTag.getTagGroupId());               //建立当前商品与当前标签的关系
			List<DmTagsItem> items = dmTagsItemMapper.selectTagsItems(tag.getTagId());//根据tagId查找条目
			if(!items.isEmpty()){
				good.setTagsItems(new HashSet<DmTagsItem>(items));           //建立当前商品与当前标签的标签值关系--默认是当前标签的所有标签值
				dmGoodsTagsValueMapper.attachGoodTagsItems(good);
			}
		}
	}
	
	/**
	 * 接触商品特定标签的绑定
	 * @param tagGroupId
	 */
	@Transactional
	public void releasGoodTags(Integer tagGroupId){
		dmGoodsTagMapper.deleteByPrimaryKey(tagGroupId);
		dmGoodsTagsValueMapper.releaseAllTagsItems(tagGroupId);
	}
}
