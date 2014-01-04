package com.qimeng.bs.common.exception;

/**
 * User: Simon
 * Date: 13-11-26
 * 用户登录异常
 */
public class LoginException extends RuntimeException {
    private static final String message = "";
    public LoginException(){
        super(message);
    }

    public LoginException(String message){
        super(message);
    }
}
