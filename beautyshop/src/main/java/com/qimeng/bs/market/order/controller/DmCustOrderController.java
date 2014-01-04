package com.qimeng.bs.market.order.controller;

import com.qimeng.common.Page;
import com.qimeng.bs.market.goods.ShoppingCart;
import com.qimeng.bs.common.controller.GenericController;
import com.qimeng.bs.login.bean.LoginInfo;
import com.qimeng.bs.market.goods.bean.DmGoodsInst;
import com.qimeng.bs.market.goods.service.DmGoodsInstService;
import com.qimeng.bs.market.order.OrderNoGenerator;
import com.qimeng.bs.market.order.bean.DmCustOrder;
import com.qimeng.bs.market.order.bean.DmSubCustOrder;
import com.qimeng.bs.market.order.service.DmCustOrderService;
import org.apache.commons.lang3.StringUtils;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * User: Simon
 * Date: 13-12-9
 */
@RemoteProxy
@Controller
public class DmCustOrderController extends GenericController{
    @Autowired
    DmCustOrderService dmCustOrderService;
    @Autowired
    DmGoodsInstService dmGoodsInstService;
    @Autowired
    OrderNoGenerator orderNoGenerator;

    @RemoteMethod
    public Page selectCustOrderList(Map params, int pageIndex, int pageSize){
        LoginInfo currUser = getCurrentLoginUser();
        params.put("merchantId", currUser.getMerchantId());
        return dmCustOrderService.selectCustOrderList(params, pageIndex, pageSize);
    }

    @RemoteMethod
    public void insertOrder(DmCustOrder dmCustOrder){
        dmCustOrderService.insertOrder(dmCustOrder);
    }

    @RemoteMethod
    public void updateOrder(DmCustOrder dmCustOrder) {
        dmCustOrderService.updateOrder(dmCustOrder);
    }

    @RemoteMethod
    public boolean cancelOrder(int orderId){
        return dmCustOrderService.cancelOrder(orderId);
    }

    @RemoteMethod
    public Page selectOrderGoodsInstList(Map params, int pageIndex, int pageSize) {
        return dmCustOrderService.selectOrderGoodsInstList(params, pageIndex, pageSize);
    }

    @RequestMapping("/order/submit")
    public String submitOrder(HttpServletRequest request){
        String mode = request.getParameter("mode");
        String orderId = request.getParameter("orderId");
        String paymentType = request.getParameter("paymentType");
        String invoiceType = request.getParameter("invoiceType");
        String invoiceNotes = request.getParameter("invoiceNotes");
        String invoiceDetail = request.getParameter("invoiceDetail");
        String orderNo = request.getParameter("orderNo");

        LoginInfo currUser = getCurrentLoginUser();

        ShoppingCart cart = getShoppingCart();

        DmCustOrder order = new DmCustOrder();
        order.setPaymentType(paymentType);
        order.setInvoiceType(invoiceType);
        order.setInvoiceNotes(invoiceNotes);
        order.setInvoiceDetail(invoiceDetail);
        order.setOrderId(StringUtils.isEmpty(orderId)?null:Integer.valueOf(orderId));
        order.setOrderNo(orderNo);
        order.setMerchantId(currUser.getMerchantId());
        order.setAmount(cart.getBuyingAmount());
        order.setRelaMan(currUser.getContactName());
        order.setRelaTel(currUser.getContactPhone());
        order.setRelaProvince(currUser.getProvinceCode());
        order.setRelaCity(currUser.getCityCode());
        order.setRelaDistrict(currUser.getDistrictCode());
        order.setRelaAddr(currUser.getAddress());
        order.setCardType(currUser.getCardType());
        order.setCardNo(currUser.getCardNo());
        order.setCreateTime(new Date());
        order.setState("10A");//待确认

        List<DmGoodsInst> instList = cart.getBuyingGoods();
        for (DmGoodsInst inst : instList) {
            DmSubCustOrder subOrder = new DmSubCustOrder();
            subOrder.setPlanId(inst.getPlanId());
            subOrder.setGoodsInstId(inst.getInstId());
            subOrder.setGoodsId(inst.getGoodsId());
            subOrder.setGoodsName(inst.getGoodsName());
            subOrder.setItemsCount(1);
            subOrder.setPrice(inst.getDmGoodsPlan().getPlanPrice());
            subOrder.setCreateDate(new Date());
            subOrder.setCommentated("0");
            subOrder.setState("10A");

            order.getSubCustOrderList().add(subOrder);
        }

        dmCustOrderService.submitOrder(order,mode);
        cart.removeGoods(instList);

        request.setAttribute("orderId",order.getOrderId());
        request.setAttribute("orderNo",order.getOrderNo());
        request.setAttribute("amount",order.getAmount());
        return "forward:payment";
    }

    @RequestMapping("/order/edit")
    public String editOrder(HttpServletRequest request) {
        int orderId = Integer.parseInt(request.getParameter("id"));
        LoginInfo currUser = getCurrentLoginUser();
        Map params = new HashMap();
        params.put("merchantId",currUser.getMerchantId());
        params.put("orderId",orderId);
        DmCustOrder order = dmCustOrderService.selectCustOrder(params);
        if(order!=null){
            request.setAttribute("orderId",orderId);
            request.setAttribute("orderNo",order.getOrderNo());
            request.setAttribute("amount",order.getAmount());
            request.setAttribute("invoiceType",order.getInvoiceType());
            request.setAttribute("invoiceNotes",order.getInvoiceNotes());
            request.setAttribute("invoiceDetail",order.getInvoiceDetail());
            ShoppingCart cart = getShoppingCart();
            cart.getBuyingGoods().clear();
            for(DmSubCustOrder subOrder:order.getSubCustOrderList()){
                DmGoodsInst inst = dmGoodsInstService.selectGoodsInstById(subOrder.getGoodsInstId());
                cart.addBuyingGoods(inst);
            }
            if(StringUtils.equals(order.getState(),"10A")){
                request.setAttribute("mode","EDIT");
            }else{
                request.setAttribute("mode","VIEW");
            }
            return "/market/order/order.jsp";
        }else{
            return "forward:notfound";
        }
    }
    @RequestMapping("/order/confirm")
    public String createOrder(HttpServletRequest request){
        LoginInfo currUser = getCurrentLoginUser();
        String orderNo = orderNoGenerator.genCode(OrderNoGenerator.OrderType.NORMAL,currUser.getMerchantId());
        request.setAttribute("orderNo",orderNo);
        request.setAttribute("invoiceType","1");
        request.setAttribute("invoiceNotes","个人");
        request.setAttribute("invoiceDetail","明细");
        request.setAttribute("mode","CREATE");
        return "/market/order/order.jsp";
    }

    @RequestMapping("/myorder")
    public String listMyOrder(HttpServletRequest request){
        return "/market/order/myorder.jsp";
    }

    @RequestMapping("/order/notfound")
    public String orderNotfound(HttpServletRequest request){
        return "/market/order/ordernotfound.jsp";
    }

    @RequestMapping("/payment")
    public String payment(HttpServletRequest request){

        return "/market/order/payment.jsp";
    }


}
