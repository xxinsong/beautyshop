package com.qimeng.bs.market.user.service;

import com.qimeng.bs.market.user.bean.DmAddress;
import com.qimeng.bs.market.user.dao.DmAddressMapper;
import com.qimeng.common.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * User: Simon
 * Date: 14-1-15
 */
@Service
public class DmAddressService {

    @Autowired
    private DmAddressMapper dmAddressMapper;

    public Page<DmAddress> selectAddressList(Map params, int pageIndex, int pageSize) {
        Page page = new Page(pageIndex, pageSize);
        page.setParams(params);
        List<DmAddress> list = dmAddressMapper.selectByMerchantId(page);
        page.setRows(list);
        return page;
    }

    @Transactional
    public void setDefaultAddress(Map params) {
        dmAddressMapper.changeDefaultAddress(params);
        dmAddressMapper.setDefaultAddress(params);
    }

    @Transactional
    public void deleteAddress(Integer merchantId,Integer id, Integer isDefault) {
        dmAddressMapper.deleteByPrimaryKey(id);
        if(isDefault.intValue()==1){
            DmAddress firstAddress = dmAddressMapper.selectFirstAddess(merchantId);
            firstAddress.setIsDefault("1");
            dmAddressMapper.updateByPrimaryKeySelective(firstAddress);
        }

    }
    @Transactional
    public void saveAddress(DmAddress address) {
        Integer id = address.getId();
        if(id!=null) {
            dmAddressMapper.updateByPrimaryKeySelective(address);
        }else {
            dmAddressMapper.insert(address);
        }
    }

    public DmAddress selectAddressById(Integer id) {
        return dmAddressMapper.selectByPrimaryKey(id);
    }
}
