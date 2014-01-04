package com.qimeng.bs.system.sequence.dao;

import org.springframework.stereotype.Repository;

@Repository
public interface SysSequenceMapper {

    int nextVal(String tableName);

    int currVal(String tableName);

    int selectLastInsertId();
}