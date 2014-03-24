package com.qimeng.bs.admin.msg.bean;

import java.util.Date;

import org.directwebremoting.annotations.DataTransferObject;

@DataTransferObject
public class DmSiteMsg {
	
    private Integer msgId;

    private String msgType;

    private String title;

    private String content;

    private Integer sendUser;

    private Date sendTime;

    private String receiverType;
    
    private Integer receiverId;
    private String receiverName;

    public Integer getReceiverId() {
      return receiverId;
    }

    public void setReceiverId(Integer receiverId) {
      this.receiverId = receiverId;
    }

    public String getReceiverName() {
      return receiverName;
    }

    public void setReceiverName(String receiverName) {
      this.receiverName = receiverName;
    }

    public Integer getMsgId() {
        return msgId;
    }

    public void setMsgId(Integer msgId) {
        this.msgId = msgId;
    }

    public String getMsgType() {
        return msgType;
    }

    public void setMsgType(String msgType) {
        this.msgType = msgType;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getSendUser() {
        return sendUser;
    }

    public void setSendUser(Integer sendUser) {
        this.sendUser = sendUser;
    }

    public Date getSendTime() {
        return sendTime;
    }

    public void setSendTime(Date sendTime) {
        this.sendTime = sendTime;
    }

    public String getReceiverType() {
        return receiverType;
    }

    public void setReceiverType(String receiverType) {
        this.receiverType = receiverType;
    }
}