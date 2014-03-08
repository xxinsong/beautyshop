package com.qimeng.bs.market.order.controller;

import com.qimeng.bs.market.goods.bean.DmShoppingCartItem;
import com.qimeng.bs.market.goods.service.DmShoppingCartService;
import com.qimeng.bs.market.user.bean.DmAddress;
import com.qimeng.bs.market.user.service.DmAddressService;
import com.qimeng.common.Page;
import com.qimeng.bs.market.goods.ShoppingCart;
import com.qimeng.bs.common.controller.GenericController;
import com.qimeng.bs.login.bean.LoginInfo;
import com.qimeng.bs.market.goods.service.DmGoodsInstService;
import com.qimeng.bs.market.order.OrderNoGenerator;
import com.qimeng.bs.market.order.bean.DmCustOrder;
import com.qimeng.bs.market.order.bean.DmSubCustOrder;
import com.qimeng.bs.market.order.service.DmCustOrderService;
import com.qimeng.common.interceptor.SubmissionToken;
import org.apache.commons.lang3.StringUtils;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.*;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import java.util.*;

/**
 * User: Simon
 * Date: 13-12-9
 */
@RemoteProxy
@Controller
@Path("/order")
public class DmCustOrderController extends GenericController{
    @Autowired
    DmAddressService dmAddressService;
    @Autowired
    DmCustOrderService dmCustOrderService;
    @Autowired
    DmGoodsInstService dmGoodsInstService;
    @Autowired
    DmShoppingCartService dmShoppingCartService;
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
        LoginInfo currUser = getCurrentLoginUser();
        return dmCustOrderService.cancelMyOrder(currUser.getMerchantId(),orderId);
    }

    @PUT
    @Path("cancel/{orderId}")
    @Produces({MediaType.APPLICATION_JSON})
    public String cancelOrderFromApp(@PathParam("orderId")Integer orderId) throws JSONException {
        boolean result = cancelOrder(orderId);
        JSONObject ret = new JSONObject();
        ret.put("success", result);
        return ret.toString();
    }

    @RemoteMethod
    public Page selectOrderGoodsInstList(Map params, int pageIndex, int pageSize) {
        return dmCustOrderService.selectOrderGoodsInstList(params, pageIndex, pageSize);
    }

    @POST
    @Path("save")
    @Produces({MediaType.APPLICATION_JSON})
    public String submitOrderFromApp(@Context HttpServletRequest request) throws JSONException {
        DmCustOrder dmCustOrder = saveOrder(request);
        JSONObject result = new JSONObject();
        result.put("success", true);
        result.put("orderNo", dmCustOrder.getOrderNo());
        return result.toString();
    }

    @SubmissionToken(remove = true)
    @RequestMapping("/order/submit")
    public String submitOrder(HttpServletRequest request){
        DmCustOrder order = saveOrder(request);

        request.setAttribute("orderId",order.getOrderId());
        request.setAttribute("orderNo",order.getOrderNo());
        request.setAttribute("amount",order.getAmount());
        request.setAttribute("contactPerson",order.getRelaMan());
        request.setAttribute("mobilePhone",order.getRelaTel());
        request.setAttribute("address",order.getRelaProvince()+order.getRelaCity()+order.getRelaDistrict()+order.getRelaAddr());
        request.setAttribute("zipCode",order.getZipCode());
        return "forward:/payment";
    }

    private DmCustOrder saveOrder(HttpServletRequest request) {
        String mode = request.getParameter("mode");
        String orderId = request.getParameter("orderId");
        String paymentType = request.getParameter("paymentType");
        String invoiceType = request.getParameter("invoiceType");
        String invoiceNotes = request.getParameter("invoiceNotes");
        String invoiceDetail = request.getParameter("invoiceDetail");
        String contactInfo = request.getParameter("contactInfo");
        String orderNo = request.getParameter("orderNo");
        LoginInfo currUser = getCurrentLoginUser();
        if(StringUtils.isEmpty(orderNo)) {
            orderNo = orderNoGenerator.genCode(OrderNoGenerator.OrderType.NORMAL, currUser.getMerchantId());
        }
        DmCustOrder order = null;

        DmAddress address = dmAddressService.selectAddressById(Integer.valueOf(contactInfo));

        ShoppingCart cart = getShoppingCart();
        if(StringUtils.equals(mode, "CREATE")){
            order = new DmCustOrder();
            order.setMerchantId(currUser.getMerchantId());
            order.setAmount(cart.getBuyingAmount());
            order.setRelaMan(address.getContactPerson());
            order.setRelaTel(address.getMobilePhone());
            order.setRelaProvince(address.getProvince());
            order.setRelaCity(address.getCity());
            order.setRelaDistrict(address.getDistrict());
            order.setRelaAddr(address.getAddress());
            order.setZipCode(address.getZipCode());
            order.setCardType(currUser.getCardType());
            order.setCardNo(currUser.getCardNo());
            order.setCreateTime(new Date());

            List<DmShoppingCartItem> buying = cart.getBuying();
            for (DmShoppingCartItem item : buying) {
                DmSubCustOrder subOrder = new DmSubCustOrder();
//            subOrder.setGoodsInstId(inst.getInstId());
                subOrder.setGoodsId(item.getGoodsId());
                subOrder.setGoodsName(item.getGoodsName());
                subOrder.setItemNo(item.getItemNo());
                subOrder.setPrice(item.getAmount());
                subOrder.setCreateDate(new Date());
                subOrder.setCommentated("0");
                subOrder.setState("10A");

                order.getSubCustOrderList().add(subOrder);
            }
            cart.removeGoods(buying);
        }else {
            Map param = new HashMap();
            param.put("orderId",orderId);
            param.put("merchantId",currUser.getMerchantId());
            order = dmCustOrderService.selectCustOrder(param);
        }
        order.setPaymentType(paymentType);
        order.setInvoiceType(invoiceType);
        order.setInvoiceNotes(invoiceNotes);
        order.setInvoiceDetail(invoiceDetail);
        order.setOrderId(StringUtils.isEmpty(orderId)?null:Integer.valueOf(orderId));
        order.setOrderNo(orderNo);

        order.setState("10A");//待确认


        dmCustOrderService.submitOrder(order,mode);
        return order;
    }

    @SubmissionToken(save = true)
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
//            ShoppingCart cart = getShoppingCart();
//            cart.getBuying().clear();
//            for(DmSubCustOrder subOrder:order.getSubCustOrderList()){
//                DmShoppingCartItem item = dmShoppingCartService.selectGoodsInstById(subOrder.getGoodsId());
//                cart.addBuyingGoods(inst.getGoodsId());
//            }
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
    @SubmissionToken(save = true)
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

    @RequestMapping("/order")
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

    @RequestMapping("/order/alipay")
    public String alipay(HttpServletRequest request){
        return "/alipay/alipayapi.jsp";
    }

    @GET
    @Path("{orderId}/calc")
    @Produces({MediaType.APPLICATION_JSON})
    public String calcOrderAmount(@PathParam("orderId") Integer orderId) throws JSONException {
        LoginInfo currUser = getCurrentLoginUser();
        Map params = new HashMap();
        params.put("merchantId",currUser.getMerchantId());
        params.put("orderId",orderId);
        DmCustOrder order = dmCustOrderService.selectCustOrder(params);
        JSONObject result = new JSONObject();
        result.put("totalPrice",order.getAmount());
        result.put("totalCount", order.getItemNo());
        return result.toString();
    }
    @GET
    @Path("list")
    @Produces({MediaType.APPLICATION_JSON})
    public List<DmCustOrder> getOrderList() throws JSONException {
        LoginInfo currUser = getCurrentLoginUser();
        Map params = new HashMap();
        params.put("merchantId",currUser.getMerchantId());

        List<DmCustOrder> result = dmCustOrderService.selectCustOrderList(currUser.getMerchantId());


        return result;
    }
    @GET
    @Path("{orderId}")
    @Produces({MediaType.APPLICATION_JSON})
    public DmCustOrder getOrderByOrderId(@PathParam("orderId") Integer orderId) throws JSONException {
        LoginInfo currUser = getCurrentLoginUser();
        Map params = new HashMap();
        params.put("merchantId",currUser.getMerchantId());
        params.put("orderId",orderId);

        DmCustOrder result = dmCustOrderService.selectCustOrder(params);
        return result;
    }
    @RemoteMethod
    public Page getBuyingGoodsList(Map params, int pageIndex, int pageSize) {
        LoginInfo currUser = getCurrentLoginUser();
        params.put("merchantId",currUser.getMerchantId());
//        int orderId = MapUtils.getInteger(params,"orderId");
        DmCustOrder order = dmCustOrderService.selectCustOrder(params);
        List<DmSubCustOrder> subOrderList = order.getSubCustOrderList();
//        for(DmSubCustOrder subOrder:subOrderList){
//                DmShoppingCartItem item = dmShoppingCartService.selectGoodsInstById(subOrder.getGoodsId());
//                cart.addBuyingGoods(inst.getGoodsId());

//        }
        int size = subOrderList.size();
        Page<DmSubCustOrder> page = new Page<DmSubCustOrder>(pageIndex,pageSize);
        page.setTotal(size);
        if(size>0){
            int startIndex = (pageIndex-1)*pageSize;

            int endIndex = pageIndex*pageSize;
            endIndex = (endIndex > size) ? size:endIndex;
            page.setRows(subOrderList.subList(startIndex,endIndex));
        }
        return page;
    }

    @RemoteMethod
    public Page<DmCustOrder> queryAllOrder(Map params, int pageIndex, int pageSize) {
        Page<DmCustOrder> orderList = dmCustOrderService.queryAllOrder(params, pageIndex, pageSize);
        return orderList;
    }
    @RemoteMethod
    public boolean deliverGoods(Integer orderId) {
        return dmCustOrderService.deliverGoods(orderId);
    }
}
