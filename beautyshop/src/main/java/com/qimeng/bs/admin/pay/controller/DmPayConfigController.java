package com.qimeng.bs.admin.pay.controller;

import java.util.Map;

import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.qimeng.bs.admin.pay.service.DmPayConfigService;

@Controller
@RemoteProxy
@SuppressWarnings("unchecked")
public class DmPayConfigController {

	@Autowired
	private DmPayConfigService dmPayConfigService;
	
	public Map<String,Object> getOrderConfig(Map params){
		return dmPayConfigService.getOrderConfig(params);
	}
	
	public Map<String,Object> loadAllPayConfig(){
        return dmPayConfigService.loadAllPayConfig();
    }
}
