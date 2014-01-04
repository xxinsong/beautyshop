package com.qimeng.bs.admin.goods.service;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qimeng.bs.admin.goods.bean.DmGoods;
import com.qimeng.bs.admin.goods.bean.DmTagsItem;
import com.qimeng.bs.admin.goods.dao.DmGoodsMapper;
import com.qimeng.bs.admin.goods.dao.DmGoodsTagMapper;
import com.qimeng.bs.admin.goods.dao.DmGoodsTagValueMapper;
import com.qimeng.bs.admin.goods.dao.DmTagsItemMapper;
import com.qimeng.bs.admin.goods.dao.DmTagsMapper;

@Service
public class DmGoodsTagValueService {

	@Autowired
	private DmGoodsMapper dmGoodsMapper;
	@Autowired
	private DmGoodsTagMapper dmGoodsTagMapper;
	@Autowired
	public DmTagsMapper dmTagsMapper ;
	@Autowired
	public DmTagsItemMapper dmTagsItemMapper ;
	@Autowired
	public DmGoodsTagValueMapper dmGoodsTagsValueMapper ;
	
	/**
	 * 绑定特定商品特定标签可选值
	 * @param good
	 */
	@Transactional
	public void attachGoodsTagsItems(DmGoods good){
		Set<DmTagsItem> items = good.getTagsItems();
		dmGoodsTagsValueMapper.releaseAllTagsItems(good.getTagGroupId());
		if(!items.isEmpty()){
			good.setTagsItems(items);           
			dmGoodsTagsValueMapper.attachGoodTagsItems(good);
		}
	}
	
	
}
