package com.qimeng.bs.market.order.service;

import com.qimeng.bs.market.order.bean.DmTradeLog;
import com.qimeng.bs.market.order.dao.DmTradeLogMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


/**
 * User: yuanyh
 * Date: 13-12-9
 */
@Service
public class DmTradeLogService {

    @Autowired
    private DmTradeLogMapper dmTradeLogMapper;
    
    @Transactional
    public void insertTradeLog(DmTradeLog dmTradeLog) {
    	dmTradeLogMapper.insert(dmTradeLog);

    }

    public List<DmTradeLog> getTradeLogByOrderNo(String orderNo) {
        return dmTradeLogMapper.getTradeLogByOrderNo(orderNo);
    }
}
