package com.qimeng.bs.admin.inte.controller;

import java.util.HashMap;
import java.util.Map;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.qimeng.common.Page;
import com.qimeng.bs.admin.inte.bean.InterfaceParam;
import com.qimeng.bs.admin.inte.service.InterfaceParamService;
import com.qimeng.bs.common.controller.GenericController;

@Controller
@RemoteProxy
@SuppressWarnings("unchecked")
public class InterfaceParamController extends GenericController{

	@Autowired
	private InterfaceParamService interfaceParamService;
	
	@RemoteMethod
	public Page searchAllByPage(Map params, int pageIndex, int pageSize) { 
		return interfaceParamService.searchAllByPage(params, pageIndex, pageSize);
	}
	
    @RemoteMethod
    public Map<String, Object> addParam(InterfaceParam record) {
        Map<String, Object> ret = new HashMap<String, Object>();
        ret.put("success", true);
        ret.put("msg", "添加成功");
        interfaceParamService.insertInterfaceParam(record);
        return ret;
    }

    @RemoteMethod
    public Map<String, Object> updateParam(InterfaceParam record) {
        Map<String, Object> ret = new HashMap<String, Object>();
        ret.put("success", true);
        ret.put("msg", "更新成功");
        interfaceParamService.updateInterfaceParam(record);
        return ret;
    }

    @RemoteMethod
    public Map<String, Object> deleteParam(InterfaceParam record) {
        Map<String, Object> ret = new HashMap<String, Object>();
        ret.put("success", true);
        ret.put("msg", "删除成功");
        interfaceParamService.delteInterfaceParam(record);
        return ret;
    }

}
