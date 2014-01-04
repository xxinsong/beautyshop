package com.qimeng.bs.market.order.controller;

import java.util.Map;

import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.qimeng.bs.market.order.service.PayReceiveService;

@Controller
@RemoteProxy
@SuppressWarnings("unchecked")
public class PayReceiveController {

	@Autowired
	private PayReceiveService payReceiveService;
	
	public Map<String,Object> checkResult(Map params) {
		return payReceiveService.checkResult(params);
	}	
}
