package com.qimeng.bs.market.order.service;

import com.qimeng.bs.admin.merchant.bean.DmMerchant;
import com.qimeng.bs.admin.merchant.dao.DmMerchantMapper;
import com.qimeng.bs.login.bean.AdminLoginInfo;
import com.qimeng.bs.market.goods.bean.DmGoodsInst;
import com.qimeng.bs.market.goods.dao.DmGoodsInstMapper;
import com.qimeng.bs.market.point.bean.DmPointsDetail;
import com.qimeng.bs.market.point.dao.DmPointsDetailMapper;
import com.qimeng.bs.market.point.service.DmPointService;
import com.qimeng.bs.market.user.service.ReferrerInfoService;
import com.qimeng.common.Page;
import com.qimeng.common.tools.PKUtils;
import com.qimeng.bs.market.goods.dao.DmShoppingCartMapper;
import com.qimeng.bs.market.order.bean.DmCustOrder;
import com.qimeng.bs.market.order.bean.DmSubCustOrder;
import com.qimeng.bs.market.order.dao.DmCustOrderMapper;
import com.qimeng.bs.market.order.dao.DmSubCustOrderMapper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * User: Simon
 * Date: 13-12-9
 */
@Service
public class DmCustOrderService {

    @Autowired
    private DmCustOrderMapper dmCustOrderMapper;
    @Autowired
    private DmSubCustOrderMapper dmSubCustOrderMapper;
    @Autowired
    private DmShoppingCartMapper dmShoppingCartMapper;
    @Autowired
    private DmGoodsInstMapper dmGoodsInstMapper;
    @Autowired
    private ReferrerInfoService referrerInfoService;
    @Autowired
    private DmPointsDetailMapper dmPointsDetailMapper;
    @Autowired
    private DmPointService dmPointService;
    @Autowired
    private DmMerchantMapper dmMerchantMapper;

    @Transactional
    public void insertOrder(DmCustOrder dmCustOrder) {
        dmCustOrderMapper.insert(dmCustOrder);

    }

    @Transactional
    public void updateOrder(DmCustOrder dmCustOrder) {
        dmCustOrderMapper.updateByPrimaryKey(dmCustOrder);
    }

    public Page selectCustOrderList(Map params, int pageIndex, int pageSize) {
        Page page = new Page(pageIndex, pageSize);
        page.setParams(params);
        List<DmCustOrder> list = dmCustOrderMapper.selectOrderByPage(page);
        for (DmCustOrder order : list) {
            List<DmSubCustOrder> subCustOrderList = dmSubCustOrderMapper.selectSubOrderByOrderId(order.getOrderId());
            order.setSubCustOrderList(subCustOrderList);
        }
        page.setRows(list);
        return page;
    }


    @Transactional
    public boolean cancelMyOrder(int merchantId, int orderId) {
       /* DmCustOrder order = new DmCustOrder();
        order.setOrderId(orderId);
        order.setState("10C");*/
        Map param = new HashMap();
        param.put("merchantId", merchantId);
        param.put("orderId", orderId);
        int ret = dmCustOrderMapper.cancelMyOrder(param);
        if(ret>0){
            param.put("state","10C");
            dmSubCustOrderMapper.updateOrderState(param);
        }
        return ret > 0;
    }
    
    @Transactional
    public void updateOrderByPrimaryKeySelective(DmCustOrder dmCustOrder) {
        dmCustOrderMapper.updateByPrimaryKeySelective(dmCustOrder);
    }

    public Page selectOrderGoodsInstList(Map params, int pageIndex, int pageSize) {
        Page page = new Page(pageIndex, pageSize);
        page.setParams(params);
        List<DmSubCustOrder> list = dmSubCustOrderMapper.selectSubOrderByOrderIdPage(page);
        page.setRows(list);
        return page;
    }

    @Transactional
    public void submitOrder(DmCustOrder order,String mode) {
        List<DmSubCustOrder> subCustOrderList = order.getSubCustOrderList();
        List<Integer> goodsIds = new ArrayList<Integer>();
        if(StringUtils.equals(mode,"CREATE")){
            dmCustOrderMapper.insert(order);
            int orderId = PKUtils.lastInsertId();
            order.setOrderId(orderId);

            for (DmSubCustOrder subCustOrder : subCustOrderList) {
                DmGoodsInst goodsInst = new DmGoodsInst();
                goodsInst.setMerchantId(order.getMerchantId());
                goodsInst.setGoodsId(subCustOrder.getGoodsId());
                goodsInst.setGoodsName(subCustOrder.getGoodsName());
                goodsInst.setInstNum(subCustOrder.getItemNo());
                goodsInst.setPrice(subCustOrder.getPrice());
                goodsInst.setState("00A");
                dmGoodsInstMapper.insert(goodsInst);
                int goodsInstId = PKUtils.lastInsertId();

                subCustOrder.setOrderId(orderId);
                subCustOrder.setGoodsInstId(goodsInstId);
                dmSubCustOrderMapper.insert(subCustOrder);

                goodsIds.add(subCustOrder.getGoodsId());
            }
        }else{
            dmCustOrderMapper.updateByPrimaryKeySelective(order);
            for (DmSubCustOrder subCustOrder : subCustOrderList) {
                subCustOrder.setOrderId(order.getOrderId());
                dmSubCustOrderMapper.updateByPrimaryKeySelective(subCustOrder);
                goodsIds.add(subCustOrder.getGoodsId());
            }
        }
        if(!goodsIds.isEmpty()){
            dmShoppingCartMapper.batchRemoveGoodsInCart(goodsIds);
        }

    }

    public boolean allowComment(int merchantId, String subOrderId) {
        boolean allow = false;
        Map params = new HashMap();
        params.put("merchantId", merchantId);
        params.put("subOrderId", subOrderId);
        DmSubCustOrder subCustOrder = dmSubCustOrderMapper.selectCommentOrder(params);
        if(subCustOrder!=null &&
                (StringUtils.isEmpty(subCustOrder.getCommentated())||
                 StringUtils.equals(subCustOrder.getCommentated(),"0"))){
           allow = true;
        }
        return allow;
    }

    public DmCustOrder selectCustOrder(Map params) {
        DmCustOrder order = dmCustOrderMapper.selectCustOrderByMerchantId(params);
        if(order!=null){
            List<DmSubCustOrder> subCustOrderList = dmSubCustOrderMapper.selectSubOrderByOrderId(order.getOrderId());
            order.setSubCustOrderList(subCustOrderList);
            int itemNo = order.getItemNo();
            for(DmSubCustOrder subOrder:subCustOrderList){
                itemNo = itemNo + subOrder.getItemNo();
            }
            order.setItemNo(itemNo);
            order.setFreight(itemNo>1?0.0f:10.0f);
        }
        return order;
    }

    public List<DmSubCustOrder> selectSubCustOrder(int orderId) {
        List<DmSubCustOrder> subCustOrderList = dmSubCustOrderMapper.selectSubOrderByOrderId(orderId);
        return subCustOrderList;
    }

    public List<DmCustOrder> selectCustOrderList(int merchantId) {
        List<DmCustOrder> list = dmCustOrderMapper.selectOrderByMerchantId(merchantId);
        for (DmCustOrder order : list) {
            List<DmSubCustOrder> subCustOrderList = dmSubCustOrderMapper.selectSubOrderByOrderId(order.getOrderId());
            order.setSubCustOrderList(subCustOrderList);
        }
        return list;
    }

    @Transactional
    public void updateOrderStateByOrderNo(String orderNo, String state) {
        Map param = new HashMap();
        param.put("orderNo", orderNo);
        param.put("state", state);
        dmCustOrderMapper.updateStateByOrderNo(param);
    }

    public Page<DmCustOrder> queryAllOrder(Map params, int pageIndex, int pageSize) {
        Page page = new Page(pageIndex, pageSize);
        page.setParams(params);
        List<DmCustOrder> list = dmCustOrderMapper.selectAllOrderByPage(page);
        /*for (DmCustOrder order : list) {
            List<DmSubCustOrder> subCustOrderList = dmSubCustOrderMapper.selectSubOrderByOrderId(order.getOrderId());
            order.setSubCustOrderList(subCustOrderList);
        }*/
        page.setRows(list);
        return page;
    }

    public boolean deliverGoods(Integer orderId) {
        DmCustOrder dmCustOrder = dmCustOrderMapper.selectByPrimaryKey(orderId);
        dmCustOrder.setOperDate(new Date());
        dmCustOrder.setState("10D");
        dmCustOrderMapper.updateByPrimaryKeySelective(dmCustOrder);
        return true;
    }

    public Page<DmSubCustOrder> querySubOrder(Map params, int pageIndex, int pageSize) {
        Page<DmSubCustOrder> page = new Page<DmSubCustOrder>(pageIndex, pageSize);
        page.setParams(params);
        List<DmSubCustOrder > list = dmSubCustOrderMapper.selectSubOrderByOrderIdPage(page);
        page.setRows(list);
        return page;
    }

    public boolean deleteOrder(Integer orderId) {
        int ret = dmCustOrderMapper.deleteByPrimaryKey(orderId);
        dmSubCustOrderMapper.deleteSubOrderByOrderId(orderId);
        return ret > 0 ;
    }

    public boolean confirmReceiveMoney(Integer orderId) {
        DmCustOrder dmCustOrder = dmCustOrderMapper.selectByPrimaryKey(orderId);
        dmCustOrder.setOperDate(new Date());
        dmCustOrder.setState("10B");
        dmCustOrderMapper.updateByPrimaryKeySelective(dmCustOrder);

        DmMerchant dmMerchant = dmMerchantMapper.selectByPrimaryKey(dmCustOrder.getMerchantId());
        Integer userId = dmMerchant.getUserId();
        List<Integer> upReferrers = referrerInfoService.getUp5LevelsReferrers(userId);
        for (Integer referrer : upReferrers) {

            dmPointService.increaseTotalPoint(referrer);

            DmPointsDetail dmPointsDetail = new DmPointsDetail();
            dmPointsDetail.setOrderNo(dmCustOrder.getOrderNo());
            dmPointsDetail.setUserId(referrer);
            dmPointsDetail.setPresenteeId(Integer.valueOf(userId));
            dmPointsDetail.setPoint(1);
            dmPointsDetail.setGainTime(new Date());
            dmPointsDetail.setState("00A");

            dmPointsDetailMapper.insert(dmPointsDetail);
        }

        return true;
    }
}
