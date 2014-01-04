package com.qimeng.bs.market.goods.controller;

import java.util.List;
import java.util.Map;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.qimeng.bs.common.controller.GenericController;
import com.qimeng.bs.login.bean.LoginInfo;
import com.qimeng.bs.market.goods.bean.DmBizCircle;
import com.qimeng.bs.market.goods.bean.DmGoodsInst;
import com.qimeng.bs.market.goods.service.DmBizCircleService;
import com.qimeng.bs.market.goods.service.DmGoodsInstService;

/**
 * User: Simon
 * Date: 13-12-11
 */
@Controller
@RemoteProxy
public class DmGoodsInstController extends GenericController{
    @Autowired
    private DmGoodsInstService dmGoodsInstService;
    @Autowired
    private DmBizCircleService dmBizCircleService;
    
    
    @RemoteMethod
    public List<DmGoodsInst> queryAvailableGoodsInst(Integer checkedInstId){
        LoginInfo currUser = getCurrentLoginUser();

        return dmGoodsInstService.queryAvailableGoodsInst(currUser.getMerchantId(),checkedInstId);
    }
    
    @RemoteMethod
    public DmBizCircle insertDmBizCircle( Map param){
   
        return dmBizCircleService.insertDmBizCircle(param );
    }
    
    @RemoteMethod
    public Map sumitCartGoods(Map param){
        LoginInfo loginInfo = getCurrentLoginUser();
        
 
        return dmGoodsInstService.sumitCartGoods(    param);
    }
}
