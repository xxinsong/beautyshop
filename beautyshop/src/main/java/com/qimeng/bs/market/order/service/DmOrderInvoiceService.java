package com.qimeng.bs.market.order.service;

import com.qimeng.bs.market.order.bean.DmOrderInvoice;
import com.qimeng.bs.market.order.dao.DmOrderInvoiceMapper;
import com.qimeng.common.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;


/**
 * User: yuanyh
 * Date: 13-12-9
 */
@Service
@SuppressWarnings("unchecked")
public class DmOrderInvoiceService {

    @Autowired
    private DmOrderInvoiceMapper dmOrderInvoiceMapper;
     
    @Transactional
    public Page selectPage(Map params, int pageIndex, int pageSize) {
    	Page page = new Page(pageIndex, pageSize);
        page.setParams(params);
        List<DmOrderInvoice> list = dmOrderInvoiceMapper.selectOrderInvoiceByPage(page);
        page.setRows(list);
        return page;

    }

	public void issueInvoice(DmOrderInvoice dmOrderInvoice) {
		dmOrderInvoiceMapper.updateByPrimaryKeySelective(dmOrderInvoice);		
	}
	
	public void updateInvoice(DmOrderInvoice dmOrderInvoice) {
		dmOrderInvoiceMapper.updateByPrimaryKey(dmOrderInvoice);		
	}
}
