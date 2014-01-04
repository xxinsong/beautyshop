package com.qimeng.bs.market.activity.controller;

import com.qimeng.common.Page;
import com.qimeng.common.interceptor.LoginAnnotation;
import com.qimeng.bs.common.controller.GenericController;
import com.qimeng.bs.common.exception.FormInvalideException;
import com.qimeng.bs.login.bean.LoginInfo;
import com.qimeng.bs.market.activity.bean.DmMerchantActivity;
import com.qimeng.bs.market.activity.service.DmMerchantActivityService;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.apache.log4j.Logger;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

/**
 * User: Simon
 * Date: 13-12-4
 */
@Controller
@RemoteProxy
@RequestMapping("/market/activity")
public class DmMerchantActivityController extends GenericController {
    private Logger logger = Logger.getLogger(DmMerchantActivityController.class);
    @Autowired
    private DmMerchantActivityService dmMerchantActivityService;

    @RemoteMethod
    public boolean deleteMerchantActivity(int id) {
        dmMerchantActivityService.deleteMerchantActivity(id);
        return true;
    }

    @RemoteMethod
    public Page selectMerchantActivityList(Map params, int pageIndex, int pageSize) {
        LoginInfo currUser = getCurrentLoginUser();
        params.put("merchantId", currUser.getMerchantId());
        Page result = dmMerchantActivityService.selectMerchantActivityList(params, pageIndex, pageSize);
        return result;
    }

    @RemoteMethod
    public String saveActivity(Map params) throws ParseException, JSONException {
        Integer actId = MapUtils.getInteger(params, "actId");
        JSONObject result = new JSONObject();
        try {
            if (actId == null) {
                createActivity(params);
            } else {
                updateActivity(params);
            }
            result.put("success",true);
        } catch (FormInvalideException e) {
            result.put("success",false);
            result.put("reason",e.getMessage());
        }
        return result.toString();
    }

    private boolean updateActivity(Map params) throws ParseException {
        DmMerchantActivity activity = copyProperties(params);
        dmMerchantActivityService.updateMerchantActivity(activity);
        return true;
    }

    private boolean createActivity(Map params) throws ParseException {
        DmMerchantActivity activity = copyProperties(params);
        activity.setCreateTime(new Date());
        activity.setStateTime(new Date());
        dmMerchantActivityService.insertMerchantActivity(activity);
        return true;
    }

    @RequestMapping("edit")
    @LoginAnnotation
    public String editActivity(HttpServletRequest request) {
        int actId = NumberUtils.toInt(request.getParameter("actId"));
        DmMerchantActivity activity = dmMerchantActivityService.selectMerchantActivityByKey(actId);
        request.setAttribute("activity", activity);
        return "/market/activity/createactivity.jsp";
    }

    @RequestMapping("myactivities")
    @LoginAnnotation
    public String listMyActivity(HttpServletRequest request) {
        return "/market/activity/merchantactivity.jsp";
    }

    @RequestMapping("create")
    @LoginAnnotation
    public String createActivity(HttpServletRequest request) {
        return "/market/activity/createactivity.jsp";
    }

    private DmMerchantActivity copyProperties(Map params) throws ParseException {
        Date beginTime = DateUtils.parseDate(MapUtils.getString(params, "beginTime"), "yyyy-MM-dd");
        Date endTime = DateUtils.parseDate(MapUtils.getString(params, "endTime"), "yyyy-MM-dd");

        validateForm(beginTime, endTime);

        DmMerchantActivity activity = new DmMerchantActivity();
        activity.setActId(MapUtils.getInteger(params, "actId"));
//        todo  获取merchantId
        LoginInfo currUser = getCurrentLoginUser();
        activity.setMerchantId(currUser.getMerchantId());
        activity.setActName(MapUtils.getString(params, "actName"));
        activity.setBeginTime(beginTime);
        activity.setEndTime(endTime);
        activity.setSendMethod(MapUtils.getString(params, "sendMethod"));
        activity.setGoodsInstId(MapUtils.getInteger(params, "goodsInstId"));
        activity.setGoodsName(MapUtils.getString(params, "goodsName"));
        activity.setSmsContent(MapUtils.getString(params, "smsContent"));
        activity.setState("0");
        return activity;
    }

    private void validateForm(Date beginTime, Date endTime) {
        StringBuilder sb = new StringBuilder();
        if (DateUtils.truncatedCompareTo(endTime, beginTime, Calendar.HOUR) < 0) {
            sb.append("结束时间必须大于等于开始时间!\n");
        }
        if (DateUtils.truncatedCompareTo(beginTime, new Date(), Calendar.HOUR) <= 0) {
            sb.append("开始时间必须大于当前时间!\n");
        }
        if (DateUtils.truncatedCompareTo(endTime, new Date(), Calendar.HOUR) <= 0) {
            sb.append("结束时间必须大于当前时间!\n");
        }
        if(sb.length()>0){
            throw new FormInvalideException(sb.toString());
        }
    }
}
