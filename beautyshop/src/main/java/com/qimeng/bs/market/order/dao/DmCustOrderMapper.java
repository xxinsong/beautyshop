package com.qimeng.bs.market.order.dao;

import com.qimeng.common.Page;
import com.qimeng.bs.market.order.bean.DmCustOrder;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface DmCustOrderMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_cust_order
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    int deleteByPrimaryKey(Integer orderId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_cust_order
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    int insert(DmCustOrder record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_cust_order
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    int insertSelective(DmCustOrder record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_cust_order
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    DmCustOrder selectByPrimaryKey(Integer orderId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_cust_order
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    int updateByPrimaryKeySelective(DmCustOrder record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_cust_order
     *
     * @mbggenerated Mon Dec 09 09:41:23 CST 2013
     */
    int updateByPrimaryKey(DmCustOrder record);

    List<DmCustOrder> selectOrderByPage(Page page);

    DmCustOrder selectCustOrderByMerchantId(Map params);
}