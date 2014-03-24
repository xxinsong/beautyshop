package com.qimeng.bs.admin.notice.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.qimeng.common.Page;
import com.qimeng.bs.admin.notice.bean.DmNotice;
import com.qimeng.bs.admin.notice.service.DmNoticeService;
import com.qimeng.bs.common.controller.GenericController;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RemoteProxy
@SuppressWarnings("unchecked")
public class DmNoticeController extends GenericController{

	@Autowired
	private DmNoticeService dmNoticeService;
	
	@RemoteMethod
	public Page queryDmNoticeByPage(Map params, int pageIndex, int pageSize) { 
		return dmNoticeService.selectDmNoticeByPage(params, pageIndex, pageSize);
	}
	
	@RemoteMethod
	public List<DmNotice> queryTopNotice(int num){
		List<DmNotice> list= dmNoticeService.queryTopNotice(num);
		return list;
	}
	
	@RemoteMethod
	public DmNotice queryNoticeById(int noticeId){
		DmNotice notice = dmNoticeService.queryNoticeById(noticeId);
		return notice;
	}
	
    @RemoteMethod
    public Map<String, Object> addAction(DmNotice notice) {
        Map<String, Object> ret = new HashMap<String, Object>();
        ret.put("success", true);
        ret.put("msg", "添加成功");
        notice.setCreateDate(new Date());
        if ("00A".equals(notice.getState())) {//发布时间
        	notice.setPublishTime(new Date());
        }
        dmNoticeService.insertDmNotice(notice);
        return ret;
    }

    @RemoteMethod
    public Map<String, Object> updateAction(DmNotice notice) {
        Map<String, Object> ret = new HashMap<String, Object>();
        ret.put("success", true);
        ret.put("msg", "更新成功");
        if ("00A".equals(notice.getState())) {//发布时间
        	notice.setPublishTime(new Date());
        }
        dmNoticeService.updateDmNotice(notice);
        return ret;
    }

    @RemoteMethod
    public Map<String, Object> deleteAction(DmNotice notice) {
        Map<String, Object> ret = new HashMap<String, Object>();
        ret.put("success", true);
        ret.put("msg", "删除成功");
        dmNoticeService.delteDmNotice(notice);
        return ret;
    }

    @RequestMapping("/notice")
    public String listNotice(HttpServletRequest request){
        return "/market/notice/dmnotice.jsp";
    }
}
