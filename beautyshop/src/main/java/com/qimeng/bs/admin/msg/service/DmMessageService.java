package com.qimeng.bs.admin.msg.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qimeng.common.Page;
import com.qimeng.bs.admin.msg.bean.DmSiteMsg;
import com.qimeng.bs.admin.msg.dao.DmMsgReceiverMapper;
import com.qimeng.bs.admin.msg.dao.DmSiteMsgMapper;

@Service
public class DmMessageService {

	@Autowired
	private DmSiteMsgMapper dmSiteMsgMapper;
	
	@Autowired
	private DmMsgReceiverMapper dmMsgReceiverMapper;
    
    public Page<DmSiteMsg> queryPage(Page<DmSiteMsg> page){
      List<DmSiteMsg> rows = dmSiteMsgMapper.findAllSiteMessage(page);
      page.setRows(rows);
      return page;
    }
    
    
    @Transactional
    public int save(DmSiteMsg siteMsg){
      int rows = dmSiteMsgMapper.insert(siteMsg);
      return rows;
    }
    
    
    @Transactional
    public DmSiteMsg getGoodsById(DmSiteMsg siteMsg){
      DmSiteMsg dmGoods= dmSiteMsgMapper.selectByPrimaryKey( siteMsg.getMsgId());
      return dmGoods ;
    }
    
    @Transactional
    public int update(DmSiteMsg siteMsg){
      return dmSiteMsgMapper.updateByPrimaryKeySelective(siteMsg);
    }
    
    @Transactional
    public int delete(DmSiteMsg siteMsg){
       Integer msgId = siteMsg.getMsgId();
       int result = dmSiteMsgMapper.deleteByPrimaryKey(msgId);
       return result;
    }
    
    @SuppressWarnings("rawtypes")
	@Transactional
    public int delMsgReceiverById(Map param){
    	Integer msgId=Integer.valueOf((String) param.get("msgId"));
    	dmSiteMsgMapper.deleteByPrimaryKey(msgId);
    	return dmMsgReceiverMapper.delMsgReceiverById(param);
    }
}
