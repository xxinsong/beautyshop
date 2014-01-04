package com.qimeng.bs.market.goods.service;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qimeng.common.tools.PKUtils;
import com.qimeng.bs.market.goods.bean.DmBizCircle;
import com.qimeng.bs.market.goods.dao.DmBizCircleMapper;

@Service
@SuppressWarnings("unchecked")
public class DmBizCircleService {
	
	@Autowired
	private DmBizCircleMapper dmBizCircleMapper;
 
	/**
	 * 插入商圈类型
	 */
	 @Transactional
	public DmBizCircle insertDmBizCircle(Map param){
		DmBizCircle record = new DmBizCircle();
		record.setStatus("00N");
		dmBizCircleMapper.insert(record);
		record.setCircleId(PKUtils.lastInsertId());
		return record;
	}
 
	
	
	
	
}
