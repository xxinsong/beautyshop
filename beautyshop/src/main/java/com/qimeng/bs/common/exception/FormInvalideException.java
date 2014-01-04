package com.qimeng.bs.common.exception;

/**
 * User: Simon
 * Date: 13-12-13
 * 表单校验异常
 */
public class FormInvalideException extends RuntimeException {
    private static final String message = "";
    public FormInvalideException(){
        super(message);
    }

    public FormInvalideException(String errMsg){
        super(message+errMsg);
    }
}