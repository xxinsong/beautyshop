package com.qimeng.bs.common.exception;

/**
 * User: Simon
 * Date: 13-11-29
 * 系统配置参数错误相关异常
 */
public class SystemConfigException extends RuntimeException{
    private static final String defaultMessage = "系统配置参数错误！";
    public SystemConfigException(){
        super(defaultMessage);
    }

    public SystemConfigException(String message){
        super(defaultMessage+"\n"+message);
    }
}
