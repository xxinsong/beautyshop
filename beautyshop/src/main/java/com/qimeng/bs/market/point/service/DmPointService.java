package com.qimeng.bs.market.point.service;

import com.qimeng.common.Page;
import com.qimeng.bs.market.point.bean.DmPoints;
import com.qimeng.bs.market.point.dao.DmPointsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class DmPointService {
  
  @Autowired
  private DmPointsMapper dmPointsMapper;
  
  
  public Page selectCustPointList(Map params, int pageIndex, int pageSize){
    Page page = new Page(pageIndex, pageSize);
    page.setParams(params);
    List<DmPoints> list = dmPointsMapper.findAllPoint(page);
    page.setRows(list);
    return page;
  }
  
  
}
