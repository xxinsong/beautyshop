package com.qimeng.bs.admin.merchant.controller;

import java.util.HashMap;
import java.util.Map;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.qimeng.common.Page;
import com.qimeng.bs.admin.merchant.bean.DmContact;
import com.qimeng.bs.admin.merchant.service.DmContactService;
import com.qimeng.bs.common.controller.GenericController;
import com.qimeng.bs.login.bean.LoginInfo;

@Controller
@RemoteProxy
public class DmContactConttroller extends GenericController {

    @Autowired
    private DmContactService dmContactService;

    @RemoteMethod
    public Page queryPage(Map params, int pageIndex, int pageSize) {
        Page<DmContact> page = new Page<DmContact>(pageIndex, pageSize);
        LoginInfo loginUser = getCurrentLoginUser();
        if (loginUser != null) {
            params.put("merchantId", loginUser.getMerchantId());
        }
        page.setParams(params);
        page = dmContactService.queryPage(page);
        return page;
    }

    @RemoteMethod
    public Page queryGoodsOnPackage(Map params, int pageIndex, int pageSize) {
        Page<DmContact> page = new Page<DmContact>(pageIndex, pageSize);
        page.setParams(params);
        page = dmContactService.queryPage(page);
        return page;
    }

    @RemoteMethod
    public Map<String, Object> addAction(DmContact contact) {
        Map<String, Object> ret = new HashMap<String, Object>();
        ret.put("success", true);
        ret.put("msg", "添加成功");
        LoginInfo loginUser = getCurrentLoginUser();
        if (loginUser != null) {
            contact.setMerchantId(loginUser.getMerchantId());
        }
        dmContactService.save(contact);
        return ret;
    }

    @RemoteMethod
    public Map<String, Object> updateAction(DmContact contact) {
        Map<String, Object> ret = new HashMap<String, Object>();
        ret.put("success", true);
        ret.put("msg", "更新成功");
        dmContactService.update(contact);
        return ret;
    }

    @RemoteMethod
    public Map<String, Object> deleteAction(DmContact contact) {
        Map<String, Object> ret = new HashMap<String, Object>();
        ret.put("success", true);
        ret.put("msg", "删除成功");
        dmContactService.delete(contact);
        return ret;
    }

    @RemoteMethod
    public Map<String, Object> marketDefaultChoice(DmContact contact) {
        Map<String, Object> ret = new HashMap<String, Object>();
        ret.put("success", true);
        ret.put("msg", "默认选择设置成功");
        dmContactService.marketTheDefaultFlag(contact);
        return ret;
    }

}
