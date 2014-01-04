package com.qimeng.bs.market.goods.dao;

import com.qimeng.bs.market.goods.bean.DmGoodsInst;
import com.qimeng.bs.market.goods.bean.DmShoppingCart;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DmShoppingCartMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_shopping_cart
     *
     * @mbggenerated Thu Dec 19 16:21:31 CST 2013
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_shopping_cart
     *
     * @mbggenerated Thu Dec 19 16:21:31 CST 2013
     */
    int insert(DmShoppingCart record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_shopping_cart
     *
     * @mbggenerated Thu Dec 19 16:21:31 CST 2013
     */
    int insertSelective(DmShoppingCart record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_shopping_cart
     *
     * @mbggenerated Thu Dec 19 16:21:31 CST 2013
     */
    DmShoppingCart selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_shopping_cart
     *
     * @mbggenerated Thu Dec 19 16:21:31 CST 2013
     */
    int updateByPrimaryKeySelective(DmShoppingCart record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_shopping_cart
     *
     * @mbggenerated Thu Dec 19 16:21:31 CST 2013
     */
    int updateByPrimaryKey(DmShoppingCart record);

    List<DmGoodsInst> selectGoodsInstInCart(int merchantId);


    void removeGoodsInCart(Integer goodsInstId);

    void batchRemoveGoodsInCart(List<Integer> instList);

    void removeGoodsInCartByMerchantId(int merchantId);
}