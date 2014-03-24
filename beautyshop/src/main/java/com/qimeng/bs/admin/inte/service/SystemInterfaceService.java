package com.qimeng.bs.admin.inte.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qimeng.common.Page;
import com.qimeng.bs.admin.inte.bean.SystemInterface;
import com.qimeng.bs.admin.inte.dao.SystemInterfaceMapper;

@Service
@SuppressWarnings("unchecked")
public class SystemInterfaceService {
  
    @Autowired
    public SystemInterfaceMapper interfaceMapper;
     
    public Page searchAllByPage(Map params, int pageIndex, int pageSize) {
    	Page<SystemInterface> page = new Page<SystemInterface>(pageIndex, pageSize);
        page.setParams(params);
        List<SystemInterface> rows = interfaceMapper.searchAllByPage(page);
        page.setRows(rows);
        return page;
    }
    
	public int insertSystemInterface(SystemInterface record) {
		return interfaceMapper.insert(record);		
	}

	public int updateSystemInterface(SystemInterface record) {
		return interfaceMapper.updateByPrimaryKey(record);		
	}
	
	public int delteSystemInterface(SystemInterface record) {
		return interfaceMapper.deleteByPrimaryKey(record.getInterfaceId());
	}  
    
}
