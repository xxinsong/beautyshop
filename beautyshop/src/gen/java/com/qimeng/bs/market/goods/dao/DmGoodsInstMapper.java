package com.qimeng.bs.market.goods.dao;

import com.qimeng.bs.market.goods.bean.DmGoodsInst;

public interface DmGoodsInstMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_goods_inst
     *
     * @mbggenerated Sun Jan 05 18:38:04 CST 2014
     */
    int deleteByPrimaryKey(Integer instId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_goods_inst
     *
     * @mbggenerated Sun Jan 05 18:38:04 CST 2014
     */
    int insert(DmGoodsInst record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_goods_inst
     *
     * @mbggenerated Sun Jan 05 18:38:04 CST 2014
     */
    int insertSelective(DmGoodsInst record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_goods_inst
     *
     * @mbggenerated Sun Jan 05 18:38:04 CST 2014
     */
    DmGoodsInst selectByPrimaryKey(Integer instId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_goods_inst
     *
     * @mbggenerated Sun Jan 05 18:38:04 CST 2014
     */
    int updateByPrimaryKeySelective(DmGoodsInst record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_goods_inst
     *
     * @mbggenerated Sun Jan 05 18:38:04 CST 2014
     */
    int updateByPrimaryKey(DmGoodsInst record);
}