package com.qimeng.bs.market.order.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qimeng.bs.admin.pay.Md5Tool;
import com.qimeng.bs.admin.pay.bean.DmPayConfig;
import com.qimeng.bs.admin.pay.dao.DmPayConfigMapper;
import com.qimeng.bs.market.order.bean.DmCustOrder;
import com.qimeng.bs.market.order.bean.DmSubCustOrder;
import com.qimeng.bs.market.order.dao.DmCustOrderMapper;
import com.qimeng.bs.market.order.dao.DmSubCustOrderMapper;

@Service
@SuppressWarnings("unchecked")
public class PaySendService {
	
	@Autowired	
	private DmPayConfigMapper dmPayConfigMapper;
	@Autowired
    private DmCustOrderMapper dmCustOrderMapper;
	@Autowired
    private DmSubCustOrderMapper dmSubCustOrderMapper;
		
	public Map getPayConfig() {
		Map map = new HashMap();
		List list = dmPayConfigMapper.selectAll();
		for(Object obj : list) {
			DmPayConfig pay = (DmPayConfig)obj;
			map.put(pay.getParamCode(), pay.getParamValue());
		}
		return map;
	}
		
	public Map<String, Object> queryPayConfig(Map params) {
		Map mapConf = getPayConfig();
		String MERCHANTID = (String)mapConf.get("MERCHANTID");
		String ORDERSEQ = (String)params.get("ORDERSEQ");
		//流水号
		String ORDERREQTRANSEQ = ORDERSEQ + "0001";
		Date currTime = new Date();
	    SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
	    String ORDERDATE=sf.format(currTime);
	    String ORDERAMOUNT = (String)params.get("ORDERAMOUNT");	    
		String strSRC = "MERCHANTID="+MERCHANTID+"&ORDERSEQ="+ORDERSEQ+"&ORDERDATE="+ORDERDATE+"&ORDERAMOUNT="+ORDERAMOUNT;
	    String MAC = Md5Tool.getHashString(strSRC);
	    
	    mapConf.put("ORDERREQTRANSEQ", ORDERREQTRANSEQ);
	    mapConf.put("ORDERDATE", ORDERDATE);
	    mapConf.put("MAC", MAC);
	    //订单处理中
	    prepareOrder(Integer.valueOf(ORDERSEQ));
	    
		return mapConf;
	}
	
	private void prepareOrder(int orderId) {
		//子订单
		prepareSubOrder(orderId);
		DmCustOrder dmCustOrder = new DmCustOrder();
		dmCustOrder.setOrderId(orderId);
		dmCustOrder.setState("10E");//订单处理中
		dmCustOrderMapper.updateByPrimaryKeySelective(dmCustOrder);
	}
	
	private void prepareSubOrder(int orderId) {		
		List<DmSubCustOrder> list = dmSubCustOrderMapper.selectSubOrderByOrderId(orderId);
		for(DmSubCustOrder dmSubCustOrder : list) {
			//子订单完成，加上过滤
			dmSubCustOrder.setState("10E");
			dmSubCustOrderMapper.updateByPrimaryKeySelective(dmSubCustOrder);
		}		
	}
}
