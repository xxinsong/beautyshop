package com.qimeng.bs.market.user.service;

import com.qimeng.bs.market.user.bean.DmUser;
import com.qimeng.bs.market.user.bean.ReferrerInfo;
import com.qimeng.bs.market.user.dao.DmUserMapper;
import com.qimeng.bs.market.user.dao.ReferrerInfoMapper;
import com.qimeng.common.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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
    public Page<ReferrerInfo> queryMyReferrers(Map params, int pageIndex, int pageSize) {
        Page page = new Page(pageIndex, pageSize);
        page.setParams(params);
        List<ReferrerInfo> list = referrerInfoMapper.queryMyReferrers(page);
        page.setRows(list);
        return page;
    }

    public List<Integer> getUpReferrers(String userId) {
        List<Integer> allList = new ArrayList<Integer>();
        DmUser dmUser = dmUserMapper.selectByPrimaryKey(Integer.valueOf(userId));
        if(dmUser!=null){
            for (int i = 0; i < 5; i++) {
                ReferrerInfo referrerInfo = referrerInfoMapper.queryUpLevel(Integer.valueOf(userId));
                Integer referrerId = referrerInfo.getReferrerId();
                if (referrerId == null) {
                    break;
                }
                allList.add(referrerId);

            }
        }

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
}
