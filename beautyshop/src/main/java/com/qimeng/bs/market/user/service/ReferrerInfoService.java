package com.qimeng.bs.market.user.service;

import com.qimeng.bs.market.order.dao.DmCustOrderMapper;
import com.qimeng.bs.market.user.bean.DmUser;
import com.qimeng.bs.market.user.bean.ReferrerInfo;
import com.qimeng.bs.market.user.dao.DmUserMapper;
import com.qimeng.bs.market.user.dao.ReferrerInfoMapper;
import com.qimeng.common.Page;
import org.apache.commons.collections.MapUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * User: Simon
 * Date: 14-1-25
 */
@Service
public class ReferrerInfoService {
    @Autowired
    private ReferrerInfoMapper referrerInfoMapper;
    @Autowired
    private DmUserMapper dmUserMapper;
    @Autowired
    private DmCustOrderMapper dmCustOrderMapper;

    public Page<ReferrerInfo> queryMyReferrers(Map params, int pageIndex, int pageSize) {
        Page page = new Page(pageIndex, pageSize);
        page.setParams(params);
        List<ReferrerInfo> list = referrerInfoMapper.queryMyReferrers(page);
        page.setRows(list);
        return page;
    }

    public List<Integer> getUp5LevelsReferrers(Integer userId) {
        List<Integer> allList = new ArrayList<Integer>();
//        DmUser dmUser = dmUserMapper.selectByPrimaryKey(Integer.valueOf(userId));
        ReferrerInfo up1 = referrerInfoMapper.queryUpLevel(userId);
        ReferrerInfo up2 = null;
        ReferrerInfo up3 = null;
        ReferrerInfo up4 = null;
        ReferrerInfo up5 = null;
        if(up1!=null) {
            allList.add(up1.getReferrerId());
            up2 = referrerInfoMapper.queryUpLevel(up1.getReferrerId());
        }
        if(up2!=null) {
            allList.add(up2.getReferrerId());
            up3 = referrerInfoMapper.queryUpLevel(up2.getReferrerId());
        }
        if(up3!=null) {
            allList.add(up3.getReferrerId());
            up4 = referrerInfoMapper.queryUpLevel(up3.getReferrerId());
        }
        if(up4!=null) {
            allList.add(up4.getReferrerId());
            up5 = referrerInfoMapper.queryUpLevel(up4.getReferrerId());
        }
        if(up5!=null) {
            allList.add(up5.getReferrerId());
        }
        /*if(dmUser!=null){
            for (int i = 0; i < 5; i++) {
                Integer referrerId = referrerInfo.getReferrerId();
                if (referrerId == null) {
                    break;
                }
                allList.add(referrerId);

            }
        }*/

        return allList;
    }

    public int getTotalReferrers(Integer referrerId) {
        int total = 0;
        List<Integer> ids = new ArrayList<Integer>();
        ids.add(referrerId);
        List<Integer> level1 = getNextLevel(ids);
        List<Integer> level2 = getNextLevel(level1);
        List<Integer> level3 = getNextLevel(level2);
        List<Integer> level4 = getNextLevel(level3);
        List<Integer> level5 = getNextLevel(level4);

        total = level1.size()+level2.size()+level3.size()+level4.size()+level5.size();
        return total;
    }

    private List<Integer> getNextLevel(List<Integer> referrerIds) {
        List<Integer> allList = new ArrayList<Integer>();
        for (Integer referrerId : referrerIds) {
            List<ReferrerInfo> list = referrerInfoMapper.getNextLevel(referrerId);
            for(ReferrerInfo info:list) {
                allList.add(info.getPresenteeId());
            }
        }

        return allList;
    }

    public Map modifyReferrer(Map params) {
        Map result = new HashMap();
        Integer userId = MapUtils.getInteger(params, "userId");
        String referrerNo = MapUtils.getString(params, "referrerNo");

        DmUser user = dmUserMapper.selectByLogonName(referrerNo);
        if (user == null) {
            result.put("success", false);
            result.put("reason", "推荐人号码不存在！");
            return result;
        }else if(user.getUserId()!=-1){
            int count = dmCustOrderMapper.countDealOrderByUserId(user.getUserId());
            if (count <= 0) {
                result.put("success",false);
                result.put("reason", "推荐人没有支付过订单，不符合推荐人资格！");
                return result;
            }
        }

        Map param = new HashMap();
        param.put("presenteeId", userId);
        param.put("referrerId", user.getUserId());
        referrerInfoMapper.updateReferrerByPresenteeId(param);
        result.put("success", true);

        return result;

    }
}
