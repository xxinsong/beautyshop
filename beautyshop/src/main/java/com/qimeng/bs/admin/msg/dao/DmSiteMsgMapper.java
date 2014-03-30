package com.qimeng.bs.admin.msg.dao;

import java.util.List;

import com.qimeng.common.Page;
import com.qimeng.bs.admin.msg.bean.DmSiteMsg;
import org.springframework.stereotype.Repository;

@Repository
public interface DmSiteMsgMapper {
	
    int deleteByPrimaryKey(Integer msgId);

    int insert(DmSiteMsg record);

    int insertSelective(DmSiteMsg record);

    DmSiteMsg selectByPrimaryKey(Integer msgId);

    int updateByPrimaryKeySelective(DmSiteMsg record);

    int updateByPrimaryKey(DmSiteMsg record);
    
    List<DmSiteMsg> findAllSiteMessage(Page<DmSiteMsg> page);
}