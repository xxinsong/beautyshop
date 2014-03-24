package com.qimeng.bs.admin.inte.controller;

import java.util.HashMap;
import java.util.Map;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.qimeng.common.Page;
import com.qimeng.bs.admin.inte.bean.SystemInterface;
import com.qimeng.bs.admin.inte.service.SystemInterfaceService;
import com.qimeng.bs.common.controller.GenericController;

@Controller
@RemoteProxy
@SuppressWarnings("unchecked")
public class SystemInterfaceController extends GenericController{

	@Autowired
	private SystemInterfaceService interfaceService;
	
	@RemoteMethod
	public Page searchAllByPage(Map params, int pageIndex, int pageSize) { 
		return interfaceService.searchAllByPage(params, pageIndex, pageSize);
	}
	
    @RemoteMethod
    public Map<String, Object> addAction(SystemInterface record) {
        Map<String, Object> ret = new HashMap<String, Object>();
        ret.put("success", true);
        ret.put("msg", "添加成功");
        interfaceService.insertSystemInterface(record);
        return ret;
    }

    @RemoteMethod
    public Map<String, Object> updateAction(SystemInterface record) {
        Map<String, Object> ret = new HashMap<String, Object>();
        ret.put("success", true);
        ret.put("msg", "更新成功");
        interfaceService.updateSystemInterface(record);
        return ret;
    }

    @RemoteMethod
    public Map<String, Object> deleteAction(SystemInterface record) {
        Map<String, Object> ret = new HashMap<String, Object>();
        ret.put("success", true);
        ret.put("msg", "删除成功");
        interfaceService.delteSystemInterface(record);
        return ret;
    }

}
