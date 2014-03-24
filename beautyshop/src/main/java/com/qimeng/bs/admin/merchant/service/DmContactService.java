package com.qimeng.bs.admin.merchant.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qimeng.common.Page;
import com.qimeng.common.web.ApplicationContextUtil;
import com.qimeng.bs.admin.merchant.bean.DmContact;
import com.qimeng.bs.admin.merchant.dao.DmContactMapper;
import com.qimeng.bs.login.bean.LoginInfo;

@Service
public class DmContactService {
 
  @Autowired
  private DmContactMapper  dmContactMapper;
  
  public Page<DmContact> queryPage(Page<DmContact> page){
    List<DmContact> rows = dmContactMapper.findAllContact(page);
    page.setRows(rows);
    return page;
  }
  
  
  @Transactional
  public int save(DmContact contact){
    int rows = dmContactMapper.insert(contact);
    return rows;
  }
  
  @Transactional
  public int update(DmContact contact){
    return dmContactMapper.updateByPrimaryKeySelective(contact);
  }
  
  @Transactional
  public int delete(DmContact contact){
     Integer contactId = contact.getContactId();
     return dmContactMapper.deleteByPrimaryKey(contactId);
  }
  
  @Transactional
  public Boolean marketTheDefaultFlag(DmContact contact){
    Boolean result = true;
    LoginInfo loginUser = ApplicationContextUtil.getCurrentLoginUser();
    if(loginUser==null){
      result = false;
    }else{
      dmContactMapper.resetDefaultFlagByMerchantId(loginUser.getMerchantId());
      contact.setDefaultFlag("1");
      dmContactMapper.updateByPrimaryKeySelective(contact);
    }
    return result;
  }
  
  public DmContact getDefaultContact(){
    DmContact ret = null;
    LoginInfo loginUser = ApplicationContextUtil.getCurrentLoginUser();
    if(loginUser!=null){
      ret = dmContactMapper.getDefaultContact(loginUser.getMerchantId());
    }
    return ret;
  }
}
