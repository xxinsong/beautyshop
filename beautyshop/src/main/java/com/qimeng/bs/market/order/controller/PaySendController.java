package com.qimeng.bs.market.order.controller;

import java.util.Map;

import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.qimeng.bs.market.order.service.PaySendService;

@Controller
@RemoteProxy
@SuppressWarnings("unchecked")
public class PaySendController {

	@Autowired
	private PaySendService saySendService;
	
	public Map<String,Object> queryPayConfig(Map params) {
		return saySendService.queryPayConfig(params);
	}	
}
