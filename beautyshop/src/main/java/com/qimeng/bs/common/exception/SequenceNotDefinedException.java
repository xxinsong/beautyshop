package com.qimeng.bs.common.exception;

/**
 * User: Simon
 * Date: 13-12-4
 */
public class SequenceNotDefinedException extends RuntimeException {
    private static final String message = "表主键序列未定义，请在SYS_SEQUENCE表中建立对应的定义！";

    public SequenceNotDefinedException(){

    }

    public SequenceNotDefinedException(String tableName) {
        super(tableName+message);
    }
}
