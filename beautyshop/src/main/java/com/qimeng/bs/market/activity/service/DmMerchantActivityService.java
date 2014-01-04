package com.qimeng.bs.market.activity.service;

import com.qimeng.common.Page;
import com.qimeng.common.tools.PKUtils;
import com.qimeng.bs.market.activity.bean.DmMerchantActivity;
import com.qimeng.bs.market.activity.dao.DmExecuteListMapper;
import com.qimeng.bs.market.activity.dao.DmMerchantActivityMapper;
import com.qimeng.bs.market.goods.bean.DmGoodsInst;
import com.qimeng.bs.market.goods.dao.DmGoodsInstMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * User: Simon
 * Date: 13-12-3
 */
@Service
public class DmMerchantActivityService {
    @Autowired
    private DmMerchantActivityMapper dmMerchantActivityMapper;
    @Autowired
    private DmGoodsInstMapper dmGoodsInstMapper;
    @Autowired
    private DmExecuteListMapper dmExecuteListMapper;

    @Transactional
    public void insertMerchantActivity(DmMerchantActivity activity){
        dmMerchantActivityMapper.insert(activity);
        int id = PKUtils.lastInsertId();
        activity.setActId(id);
        dmExecuteListMapper.copyInstDataToExecuteList(activity);
        DmGoodsInst inst = new DmGoodsInst();
        inst.setInstId(activity.getGoodsInstId());
        inst.setState("00D");
        dmGoodsInstMapper.updateByPrimaryKeySelective(inst);
    }

    @Transactional
    public void updateMerchantActivity(DmMerchantActivity activity){
        dmMerchantActivityMapper.updateByPrimaryKey(activity);
    }

    @Transactional
    public void deleteMerchantActivity(int id){
        DmMerchantActivity activity = dmMerchantActivityMapper.selectByPrimaryKey(id);
        dmMerchantActivityMapper.deleteByPrimaryKey(id);
        DmGoodsInst inst = new DmGoodsInst();
        inst.setInstId(activity.getGoodsInstId());
        inst.setState("00R");
        dmGoodsInstMapper.updateByPrimaryKeySelective(inst);
    }


    public Page selectMerchantActivityList(Map params, int pageIndex, int pageSize) {
        Page page = new Page(pageIndex,pageSize);
        page.setParams(params);

        List<DmMerchantActivity> activityList = dmMerchantActivityMapper.selectMerchantActivityList(page);
        page.setRows(activityList);

        return page;
    }

    public DmMerchantActivity selectMerchantActivityByKey(int actId) {
        return dmMerchantActivityMapper.selectByPrimaryKey(actId);
    }
}
