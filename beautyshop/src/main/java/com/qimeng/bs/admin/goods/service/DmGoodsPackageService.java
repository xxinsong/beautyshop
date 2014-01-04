package com.qimeng.bs.admin.goods.service;

import java.util.List;
import java.util.Set;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qimeng.common.Page;
import com.qimeng.bs.admin.goods.bean.DmGoods;
import com.qimeng.bs.admin.goods.bean.DmGoodsPackage;
import com.qimeng.bs.admin.goods.dao.DmGoodsMapper;
import com.qimeng.bs.admin.goods.dao.DmGoodsPackageMapper;
@Service
public class DmGoodsPackageService {

	@Autowired
	private DmGoodsPackageMapper dmGoodsPackageMapper;
	@Autowired
	private DmGoodsMapper dmGoodsMapper;
	private final Logger logger = Logger.getLogger(DmGoodsPackageService.class);
	
	public Page<DmGoodsPackage> queryPage(Page<DmGoodsPackage> page){
		List<DmGoodsPackage> rows = dmGoodsPackageMapper.findAllGoodPackages(page);
		page.setRows(rows);
		return page;
	}
	
	@Transactional
	public int save(DmGoodsPackage goodPackage){
		int rows = dmGoodsPackageMapper.insert(goodPackage);
		return rows;
	}
	
	
	@Transactional
	public int update(DmGoodsPackage goodPackage){
		return dmGoodsPackageMapper.updateByPrimaryKeySelective(goodPackage);
	}
	
	@Transactional
	public int delete(DmGoodsPackage goodPackage){
		 Integer packageId = goodPackage.getPackageId();
		 dmGoodsPackageMapper.unattachGoodsByPackageId(packageId);
		 return dmGoodsPackageMapper.deleteByPrimaryKey(packageId);
	}
	
	@Transactional
	public void attachGoods(DmGoodsPackage goodPackage){
		 Set<DmGoods> goodsets = goodPackage.getDmGoods();
		 if(!goodsets.isEmpty()){
			 dmGoodsPackageMapper.attachGoods(goodPackage);
		 }
	}
	
	@Transactional
	public void unattachGood(Integer packageId,Integer goodsId){
		dmGoodsPackageMapper.unattachGood(packageId, goodsId);
	}
}
