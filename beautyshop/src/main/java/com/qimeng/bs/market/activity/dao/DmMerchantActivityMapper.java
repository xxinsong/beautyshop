package com.qimeng.bs.market.activity.dao;

import com.qimeng.common.Page;
import com.qimeng.bs.market.activity.bean.DmMerchantActivity;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DmMerchantActivityMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_merchant_activity
     *
     * @mbggenerated Tue Dec 03 10:32:45 CST 2013
     */
    int deleteByPrimaryKey(Integer actId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_merchant_activity
     *
     * @mbggenerated Tue Dec 03 10:32:45 CST 2013
     */
    int insert(DmMerchantActivity record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_merchant_activity
     *
     * @mbggenerated Tue Dec 03 10:32:45 CST 2013
     */
    int insertSelective(DmMerchantActivity record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_merchant_activity
     *
     * @mbggenerated Tue Dec 03 10:32:45 CST 2013
     */
    DmMerchantActivity selectByPrimaryKey(Integer actId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_merchant_activity
     *
     * @mbggenerated Tue Dec 03 10:32:45 CST 2013
     */
    int updateByPrimaryKeySelective(DmMerchantActivity record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_merchant_activity
     *
     * @mbggenerated Tue Dec 03 10:32:45 CST 2013
     */
    int updateByPrimaryKey(DmMerchantActivity record);

    List<DmMerchantActivity> selectMerchantActivityList(Page page);
}