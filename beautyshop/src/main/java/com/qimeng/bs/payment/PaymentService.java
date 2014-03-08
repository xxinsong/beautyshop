package com.qimeng.bs.payment;

import com.qimeng.bs.market.order.bean.DmTradeLog;
import com.qimeng.bs.market.order.service.DmCustOrderService;
import com.qimeng.bs.market.order.service.DmTradeLogService;
import com.qimeng.bs.market.point.bean.DmPoints;
import com.qimeng.bs.market.point.bean.DmPointsDetail;
import com.qimeng.bs.market.point.service.DmPointService;
import com.qimeng.bs.market.user.service.ReferrerInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * User: Simon
 * Date: 14-3-5
 */
@Service
public class PaymentService {
    @Autowired
    private DmCustOrderService dmCustOrderService;
    @Autowired
    private DmTradeLogService dmTradeLogService;
    @Autowired
    private DmPointService dmPointService;
    @Autowired
    private ReferrerInfoService referrerInfoService;

    public boolean responseAccepted(String orderNo) {
        List<DmTradeLog> logList = dmTradeLogService.getTradeLogByOrderNo(orderNo);
        return logList!=null && !logList.isEmpty();
    }

    @Transactional
    public void paymentOK(String userId,String orderNo, DmTradeLog log) {
        dmCustOrderService.updateOrderStateByOrderNo(orderNo, "10B");

        List<Integer> upReferrers = referrerInfoService.getUpReferrers(userId);
        for (Integer referrer : upReferrers) {
            DmPoints dmPoints = new DmPoints();
            DmPointsDetail dmPointsDetail = new DmPointsDetail();
            dmPointsDetail.setOrderNo(orderNo);
            dmPointsDetail.setMerchantId(referrer);
            dmPointsDetail.setPoint(1);
            dmPointsDetail.setGainTime(new Date());
            dmPointsDetail.setState("00A");

            dmPointService.insertPoint(dmPoints);
            dmPointService.increaseTotalPoint(referrer);
        }
        dmTradeLogService.insertTradeLog(log);
    }

    @Transactional
    public void paymentFail(DmTradeLog log){
        dmTradeLogService.insertTradeLog(log);
    }
}