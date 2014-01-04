package com.qimeng.bs.admin.pay.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.qimeng.bs.admin.pay.Md5Tool;
import com.qimeng.bs.admin.pay.bean.DmPayConfig;
import com.qimeng.bs.admin.pay.dao.DmPayConfigMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * User: yuan.yonghang
 * Date: 13-12-20
 * 支付参数
 */
@Service
@SuppressWarnings("unchecked")
public class DmPayConfigService {
    @Autowired
    private DmPayConfigMapper dmPayConfigMapper;

    public Map loadAllPayConfig(){
        return getPayConfig();
    }
    
	public Map getPayConfig() {
		Map map = new HashMap();
		List list = dmPayConfigMapper.selectAll();
		for(Object obj : list) {
			DmPayConfig pay = (DmPayConfig)obj;
			map.put(pay.getParamCode(), pay.getParamValue());
		}
		return map;
	}

	public Map<String, Object> getOrderConfig(Map params) {
		Map ret = getPayConfig();
		String BANKKEY = (String)ret.get("BANKKEY");
		String MERCHANTID = (String)ret.get("MERCHANTID");
		String RETNCODE = (String)ret.get("RETNCODE");
		String RETNINFO = (String)ret.get("RETNINFO");
		
		String ORDERREQTRANSEQ = (String)params.get("ORDERREQTRANSEQ");
		String ORDERSEQ = (String)params.get("ORDERSEQ");
		String ORDERAMOUNT = (String)params.get("ORDERAMOUNT");
		String TRANDATE = (String)params.get("TRANDATE");
		
		String strSRC = "UPTRANSEQ="+ORDERREQTRANSEQ+"&MERCHANTID="+MERCHANTID+"&ORDERID="+ORDERSEQ
			+"&PAYMENT="+ORDERAMOUNT+"&RETNCODE="+RETNCODE+"&RETNINFO="+RETNINFO+"&PAYDATE="+TRANDATE+"&KEY="+BANKKEY;
		String SIGN = Md5Tool.getHashString(strSRC);
		
		ret.put("SIGN", SIGN);
		ret.put("success", true);
		return ret;
	}
}
