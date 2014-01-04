package com.qimeng.bs.admin.merchant.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qimeng.common.Page;
import com.qimeng.bs.admin.merchant.bean.DmMerchantFile;
import com.qimeng.bs.admin.merchant.dao.DmMerchantFileMapper;

@Service
@SuppressWarnings("unchecked")
public class DmMerchantFileService {
	
	@Autowired
	public DmMerchantFileMapper dmMerchantFileMapper ;
	
	public Page<DmMerchantFile> queryPage(Map params,int pageIndex, int pageSize){
		Page<DmMerchantFile> page = new Page<DmMerchantFile>(pageIndex,pageSize);
		page.setParams(params);
		List<DmMerchantFile> rows = dmMerchantFileMapper.findAllMerchantFile(page);
		page.setRows(rows);
		return page;
	}
	
	public DmMerchantFile selectByPrimaryKey(String id){
		return dmMerchantFileMapper.selectByPrimaryKey(Integer.valueOf(id));
	}
	
	public int deleteByPrimaryKey(String id){
		return dmMerchantFileMapper.deleteByPrimaryKey(Integer.valueOf(id));
	}
	
	public int insert(DmMerchantFile dmMerchantFile){
		return dmMerchantFileMapper.insert(dmMerchantFile);
	}
	
	int updateByPrimaryKey(DmMerchantFile dmMerchantFile) {
		return dmMerchantFileMapper.updateByPrimaryKey(dmMerchantFile);
	}
	
}
