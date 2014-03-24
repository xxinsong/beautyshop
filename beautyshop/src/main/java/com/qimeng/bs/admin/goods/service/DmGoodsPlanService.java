package com.qimeng.bs.admin.goods.service;

import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qimeng.common.Page;
import com.qimeng.bs.admin.goods.bean.DmGoodsPackage;
import com.qimeng.bs.admin.goods.bean.DmGoodsPlan;
import com.qimeng.bs.admin.goods.dao.DmGoodsPlanMapper;
@Service
public class DmGoodsPlanService {

  @Autowired
  private DmGoodsPlanMapper dmGoodsPlanMapper;
  private final Logger logger = Logger.getLogger(DmGoodsPlanService.class);
  
  public Page<DmGoodsPlan> queryPage(Page<DmGoodsPlan> page){
    List<DmGoodsPlan> rows = dmGoodsPlanMapper.findAllGoodsPlan(page);
    page.setRows(rows);
    return page;
  }
  
  public List<DmGoodsPlan> query(DmGoodsPlan params){
    List<DmGoodsPlan> ret = dmGoodsPlanMapper.findGoodsPlan(params);
    return ret;
  }
  
  public DmGoodsPlan getGoodsPlanById(DmGoodsPlan plan){
    DmGoodsPlan ret = dmGoodsPlanMapper.selectByPrimaryKey(plan.getPlanId());
    return ret;
  }
  
  public DmGoodsPlan queryActivitedPlan(Integer goodsId,String goodsType){
    DmGoodsPlan params = new DmGoodsPlan();
    params.setGoodsId(goodsId);
    params.setGoodsType(goodsType);
    params.setState("00A");
    List<DmGoodsPlan> resultList = query(params);
    if(resultList.isEmpty()){
      return null;
    }else{
      return resultList.get(0);
    }
  }
  
  @Transactional
  public void updateState(DmGoodsPlan plan){
    String updateState = plan.getState();
    plan.setStateDate(new Date());
    if(!"00X".equals(updateState)){
      DmGoodsPlan params = new DmGoodsPlan();
      params.setGoodsId(plan.getGoodsId());
      params.setGoodsType(plan.getGoodsType());
      params.setState("00X");
      dmGoodsPlanMapper.batchUpdateState(params);
    }
    dmGoodsPlanMapper.updateByPrimaryKeySelective(plan);
  }
  
  
  @Transactional
  public int save(DmGoodsPlan goodPlan){
    goodPlan.setStateDate(new Date());
    int rows = dmGoodsPlanMapper.insert(goodPlan);
    return rows;
  }
  
  
  @Transactional
  public int update(DmGoodsPlan goodPlan){
    DmGoodsPlan dbGoodPlan = dmGoodsPlanMapper.selectByPrimaryKey(goodPlan.getPlanId());
    if(!goodPlan.getState().equals(dbGoodPlan.getState())){
      goodPlan.setStateDate(new Date());
    }
    return dmGoodsPlanMapper.updateByPrimaryKeySelective(goodPlan);
  }
  
  @Transactional
  public int delete(DmGoodsPlan goodPlan){
     Integer planId = goodPlan.getPlanId();
     return dmGoodsPlanMapper.deleteByPrimaryKey(planId);
  }
  
  
}
