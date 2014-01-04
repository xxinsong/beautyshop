package com.qimeng.bs.market.comments.controller;

import com.qimeng.common.Page;
import com.qimeng.bs.common.controller.GenericController;
import com.qimeng.bs.login.bean.LoginInfo;
import com.qimeng.bs.market.comments.bean.DmCustComment;
import com.qimeng.bs.market.comments.bean.DmGoodsEvaluation;
import com.qimeng.bs.market.comments.service.DmGoodsCommentsService;
import org.apache.commons.collections.MapUtils;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.Date;
import java.util.Map;

/**
 * User: Simon
 * Date: 13-12-16
 */
@RemoteProxy
@Controller
public class DmGoodsCommentsController extends GenericController{
    @Autowired
    private DmGoodsCommentsService dmGoodsCommentsService;

    @RemoteMethod
    public DmGoodsEvaluation queryGoodsEvaluation(int goodsId){
        return dmGoodsCommentsService.queryGoodsEvaluation(goodsId);
    }

    @RemoteMethod
    public Page<DmCustComment> queryCustComments(Map params,int pageIndex,int pageSize){
        Page result = dmGoodsCommentsService.queryCustComments(params,pageIndex,pageSize);
        return result;
    }

    @RemoteMethod
    public boolean addCustComment(Map params){
        DmCustComment comment = new DmCustComment();
        LoginInfo currUser = getCurrentLoginUser();
        comment.setMerchantId(currUser.getMerchantId());
        comment.setOrdDetailNo(MapUtils.getInteger(params,"orderDetailNo"));

        comment.setGoodsId(MapUtils.getInteger(params,"goodsId"));
        comment.setAdvantage(MapUtils.getString(params,"advantage"));
        comment.setDisadvantage(MapUtils.getString(params, "disadvantage"));
        comment.setCustComment(MapUtils.getString(params, "comment"));
        comment.setScore(MapUtils.getInteger(params,"score"));
        comment.setState("00A");
        comment.setCreateTime(new Date());

        return dmGoodsCommentsService.addCustComment(comment);
    }
}
