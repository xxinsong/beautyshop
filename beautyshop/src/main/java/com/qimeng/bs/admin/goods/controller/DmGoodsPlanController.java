package com.qimeng.bs.admin.goods.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.qimeng.common.Page;
import com.qimeng.bs.admin.goods.bean.DmGoodsPlan;
import com.qimeng.bs.admin.goods.service.DmGoodsPlanService;
import com.qimeng.bs.common.controller.GenericController;
import com.qimeng.bs.login.bean.LoginInfo;
@Controller
@RemoteProxy
public class DmGoodsPlanController extends GenericController{
  @Autowired
  private DmGoodsPlanService dmGoodsPlanService;

  @RemoteMethod
  public Page queryPage(Map params, int pageIndex, int pageSize) {
    Page<DmGoodsPlan> page = new Page<DmGoodsPlan>(pageIndex,pageSize);
    page.setParams(params);
    page = dmGoodsPlanService.queryPage(page);
    return page;
  }
  
  @RemoteMethod
  public Map<String,Object> updateStatePlan(DmGoodsPlan goodPlan){
    Map<String,Object> ret = new HashMap<String,Object>();
    ret.put("success", true);
    ret.put("msg", "状态切换成功");
//    DmGoodsPlan dmGoodsPlanService.getGoodsPlanById(goodPlan);
    if("00A".equals(goodPlan.getState())){
      if(goodPlan.getExpDate().compareTo(new Date())<0){//生效时间小于当前时间
        ret.put("success", false);
        ret.put("msg", "当前计划已过失效时间不能生效");
        return ret;
      }
    }
    dmGoodsPlanService.updateState(goodPlan);
    return ret;
  }
  
  @RemoteMethod
  public Map<String,Object> addAction(DmGoodsPlan goodPlan){
    Map<String,Object> ret = new HashMap<String,Object>();
    ret.put("success", true);
    ret.put("msg", "添加成功");
    /*DmGoodsPlan params = new DmGoodsPlan();
    params.setGoodsId(goodPlan.getGoodsId());
    params.setGoodsType(goodPlan.getGoodsType());
    List<DmGoodsPlan> list = dmGoodsPlanService.query(params);
    if(!list.isEmpty()){
      ret.put("success", false);
      ret.put("msg", "添加失败-对相同商品/商品包,不能存在多个有效状态的定价");
    }else{*/
    LoginInfo loginInfo = getCurrentLoginUser();
    if(loginInfo!=null){
      goodPlan.setOperStaffId(loginInfo.getUserId()+"");
      goodPlan.setOperStaffName(loginInfo.getUserName());
    }
      dmGoodsPlanService.save(goodPlan);
    /*}*/
    return ret;
  }
  
  @RemoteMethod
  public Map<String,Object> updateAction(DmGoodsPlan goodPlan){
    Map<String,Object> ret = new HashMap<String,Object>();
    ret.put("success", true);
    ret.put("msg", "更新成功");
   /* DmGoodsPlan params = new DmGoodsPlan();
    params.setGoodsId(goodPlan.getGoodsId());
    params.setGoodsType(goodPlan.getGoodsType());
    List<DmGoodsPlan> list = dmGoodsPlanService.query(params);
    if(!list.isEmpty()){
      ret.put("success", false);
      ret.put("msg", "更新失败-对相同商品/商品包,不能存在多个有效状态的定价");
    }else{*/
      dmGoodsPlanService.update(goodPlan);
    /*}*/
    return ret;
  }
  
  @RemoteMethod
  public Map<String,Object> deleteAction(DmGoodsPlan goodPlan){
    Map<String,Object> ret = new HashMap<String,Object>();
    ret.put("success", true);
    ret.put("msg", "删除成功");
    dmGoodsPlanService.delete(goodPlan);
    return ret;
  }
}
