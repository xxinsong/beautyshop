package com.qimeng.bs.admin.inte.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qimeng.common.Page;
import com.qimeng.bs.admin.inte.bean.InterfaceParam;
import com.qimeng.bs.admin.inte.dao.InterfaceParamMapper;

@Service
@SuppressWarnings("unchecked")
public class InterfaceParamService {
  
    @Autowired
    public InterfaceParamMapper interfaceParamMapper;
     
    public Page searchAllByPage(Map params, int pageIndex, int pageSize) {
    	Page<InterfaceParam> page = new Page<InterfaceParam>(pageIndex, pageSize);
        page.setParams(params);
        List<InterfaceParam> rows = interfaceParamMapper.searchAllByPage(page);
        page.setRows(rows);
        return page;
    }
    
	public int insertInterfaceParam(InterfaceParam record) {
		return interfaceParamMapper.insert(record);		
	}

	public int updateInterfaceParam(InterfaceParam record) {
		return interfaceParamMapper.updateByPrimaryKey(record);		
	}
	
	public int delteInterfaceParam(InterfaceParam record) {
		return interfaceParamMapper.deleteByPrimaryKey(record.getId());
	}  
    
}
