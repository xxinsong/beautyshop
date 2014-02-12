package com.qimeng.bs.market.consult.dao;

import com.qimeng.common.Page;
import com.qimeng.bs.market.consult.bean.DmConsultation;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface DmConsultationMapper {
    
    int deleteByPrimaryKey(Integer id);

    int insert(DmConsultation record);

    int insertSelective(DmConsultation record);

    DmConsultation selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DmConsultation record);

    int updateByPrimaryKey(DmConsultation record);
    
    List<DmConsultation> selectByGoodsIdAndMerchantId(@Param("goodsId") Integer goodsId, @Param("merchantId") Integer merchantId);

    List<DmConsultation> findAllConsultation(Page<DmConsultation> page);
}