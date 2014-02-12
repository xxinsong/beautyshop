package com.qimeng.bs.admin.merchant.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.qimeng.common.Page;
import com.qimeng.bs.admin.merchant.bean.DmContact;

@Repository
@SuppressWarnings("unchecked")
public interface DmContactMapper {
    int deleteByPrimaryKey(Integer contactId);

    int insert(DmContact record);

    int insertSelective(DmContact record);

    DmContact selectByPrimaryKey(Integer contactId);

    int updateByPrimaryKeySelective(DmContact record);

    int updateByPrimaryKey(DmContact record);
    
    List<DmContact> searchContacts(Map Params);
    
    int updateByMerchantId(DmContact record);
    
    List<DmContact> findAllContact(Page<DmContact> page);
    
    int resetDefaultFlagByMerchantId(Integer merchantId);
    
    DmContact getDefaultContact(Integer merchantId);
}