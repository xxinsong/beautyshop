package com.qimeng.bs.admin.merchant.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;

import com.qimeng.common.Page;
import com.qimeng.bs.admin.merchant.bean.DmContact;
import com.qimeng.bs.admin.merchant.bean.DmMerchant;
import com.qimeng.bs.admin.merchant.dao.DmContactMapper;
import com.qimeng.bs.admin.merchant.service.DmContactService;
import com.qimeng.bs.admin.merchant.service.DmMerchantService;
import com.qimeng.bs.common.controller.GenericController;
import com.qimeng.bs.login.bean.LoginInfo;

@Controller
@RemoteProxy
@SuppressWarnings("unchecked")
public class DmMerchantController extends GenericController{

	@Autowired
	private DmMerchantService dmMerchantService;
	@Autowired
	private DmContactService dmContactSercice;

	public Page queryPage(Map params, int pageIndex, int pageSize) {
		return dmMerchantService.queryPage(params, pageIndex, pageSize);
	}
		
	public Map<String,Object> updateAction(DmMerchant dmMerchant){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		ret.put("msg", "更新成功");
		dmMerchantService.updateMerchant(dmMerchant);
		return ret;
	}
	
	/*public Map<String,Object> auditYes(DmMerchant dmMerchant){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		dmMerchant.setState("00A");
		dmMerchantService.updateStateByPrimaryKey(dmMerchant);
		return ret;
	}
	
	public Map<String,Object> auditNo(DmMerchant dmMerchant){
		Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		dmMerchant.setState("00L");
		dmMerchantService.updateStateByPrimaryKey(dmMerchant);
		return ret;
	}*/
	
	public Map<String,Object> submitOrderCheck(){
    String state = "";
    LoginInfo loginInfo = getCurrentLoginUser();
    Map<String,Object> ret = new HashMap<String,Object>();
    ret.put("stateCode", "");//状态代码
    if(loginInfo!=null){
       DmMerchant theUserMerchant = dmMerchantService.findMerchantByUserId(loginInfo.getUserId());
       if(theUserMerchant!=null){
         state = theUserMerchant.getState();
         if(!"00A".equals(state)){
           ret.put("msg", "您的商户状态已经被锁定或无效,无法提交订单");//状态无效，锁定--不能提交订单
         }
         DmContact contacts = dmContactSercice.getDefaultContact();
         if(contacts==null){
           ret.put("msg", "没有收货人信息,无法提交订单");//联系人为空
         }else{
           if(StringUtils.isEmpty(contacts.getAddress())
               ||StringUtils.isEmpty(contacts.getContactName())
               ||StringUtils.isEmpty(contacts.getMobile())){
             ret.put("msg", "无法提交订单,请完善联系人信息");//收货人信息不全
           }
         }
       }
    }
    return ret;
  }
}
