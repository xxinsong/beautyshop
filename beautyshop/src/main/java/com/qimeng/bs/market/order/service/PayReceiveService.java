package com.qimeng.bs.market.order.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qimeng.bs.admin.pay.Md5Tool;
import com.qimeng.bs.admin.pay.bean.DmPayConfig;
import com.qimeng.bs.admin.pay.dao.DmPayConfigMapper;
import com.qimeng.bs.market.goods.bean.DmGoodsInst;
import com.qimeng.bs.market.goods.dao.DmGoodsInstMapper;
import com.qimeng.bs.market.order.bean.DmCustOrder;
import com.qimeng.bs.market.order.bean.DmSubCustOrder;
import com.qimeng.bs.market.order.dao.DmCustOrderMapper;
import com.qimeng.bs.market.order.dao.DmSubCustOrderMapper;

@Service
@SuppressWarnings("unchecked")
public class PayReceiveService {
	
	@Autowired	
	private DmPayConfigMapper dmPayConfigMapper;
	@Autowired
    private DmCustOrderMapper dmCustOrderMapper;
	@Autowired
    private DmSubCustOrderMapper dmSubCustOrderMapper;
	@Autowired
    private	DmGoodsInstMapper dmGoodsInstMapper;
	
	public Map<String,Object> checkResult(Map params) {
		
		String KEY = "";
		String MERCHANTID = "";
		String UPTRANSEQ = (String) params.get("UPTRANSEQ");
		String ORDERSEQ = (String) params.get("ORDERSEQ");
		String ORDERAMOUNT = (String) params.get("ORDERAMOUNT");
		String RETNCODE = (String) params.get("RETNCODE");
		String RETNINFO = (String) params.get("RETNINFO");
		String TRANDATE = (String) params.get("TRANDATE");
		String SIGN = (String) params.get("SIGN");
		
		Map ret = getPayConfig();
		KEY = (String) ret.get("KEY");
		MERCHANTID = (String) ret.get("MERCHANTID");
				
		String strSRC = "UPTRANSEQ="+UPTRANSEQ+"&MERCHANTID="+MERCHANTID+"&ORDERID="+ORDERSEQ
			+"&PAYMENT="+ORDERAMOUNT+"&RETNCODE="+RETNCODE+"&RETNINFO="+RETNINFO+"&PAYDATE="+TRANDATE+"&KEY="+KEY;
		String merSIGN = Md5Tool.getHashString(strSRC);
		
		//Map<String,Object> ret = new HashMap<String,Object>();
		ret.put("success", true);
		ret.put("msg", "支付成功");
		int orderId = Integer.valueOf(ORDERSEQ);
		
		String orderNo = getCustOrder(orderId);
		ret.put("orderNo", orderNo);
		if (merSIGN.equals(SIGN)){
			if ("0000".equals(RETNCODE)){
				commitOrder(orderId);
				ret.put("success", true);
				ret.put("msg", "支付成功");
			}else {
				redoneOrder(orderId);
				ret.put("success", false);
				ret.put("msg", "支付出错");
			}
		}else{
			redoneOrder(orderId);
		    ret.put("success", false);
			ret.put("msg", "校验失败,数据可疑");
		}
		
		return ret;
	}
	
	private Map getPayConfig() {
		Map map = new HashMap();
		List list = dmPayConfigMapper.selectAll();
		for(Object obj : list) {
			DmPayConfig pay = (DmPayConfig)obj;
			map.put(pay.getParamCode(), pay.getParamValue());
		}
		return map;
	}
	
	private void commitOrder(int orderId) {
		//子订单
		commitSubOrder(orderId);
		DmCustOrder dmCustOrder = new DmCustOrder();
		dmCustOrder.setOrderId(orderId);
		dmCustOrder.setState("10D");//订单完成 
		dmCustOrderMapper.updateByPrimaryKeySelective(dmCustOrder);
	}
	
	private void commitSubOrder(int orderId) {		
		List<DmSubCustOrder> list = dmSubCustOrderMapper.selectSubOrderByOrderId(orderId);
		for(DmSubCustOrder dmSubCustOrder : list) {
			//子订单完成，加上过滤
			dmSubCustOrder.setState("10D");
			dmSubCustOrderMapper.updateByPrimaryKeySelective(dmSubCustOrder);
			//商品实例
			int instId = dmSubCustOrder.getGoodsInstId();
			commitGoodInst(instId);
		}		
	}
	
	private void commitGoodInst(int instId){
		DmGoodsInst record = new DmGoodsInst();
		record.setInstId(instId);
		record.setState("00P");
		dmGoodsInstMapper.updateByPrimaryKeySelective(record);
	}
	
	private void redoneOrder(int orderId) {
		//子订单
		redoneSubOrder(orderId);
		DmCustOrder dmCustOrder = new DmCustOrder();
		dmCustOrder.setOrderId(orderId);
		dmCustOrder.setState("10A");//订单完成 
		dmCustOrderMapper.updateByPrimaryKeySelective(dmCustOrder);
	}
	
	private void redoneSubOrder(int orderId) {		
		List<DmSubCustOrder> list = dmSubCustOrderMapper.selectSubOrderByOrderId(orderId);
		for(DmSubCustOrder dmSubCustOrder : list) {
			//子订单完成，加上过滤
			dmSubCustOrder.setState("10A");
			dmSubCustOrderMapper.updateByPrimaryKeySelective(dmSubCustOrder);
		}		
	}
	
	private String getCustOrder(int orderId) {
		DmCustOrder dmCustOrder = dmCustOrderMapper.selectByPrimaryKey(orderId);
		return dmCustOrder.getOrderNo();
	}

}
