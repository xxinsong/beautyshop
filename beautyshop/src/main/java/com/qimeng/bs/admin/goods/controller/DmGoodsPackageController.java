package com.qimeng.bs.admin.goods.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.qimeng.common.Page;
import com.qimeng.bs.admin.goods.bean.DmGoods;
import com.qimeng.bs.admin.goods.bean.DmGoodsPackage;
import com.qimeng.bs.admin.goods.bean.DmGoodsPlan;
import com.qimeng.bs.admin.goods.service.DmGoodsPackageService;
import com.qimeng.bs.admin.goods.service.DmGoodsPlanService;
@Controller
@RemoteProxy
public class DmGoodsPackageController {
	@Autowired
	private DmGoodsPackageService dmGoodsPackageService;
	@Autowired
  private DmGoodsPlanService dmGoodsPlanService;

	@RemoteMethod
	public Page queryPage(Map params, int pageIndex, int pageSize) {
		Page<DmGoodsPackage> page = new Page<DmGoodsPackage>(pageIndex,pageSize);
		page.setParams(params);
		page = dmGoodsPackageService.queryPage(page);
		return page;
	}
	
	@RemoteMethod
	public Map<String,Object> addAction(DmGoodsPackage goodPackage){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		ret.put("msg", "添加成功");
		goodPackage.setCreateDate(new Date());
		dmGoodsPackageService.save(goodPackage);
		return ret;
	}
	
	@RemoteMethod
	public Map<String,Object> updateAction(DmGoodsPackage goodPackage){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		ret.put("msg", "更新成功");
		
		DmGoodsPackage dbGoodsPackage = dmGoodsPackageService.getGoodsPackageById(goodPackage);
     
     if("00A".equals(goodPackage.getState())){//上架的话~验证时间是否满足生效
       
       if(goodPackage.getState().equals(dbGoodsPackage.getState())){
         ret.put("success", false);
         ret.put("msg", "当前商品包已经上架");
         return ret;
       }
       if(goodPackage.getExpDate().compareTo(new Date())<0){//生效时间 <当前时间 不能上架
         ret.put("success", false);
         ret.put("msg", "当前商品包已过失效时间不能上架");
         return ret;
       }else{
         //判断关联的定价集合有没有一个有效的
         DmGoodsPlan activitedGoodPlan = dmGoodsPlanService.queryActivitedPlan(goodPackage.getPackageId(),DmGoodsPlan.GOODTYPE_VAL2);
         if(activitedGoodPlan==null){
           ret.put("success", false);
           ret.put("msg", "当前商品包关联的定价计划无效或者没有关联定价计划,不能上架");
           return ret;
         }
       }
//       goodPackage.setPutawayTime(new Date());//更新上架时间
     }
		dmGoodsPackageService.update(goodPackage);
		return ret;
	}
	
	@RemoteMethod
	public Map<String,Object> deleteAction(DmGoodsPackage goodPackage){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		ret.put("msg", "删除成功");
		dmGoodsPackageService.delete(goodPackage);
		return ret;
	}
	
	@RemoteMethod
	public Map<String,Object> wrapGoods(DmGoodsPackage goodPackage){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		ret.put("msg", "成功添加商品进商品包");
		dmGoodsPackageService.attachGoods(goodPackage);
		return ret;
	}
	
	@RemoteMethod
	public Map<String,Object> pickOutGood(Map param){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		ret.put("msg", "剔除商品包商品成功");
		Integer packageId = Integer.parseInt(param.get("packageId").toString());
		Integer goodsId = Integer.parseInt(param.get("goodsId").toString());
		dmGoodsPackageService.unattachGood(packageId,goodsId);
		return ret;
	}
	
}
