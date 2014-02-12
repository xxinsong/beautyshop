package com.qimeng.bs.market.user.controller;

import com.qimeng.bs.common.controller.GenericController;
import com.qimeng.bs.login.bean.LoginInfo;
import com.qimeng.bs.market.user.bean.ReferrerInfo;
import com.qimeng.bs.market.user.service.ReferrerInfoService;
import com.qimeng.common.Page;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.ws.rs.Path;
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

    @RequestMapping("/setting/myreferrer")
    public ModelAndView referrerPage() {
        return new ModelAndView("/market/user/referrerinfo.jsp");
    }
}
