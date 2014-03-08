package com.qimeng.bs.market.goods.controller;

import com.qimeng.bs.admin.goods.bean.DmGoods;
import com.qimeng.bs.admin.goods.service.DmGoodsService;
import com.qimeng.bs.common.controller.GenericController;
import com.qimeng.bs.login.bean.LoginInfo;
import com.qimeng.bs.market.goods.ShoppingCart;
import com.qimeng.bs.market.goods.bean.DmShoppingCartItem;
import com.qimeng.bs.market.goods.service.DmShoppingCartService;
import com.qimeng.common.Page;
import org.codehaus.jettison.json.JSONArray;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.*;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import java.util.List;
import java.util.Map;

/**
 * User: Simon
 * Date: 13-12-26
 */
@RemoteProxy
@Controller
@Path("/mycart")
public class DmShoppingCartController extends GenericController {

    @Autowired
    DmShoppingCartService dmShoppingCartService;
    @Autowired
    DmGoodsService dmGoodsService;

    @RemoteMethod
    public Map<String, String> getBuyerInfo() {
        LoginInfo currUser = getCurrentLoginUser();
        return null;
    }

    @RemoteMethod
    public Page getCartGoodsList(Map params, int pageIndex, int pageSize) {
        ShoppingCart cart = getShoppingCart();
        List<DmShoppingCartItem> allGoodsInCart = cart.getAllGoodsInCart();
        int size = allGoodsInCart.size();
        Page<DmShoppingCartItem> page = new Page<DmShoppingCartItem>(pageIndex, pageSize);
        page.setTotal(size);
        if (size > 0) {
            int startIndex = (pageIndex - 1) * pageSize;

            int endIndex = pageIndex * pageSize;
            endIndex = (endIndex > size) ? size : endIndex;
            page.setRows(allGoodsInCart.subList(startIndex, endIndex));
        }
        return page;
    }

    @RemoteMethod
    public Page getBuyingGoodsList(Map params, int pageIndex, int pageSize) {
        ShoppingCart cart = getShoppingCart();
        List<DmShoppingCartItem> buying = cart.getBuying();
        int size = buying.size();
        Page<DmShoppingCartItem> page = new Page<DmShoppingCartItem>(pageIndex, pageSize);
        page.setTotal(size);
        if (size > 0) {
            int startIndex = (pageIndex - 1) * pageSize;

            int endIndex = pageIndex * pageSize;
            endIndex = (endIndex > size) ? size : endIndex;
            page.setRows(buying.subList(startIndex, endIndex));
        }
        return page;
    }

    @RemoteMethod
    public boolean addBuyingGoods(String[] buyingGoods) {
        ShoppingCart shoppingCart = getShoppingCart();
        shoppingCart.getBuying().clear();
        for (String goodsId : buyingGoods) {
            shoppingCart.addBuyingGoods(Integer.valueOf(goodsId));
        }

        return true;
    }


    @RemoteMethod
    public LoginInfo loadContactInfo() {
        return getCurrentLoginUser();
    }

    @RemoteMethod
    public boolean removeGoodsFromCart(Integer[] instIds) {
        ShoppingCart cart = getShoppingCart();
        cart.removeGoods(instIds);
        dmShoppingCartService.removeGoodsInCart(instIds);
        return true;
    }

    @RemoteMethod
    public boolean removeAllGoodsFromCart() {
        ShoppingCart cart = getShoppingCart();
        cart.removeAllGoods();
        LoginInfo currUser = getCurrentLoginUser();
        dmShoppingCartService.removeAllGoods(currUser.getMerchantId());
        return true;
    }

    //    @RemoteMethod
    @PUT
    @Produces({MediaType.APPLICATION_JSON})
    @Path("edit/{goodsId}:{num}")
    public String setGoodsItemNo(@PathParam("goodsId") Integer goodsId, @PathParam("num") Integer num) throws JSONException {
        ShoppingCart cart = getShoppingCart();
        DmShoppingCartItem item = cart.setGoodsItemNo(goodsId, num);
        LoginInfo currUser = getCurrentLoginUser();
        if (currUser != null) {
            dmShoppingCartService.saveShoppingCart(item);
        }
        JSONObject result = new JSONObject();
        result.put("success", true);
        return result.toString();
//        return String.valueOf(true);
    }

    @PUT
    @Produces({MediaType.APPLICATION_JSON})
    @Path("add/{goodsId}")
    public String putGoodsIntoCart(@PathParam("goodsId") Integer goodsId) throws JSONException {
        /*ShoppingCart cart = getShoppingCart();
        cart.putGoodsInCart(goodsId,itemNo);
        return String.valueOf(true);*/
        return putGoodsWithNoIntoCart(goodsId, 1);
    }

    @PUT
    @Produces({MediaType.APPLICATION_JSON})
    @Path("add/{goodsId}:{itemNo}")
    public String putGoodsWithNoIntoCart(@PathParam("goodsId") Integer goodsId
            , @PathParam("itemNo") Integer itemNo) throws JSONException {
        JSONObject result = new JSONObject();
        DmGoods goods = dmGoodsService.getGoodsById(goodsId);
        ShoppingCart cart = getShoppingCart();
        DmShoppingCartItem item = cart.putGoodsInCart(goods, itemNo);
        LoginInfo currUser = getCurrentLoginUser();
        if (currUser != null) {
            dmShoppingCartService.saveShoppingCart(item);
        }
        result.put("success", true);
        return result.toString();
    }

    @PUT
    @Produces({MediaType.APPLICATION_JSON})
    @Path("save/{goodsId}:{itemNo}")
    public String saveGoodsAndNumIntoCart(@PathParam("goodsId") Integer goodsId
            , @PathParam("itemNo") Integer itemNo) throws JSONException {
        JSONObject result = new JSONObject();
        DmGoods goods = dmGoodsService.getGoodsById(goodsId);
        ShoppingCart cart = getShoppingCart();
        DmShoppingCartItem item = cart.saveGoodsInCart(goods, itemNo);
        LoginInfo currUser = getCurrentLoginUser();
        if (currUser != null) {
            dmShoppingCartService.saveShoppingCart(item);
        }
        result.put("success", true);
        return result.toString();
    }

    @PUT
    @Produces({MediaType.APPLICATION_JSON})
    @Path("buy/{goodsIds}")
    public String addBuyingGoods(@PathParam("goodsIds") String goodsIds) throws JSONException {
        String[] goodsIdArray = goodsIds.split("\\|");
        addBuyingGoods(goodsIdArray);
        JSONObject result = new JSONObject();
        result.put("success", true);
        return result.toString();
    }

    @DELETE
    @Produces({MediaType.APPLICATION_JSON})
    @Path("del/{goodsId}")
    public String removeGoodsFromCart(@PathParam("goodsId") Integer goodsId) throws JSONException {
        removeGoodsFromCart(new Integer[]{goodsId});
        JSONObject result = new JSONObject();
        result.put("success", true);
        return result.toString();
    }


    @GET
    @Produces({MediaType.APPLICATION_JSON})
    @Path("list")
    public String mycartList() throws JSONException {
        ShoppingCart cart = getShoppingCart();
        List<DmShoppingCartItem> allGoodsInCart = cart.getAllGoodsInCart();
//        JSONObject result = new JSONObject();
//        result.put("rows", allGoodsInCart.size());
        JSONArray result = new JSONArray();
        for (DmShoppingCartItem item : allGoodsInCart) {
            JSONObject jobj = new JSONObject();
            jobj.put("goodsId", item.getGoodsId());
            jobj.put("amount",String.valueOf(item.getAmount()));
            jobj.put("goodsImage", item.getGoodsImage());
            jobj.put("goodsName", item.getGoodsName());
            jobj.put("price", String.valueOf(item.getPrice()));
            jobj.put("itemNo", item.getItemNo());
            result.put(jobj);
        }
//        result.put("result", array);
        return result.toString();
    }

    @GET
    @Produces({MediaType.APPLICATION_JSON})
    @Path("calc")
    public String calcOrderAmount() throws JSONException {
        ShoppingCart cart = getShoppingCart();
        cart.getBuyingAmount();
        JSONObject result = new JSONObject();
        result.put("totalPrice", String.valueOf(cart.getTotalAmount()));
        result.put("totalCount", cart.getTotalCount());
        return result.toString();
        /*LoginInfo currUser = getCurrentLoginUser();
        if(currUser!=null){
            dmShoppingCartService.saveShoppingCart(item);
        }
        return String.valueOf(true);*/
    }


    @GET
    @Produces(MediaType.TEXT_HTML)
    public ModelAndView myShoppingCart(@Context HttpServletRequest request) {
        LoginInfo currUser = getCurrentLoginUser();
        if (currUser != null) {
            request.setAttribute("isLogin", true);
        } else {
            request.setAttribute("isLogin", false);
        }
        return new ModelAndView("/market/cart/mycart.jsp");
    }

    @GET
    @Produces(MediaType.TEXT_HTML)
    @Path("success")
    public ModelAndView addCartSuccess(@Context HttpServletRequest request) {
        return new ModelAndView("/market/cart/addtocart.jsp");
    }
}
