package com.qimeng.bs.market.point.service;

import com.qimeng.common.Page;
import com.qimeng.bs.market.point.bean.DmPoints;
import com.qimeng.bs.market.point.dao.DmPointsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class DmPointService {

    @Autowired
    private DmPointsMapper dmPointsMapper;


    public Page selectCustPointList(Map params, int pageIndex, int pageSize) {
        Page page = new Page(pageIndex, pageSize);
        page.setParams(params);
        List<DmPoints> list = dmPointsMapper.findAllPoint(page);
        page.setRows(list);
        return page;
    }

    @Transactional
    public void insertPoint(DmPoints dmPoints) {
        dmPointsMapper.insert(dmPoints);
    }

    @Transactional
    public boolean exchangePoints(Integer userId,Integer points){
        DmPoints dmPoints = selectPointsByUserId(userId);
        if (dmPoints != null) {
            int remainder = dmPoints.getRemainderPoints();
            remainder = remainder - points;
            dmPoints.setRemainderPoints(remainder<0?0:remainder);
            dmPoints.setLastExchangePoints(points);
            dmPoints.setLastExchangeTime(new Date());
            dmPointsMapper.updateByPrimaryKeySelective(dmPoints);
            return true;
        }
        return false;
    }

    @Transactional
    public void increaseTotalPoint(Integer userId,int point) {
        DmPoints points = selectPointsByUserId(userId);
        if (points != null) {
            int total = points.getTotalPoints();
            int remainder = points.getRemainderPoints();
            points.setTotalPoints(total + point);
            points.setRemainderPoints(remainder + point);
            dmPointsMapper.updateByPrimaryKeySelective(points);
        }else{
            points = new DmPoints();
            points.setMerchantId(userId);
            points.setTotalPoints(point);
            points.setRemainderPoints(1);
            dmPointsMapper.insert(points);
        }
    }

    public DmPoints selectPointsByUserId(Integer userId) {
        return dmPointsMapper.selectPointsByUserId(userId);
    }

    public Page queryAllPoints(int pageIndex, int pageSize) {
        Page page = new Page(pageIndex, pageSize);
//        page.setParams(params);
        List<DmPoints> list = dmPointsMapper.findAllPoint(page);
        page.setRows(list);
        return page;
    }


}
