package com.qimeng.bs.market.consult.service;

import com.qimeng.common.Page;
import com.qimeng.bs.admin.goods.bean.DmGoods;
import com.qimeng.bs.admin.goods.dao.DmGoodsMapper;
import com.qimeng.bs.market.consult.bean.DmConsultation;
import com.qimeng.bs.market.consult.dao.DmConsultationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class DmMyConsultService {
  
  @Autowired
  private DmGoodsMapper dmGoodsMapper;
  @Autowired
  private DmConsultationMapper dmConsultationMapper;
  
  @SuppressWarnings({"rawtypes", "unchecked"})
  public Page selectMyConsultGoodsList(Map params, int pageIndex, int pageSize) {
    Page page = new Page(pageIndex, pageSize);
    page.setParams(params);
    List<DmGoods> rows = dmGoodsMapper.findAllGoods(page);
    page.setRows(rows);
    return page;
  }
  
  @Transactional
  @SuppressWarnings("rawtypes")
  public List getMyConsultByGoodsId(DmConsultation consultation) {
    List<DmConsultation> list = dmConsultationMapper
        .selectByGoodsIdAndMerchantId(consultation.getGoodsId(),
            consultation.getMerchantId());
    return list;
  }
  
  @Transactional
  public String inserMyConsult(DmConsultation consultation) {
    dmConsultationMapper.insert(consultation);
    return consultation.getId().toString();
  }
  
  
  public Page<DmConsultation> queryPage(Page<DmConsultation> page){
    List<DmConsultation> rows = dmConsultationMapper.findAllConsultation(page);
    page.setRows(rows);
    return page;
  }
  
  @Transactional
  public int update(DmConsultation consultation){
    return dmConsultationMapper.updateByPrimaryKeySelective(consultation);
  }
  
}
