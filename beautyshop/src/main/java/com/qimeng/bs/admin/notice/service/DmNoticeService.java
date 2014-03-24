package com.qimeng.bs.admin.notice.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qimeng.common.Page;
import com.qimeng.bs.admin.notice.bean.DmNotice;
import com.qimeng.bs.admin.notice.dao.DmNoticeMapper;

@Service
@SuppressWarnings("unchecked")
public class DmNoticeService {
  
    @Autowired
    public DmNoticeMapper dmNoticeMapper;
    
    public List<DmNotice> selectNoticeList(Map params) {      
      return dmNoticeMapper.selectDmNoticeList(params);
    }
    
    public Page selectDmNoticeByPage(Map params, int pageIndex, int pageSize) {
    	Page<DmNotice> page = new Page<DmNotice>(pageIndex, pageSize);
        page.setParams(params);
        List<DmNotice> rows = dmNoticeMapper.selectDmNoticeByPage(page);
        page.setRows(rows);
        return page;
    }
    
    public int insertDmNotice(DmNotice notice) {
    	return dmNoticeMapper.insert(notice);
    }
    
    public int updateDmNotice(DmNotice notice) {
    	return dmNoticeMapper.updateByPrimaryKey(notice);
    }
    
    public int delteDmNotice(DmNotice notice) {
    	return dmNoticeMapper.deleteByPrimaryKey(notice.getNoticeId());
    }

	public List<DmNotice> queryTopNotice(int num) {
		Map params = new HashMap();
		params.put("num", num);
		params.put("state", "00A");
		return dmNoticeMapper.selectDmNoticeList(params);
	}

	public DmNotice queryNoticeById(int noticeId) {		
		return dmNoticeMapper.selectByPrimaryKey(noticeId);
	}
    
    
}
