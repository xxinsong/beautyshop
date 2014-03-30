package com.qimeng.bs.market.user.controller;

import com.qimeng.bs.common.controller.GenericController;
import com.qimeng.bs.login.bean.AdminLoginInfo;
import com.qimeng.bs.login.bean.LoginInfo;
import com.qimeng.bs.market.point.bean.DmPoints;
import com.qimeng.bs.market.point.service.DmPointService;
import com.qimeng.bs.market.user.bean.ReferrerInfo;
import com.qimeng.bs.market.user.service.ReferrerInfoService;
import com.qimeng.common.Page;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * User: Simon
 * Date: 14-1-25
 */
@Controller
@RemoteProxy
@Path("/setting")
public class ReferrerInfoController extends GenericController{

    @Autowired
    private ReferrerInfoService referrerInfoService;
    @Autowired
    private DmPointService dmPointService;

//    @Path("referrers")
    @RemoteMethod
    public Page<ReferrerInfo> queryMyReferrers(Map params,int pageIndex, int pageSize) {
        LoginInfo currUser = getCurrentLoginUser();
        if(currUser!=null) {
            params.put("referrerId",currUser.getUserId());
            return referrerInfoService.queryMyReferrers(params,pageIndex,pageSize);
        }
        return null;
    }
    @RemoteMethod
    public Map modifyReferrer(Map params) {
        Map result = new HashMap();
        AdminLoginInfo currUser = getCurrentLoginAdmin();
        if(currUser!=null) {
            result = referrerInfoService.modifyReferrer(params);
        }else{
            result.put("success",false);
            result.put("reason", "用户未登录！");
        }
        return result;

    }

    @GET
    @Produces({MediaType.APPLICATION_JSON})
    @Path("/referrer/total")
    public String getTotalReferrers() throws JSONException {
        LoginInfo currUser = getCurrentLoginUser();
        JSONObject result = new JSONObject();
        if(currUser!=null) {
            int totalReferrers = referrerInfoService.getTotalReferrers(currUser.getUserId());
            result.put("total", totalReferrers);
        }else{
            result.put("total", 0);
        }
        return result.toString();
    }

    @GET
    @Produces({MediaType.APPLICATION_JSON})
    @Path("/referrer/earnings")
    public String getTotalEarnning() throws JSONException {
        int times = 5;
        LoginInfo currUser = getCurrentLoginUser();
        JSONObject result = new JSONObject();
        int total = 0;
        int remainder = 0;
        int lastExchange = 0;
        Date lastExchangeTime = null;
        if(currUser!=null) {
            DmPoints points = dmPointService.selectPointsByUserId(currUser.getUserId());

            if(points!=null){
                total = points.getTotalPoints() * times;
                remainder = points.getRemainderPoints() * times;
                lastExchange = points.getLastExchangePoints() * times;
                lastExchangeTime = points.getLastExchangeTime();
            }
//            result.put("total", total);
//            result.put("remainder", remainder);
//            result.put("lastExchange", lastExchange);
//            result.put("lastExchangeTime", lastExchangeTime);
        }
        result.put("total", total);
        result.put("remainder", remainder);
        result.put("lastExchange", lastExchange);
        result.put("lastExchangeTime", lastExchangeTime);
        return result.toString();
    }


    @RequestMapping("/setting/myreferrer")
    public ModelAndView referrerPage() {
        return new ModelAndView("/market/user/referrerinfo.jsp");
    }
}
