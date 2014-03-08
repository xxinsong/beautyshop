package com.qimeng.bs.market.order.service;

import com.qimeng.bs.login.bean.AdminLoginInfo;
import com.qimeng.bs.market.goods.bean.DmGoodsInst;
import com.qimeng.bs.market.goods.dao.DmGoodsInstMapper;
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
    public boolean cancelOrder(int orderId) {
        DmCustOrder order = new DmCustOrder();
        order.setOrderId(orderId);
        order.setState("10C");
        int ret = dmCustOrderMapper.updateByPrimaryKeySelective(order);
        Map params = new HashMap();
        params.put("orderId",orderId);
        params.put("state","10C");
        dmSubCustOrderMapper.updateOrderState(params);
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

        dmShoppingCartMapper.batchRemoveGoodsInCart(goodsIds);

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
}
