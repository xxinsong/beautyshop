package com.qimeng.bs.system.staticdata.controller;

import java.util.ArrayList;
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

    public List<DcAttrValue> getStaticData(String attrCode,String parentAttrValue) {
        List<DcAttrValue> list = new ArrayList<DcAttrValue>();
        List<DcAttrValue> staticData = staticDataService.getStaticData(attrCode);
        if(parentAttrValue!=null){
            for (DcAttrValue attrValue : staticData) {
                if(attrValue.getAttrValue().startsWith(parentAttrValue)){
                    list.add(attrValue);
                }
            }
        }else {
            list.addAll(staticData);
        }
        return list;
    }
}
