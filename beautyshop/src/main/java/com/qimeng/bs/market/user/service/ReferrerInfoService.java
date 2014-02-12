package com.qimeng.bs.market.user.service;

import com.qimeng.bs.market.user.bean.ReferrerInfo;
import com.qimeng.bs.market.user.dao.ReferrerInfoMapper;
import com.qimeng.common.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    public Page<ReferrerInfo> queryMyReferrers(Map params, int pageIndex, int pageSize) {
        Page page = new Page(pageIndex, pageSize);
        page.setParams(params);
        List<ReferrerInfo> list = referrerInfoMapper.queryMyReferrers(page);
        page.setRows(list);
        return page;
    }
}
