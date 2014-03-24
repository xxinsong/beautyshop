package com.qimeng.bs.admin.msg.bean;

import org.directwebremoting.annotations.DataTransferObject;

@DataTransferObject
public class DmMsgReceiver {
    private Integer id;

    private Integer msgId;

    private Integer receiverId;

    private String state;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMsgId() {
        return msgId;
    }

    public void setMsgId(Integer msgId) {
        this.msgId = msgId;
    }

    public Integer getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(Integer receiverId) {
        this.receiverId = receiverId;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}