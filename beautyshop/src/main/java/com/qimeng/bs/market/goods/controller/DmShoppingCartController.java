package com.qimeng.bs.market.goods.controller;

import com.qimeng.bs.common.controller.GenericController;
import com.qimeng.bs.login.bean.LoginInfo;
import com.qimeng.bs.market.goods.ShoppingCart;
import com.qimeng.bs.market.goods.bean.DmGoodsInst;
import com.qimeng.bs.market.goods.service.DmShoppingCartService;
import com.qimeng.common.Page;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.GET;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * User: Simon
 * Date: 13-12-26
 */
//@RemoteProxy
@Controller
public class DmShoppingCartController extends GenericController {

    @Autowired
    DmShoppingCartService dmShoppingCartService;

    @RemoteMethod
    public Map<String,String> getBuyerInfo(){
        LoginInfo currUser = getCurrentLoginUser();
        return null;
    }

    @RemoteMethod
    public Page getCartGoodsList(Map params, int pageIndex, int pageSize){
        ShoppingCart cart = getShoppingCart();
        List<DmGoodsInst> instList = cart.getAllGoodsInCart();
        int size = instList.size();
        Page<DmGoodsInst> page = new Page<DmGoodsInst>(pageIndex,pageSize);
        page.setTotal(size);
        if(size>0){
            int startIndex = (pageIndex-1)*pageSize;

            int endIndex = pageIndex*pageSize;
            endIndex = (endIndex > size) ? size:endIndex;
            page.setRows(instList.subList(startIndex,endIndex));
        }
        return page;
    }

    @RemoteMethod
    public Page getBuyingGoodsList(Map params, int pageIndex, int pageSize) {
        ShoppingCart cart = getShoppingCart();
        List<DmGoodsInst> instList = cart.getBuyingGoods();
        int size = instList.size();
        Page<DmGoodsInst> page = new Page<DmGoodsInst>(pageIndex,pageSize);
        page.setTotal(size);
        if(size>0){
            int startIndex = (pageIndex-1)*pageSize;

            int endIndex = pageIndex*pageSize;
            endIndex = (endIndex > size) ? size:endIndex;
            page.setRows(instList.subList(startIndex,endIndex));
        }
        return page;
    }

    @RemoteMethod
    public boolean addBuyingGoods(String[] buyingGoods){
        List<String> instIds = Arrays.asList(buyingGoods);
        ShoppingCart shoppingCart = getShoppingCart();
        shoppingCart.getBuyingGoods().clear();
        for (DmGoodsInst inst : shoppingCart.getAllGoodsInCart()) {
            Integer instId = inst.getInstId();
            if(instIds.contains(instId.toString())){
                shoppingCart.addBuyingGoods(inst);
            }
        }
        return true;
    }

    @RemoteMethod
    public LoginInfo loadContactInfo(){
        return getCurrentLoginUser();
    }

    @RemoteMethod
    public boolean deleteGoodsInstFromCart(Integer[] instIds){
        ShoppingCart cart = getShoppingCart();
        cart.removeGoods(instIds);
        dmShoppingCartService.removeGoodsInCart(instIds);
        return true;
    }

    @RemoteMethod
    public boolean deleteAllGoodsInstFromCart(){
        ShoppingCart cart = getShoppingCart();
        cart.removeAllGoods();
        LoginInfo currUser = getCurrentLoginUser();
        dmShoppingCartService.removeAllGoods(currUser.getMerchantId());
        return true;
    }

    @PUT
    @Path("/mycart/add/{goodsId}")
//    @RequestMapping(value = "/mycart/add/{goodsId}",method = RequestMethod.PUT)
    public boolean putGoodsIntoCart(@PathParam("goodsId") Integer goodsId){
        ShoppingCart cart = getShoppingCart();
        cart.putGoodsInCart(goodsId);
        return true;
    }

    @GET
    @Path("/mycart/{goodsId}")
//    @RequestMapping(value = "/mycart/add/{goodsId}",method = RequestMethod.PUT)
    public Integer getGoodsIntoCart(@PathParam("goodsId") Integer goodsId){
        ShoppingCart cart = getShoppingCart();
        return goodsId;
    }

    @RequestMapping("/mycart")
    public String myShoppingCart(HttpServletRequest request){
        LoginInfo currUser = getCurrentLoginUser();
        if(currUser!=null){
            request.setAttribute("isLogin",true);
        }else{
            request.setAttribute("isLogin",false);
        }
        return "/market/cart/mycart.jsp";
    }
}
