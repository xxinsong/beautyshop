package com.qimeng.bs.system.staticdata.controller;

import java.util.List;

import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.qimeng.bs.system.staticdata.bean.DcAttrValue;
import com.qimeng.bs.system.staticdata.service.StaticDataService;

@Controller
@RemoteProxy
@SuppressWarnings("unchecked")
public class StaticDataController {

	@Autowired
	private StaticDataService staticDataService;

	public List<DcAttrValue> getStaticData(String attrCode) {
		return staticDataService.getStaticData(attrCode);
	}
}
