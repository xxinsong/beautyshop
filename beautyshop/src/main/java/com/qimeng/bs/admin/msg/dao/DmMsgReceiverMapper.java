package com.qimeng.bs.admin.msg.dao;

import java.util.Map;

import com.qimeng.bs.admin.msg.bean.DmMsgReceiver;

public interface DmMsgReceiverMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(DmMsgReceiver record);

    int insertSelective(DmMsgReceiver record);

    DmMsgReceiver selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DmMsgReceiver record);

    int updateByPrimaryKey(DmMsgReceiver record);
    
    @SuppressWarnings("rawtypes")
	int delMsgReceiverById(Map param);
}