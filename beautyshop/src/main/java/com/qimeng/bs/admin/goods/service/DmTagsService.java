package com.qimeng.bs.admin.goods.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qimeng.bs.admin.goods.bean.DmTags;
import com.qimeng.bs.admin.goods.bean.DmTagsItem;
import com.qimeng.bs.admin.goods.dao.DmGoodsTagMapper;
import com.qimeng.bs.admin.goods.dao.DmGoodsTagValueMapper;
import com.qimeng.bs.admin.goods.dao.DmTagsItemMapper;
import com.qimeng.bs.admin.goods.dao.DmTagsMapper;
@Service
public class DmTagsService {
	
		@Autowired
		public DmTagsMapper dmTagsMapper ;
		@Autowired
		private DmGoodsTagMapper dmGoodsTagMapper;
		@Autowired
		private DmTagsItemMapper dmTagsItemMapper;
		@Autowired
		private DmGoodsTagValueMapper dmGoodsTagValueMapper;
		
		public List<DmTags> query(DmTags tag){
			 List<DmTags> ret = dmTagsMapper.findTags(tag);
			 return ret;
		}
		
		@Transactional
		public int save(DmTags tag){
			return dmTagsMapper.insert(tag);
		}
		
		/**
		 * 更新组织,级联更新组织路径
		 * @param tag
		 * @return
		 */
		@Transactional
		public int update(DmTags tag){
			return dmTagsMapper.updateByPrimaryKeySelective(tag);
		}
		
		/**
		 * 级联删除
		 * @param tag
		 * @return
		 */
		@Transactional
		public int delete(DmTags tag){
			//删除当前标签与所有商品的关联关系
			dmGoodsTagMapper.deleteByTagId(tag.getTagId());
			
			DmTagsItem itemsCondtion = new DmTagsItem();
			itemsCondtion.setTagId(tag.getTagId());
			List<DmTagsItem> itemLists = dmTagsItemMapper.findTagsItems(itemsCondtion);
			for(DmTagsItem item:itemLists){//获取当前标签的所有标签值：
				//遍历当前标签下的标签值集合，删除商品标签可选值记录
				dmGoodsTagValueMapper.deleteAllTagsItemsByItemId(item.getItemId());
			}
			//删除当前标签的所有标签值
			dmTagsItemMapper.unattachTag(tag.getTagId());
			
			//删除当前标签
			return dmTagsMapper.deleteByPrimaryKey(tag.getTagId());
		}
		
		
		private DmTags getChildrenCond(DmTags tag){
			DmTags deleteCond = new DmTags();
			deleteCond.setParentTagId(tag.getTagId()==null?-9999:tag.getTagId());
			return deleteCond;
		}
		
		
		
}
