package com.qimeng.bs.admin.goods.controller;

import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.qimeng.bs.login.bean.AdminLoginInfo;
import org.apache.commons.lang3.time.DateUtils;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;

import com.qimeng.common.Page;
import com.qimeng.bs.admin.goods.bean.DmGoods;
import com.qimeng.bs.admin.goods.bean.DmTags;
import com.qimeng.bs.admin.goods.service.DmGoodsService;
import com.qimeng.bs.admin.goods.service.DmGoodsTagService;
import com.qimeng.bs.admin.goods.service.DmGoodsTagValueService;
import com.qimeng.bs.common.controller.GenericController;
import com.qimeng.bs.login.bean.LoginInfo;

@Controller
@RemoteProxy
public class DmGoodsController extends GenericController {

    @Autowired
    private DmGoodsService dmGoodsSerive;
    @Autowired
    private DmGoodsTagService dmGoodsTagService;
    @Autowired
    private DmGoodsTagValueService dmGoodsTagValueService;

    @RemoteMethod
    public Page queryPage(Map params, int pageIndex, int pageSize) {
        Page<DmGoods> page = new Page<DmGoods>(pageIndex, pageSize);
        page.setParams(params);
        page = dmGoodsSerive.queryPage(page);
        return page;
    }

    @RemoteMethod
    public Page queryGoodsOnPackage(Map params, int pageIndex, int pageSize) {
        Page<DmGoods> page = new Page<DmGoods>(pageIndex, pageSize);
        page.setParams(params);
        page = dmGoodsSerive.queryPage(page);
        return page;
    }

    @RemoteMethod
    public Map<String, Object> addAction(DmGoods good) throws Exception {
        Map<String, Object> ret = new HashMap<String, Object>();
        ret.put("success", true);
        ret.put("msg", "添加成功");
        AdminLoginInfo loginInfo = getCurrentLoginAdmin();
        if (loginInfo != null && !StringUtils.isEmpty(loginInfo.getStaffName())) {
            good.setCreateStaff(loginInfo.getStaffName());
        }
        good.setCreateDate(new Date());
        good.setEffDate(new Date());
        good.setExpDate(DateUtils.parseDate("2099-12-31", "yyyy-MM-dd"));
        if ("00A".equals(good.getState())) {//上架时间
            good.setPutawayTime(new Date());
        }
        dmGoodsSerive.save(good);
        return ret;
    }

    @RemoteMethod
    public Map<String, Object> updateAction(DmGoods good) throws Exception {
        Map<String, Object> ret = new HashMap<String, Object>();
        ret.put("success", true);
        ret.put("msg", "更新成功");
        if ("00A".equals(good.getState())) {//上架时间
            good.setPutawayTime(new Date());
        }
        dmGoodsSerive.update(good);
        return ret;
    }

    @RemoteMethod
    public Map<String, Object> deleteAction(DmGoods good) {
        Map<String, Object> ret = new HashMap<String, Object>();
        ret.put("success", true);
        ret.put("msg", "删除成功");
        dmGoodsSerive.delete(good);
        return ret;
    }


    /**
     * 根据商品查找商品拥有的所有标签--分页显示
     *
     * @param params
     * @param pageIndex
     * @param pageSize
     * @return
     */
    @RemoteMethod
    public Page queryPageTagsOnGoods(Map params, int pageIndex, int pageSize) {
        Page<DmTags> page = new Page<DmTags>(pageIndex, pageSize);
        page.setParams(params);
        page = dmGoodsTagService.findAllTagOnGoods(page);
        return page;
    }

    /**
     * 绑定商品标签
     *
     * @param good
     * @return
     */
    @RemoteMethod
    public Map<String, Object> attachTagsAndAllItems(DmGoods good) {
        Map<String, Object> ret = new HashMap<String, Object>();
        ret.put("success", true);
        ret.put("msg", "当前商品绑定标签成功");
        dmGoodsTagService.attachTagsAndAllItems(good);
        return ret;
    }

    /**
     * 解除商品与特定标签的绑定
     *
     * @param good
     * @return
     */
    @RemoteMethod
    public Map<String, Object> releasGoodTags(DmGoods good) {
        Map<String, Object> ret = new HashMap<String, Object>();
        ret.put("success", true);
        ret.put("msg", "解除绑定成功");
        Assert.isTrue(good.getTagGroupId() != null, "解除绑定失败");
        dmGoodsTagService.releasGoodTags(good.getTagGroupId());
        return ret;
    }

    /**
     * 绑定可选标签值
     *
     * @param good
     * @return
     */
    @RemoteMethod
    public Map<String, Object> attachGoodsTagsItemValue(DmGoods good) {
        Map<String, Object> ret = new HashMap<String, Object>();
        ret.put("success", true);
        ret.put("msg", "当前商品添加可选条目值成功");
        Assert.isTrue(good.getTagGroupId() != null, "当前商品绑定可选标签值失败");
        dmGoodsTagValueService.attachGoodsTagsItems(good);
        return ret;
    }

    @RemoteMethod
    public DmGoods getGoodsById(DmGoods goods) {
        return dmGoodsSerive.getGoodsById(goods.getGoodsId());
    }
}
