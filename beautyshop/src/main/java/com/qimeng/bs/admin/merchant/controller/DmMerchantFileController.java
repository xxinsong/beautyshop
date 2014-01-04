package com.qimeng.bs.admin.merchant.controller;

import java.util.Map;

import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.qimeng.common.Page;
import com.qimeng.bs.admin.merchant.service.DmMerchantFileService;

@Controller
@RemoteProxy
@SuppressWarnings("unchecked")
public class DmMerchantFileController {

	@Autowired
	private DmMerchantFileService dmMerchantFileService;

	public Page queryPage(Map params, int pageIndex, int pageSize) {
		return dmMerchantFileService.queryPage(params, pageIndex, pageSize);
	}
	
}
