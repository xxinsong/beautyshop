package com.qimeng.bs.market.goods;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.qimeng.bs.admin.goods.bean.DmGoodsPlan;

import com.qimeng.bs.market.goods.bean.DmGoodsInst;

public class ShoppingCart {

//    购物车商品清单
    private List<DmGoodsInst> dmGoodsInstList = new ArrayList<DmGoodsInst>();
//  购物车中将购买的商品清单（将要生成订单的商品列表）
    private List<DmGoodsInst> buyingGoodsInst = new ArrayList<DmGoodsInst>();


    /**
     * 获取购物车中所有商品列表
     * @return
     */
    public List<DmGoodsInst> getAllGoodsInCart() {
        return dmGoodsInstList;
    }

    /**
     * 将商品放入购物车
     * @param dmGoodsInst
     */
    public void putGoodsInCart(DmGoodsInst dmGoodsInst) {
        this.dmGoodsInstList.add(dmGoodsInst);
    }


    /**
     * 获取生成购物车中订单的商品列表
     * @return
     */
    public List<DmGoodsInst> getBuyingGoods() {
        return buyingGoodsInst;
    }

    /**
     * 添加商品到订单的清单中
     * @param dmGoodsInst
     */
    public void addBuyingGoods(DmGoodsInst dmGoodsInst){
        this.buyingGoodsInst.add(dmGoodsInst);
    }


    /**
     * 批量将商品放入购物车
     * @param dmGoodsInstList
     */
    public void putGoodsInCart(List<DmGoodsInst> dmGoodsInstList) {
        this.dmGoodsInstList.addAll(dmGoodsInstList);
    }

    /**
     * 订单清单中的商品总额
     * @return
     */
    public Float getBuyingAmount() {
        BigDecimal buyingAmount = new BigDecimal(0.0);
        DmGoodsPlan plan = null;
        for (DmGoodsInst inst : buyingGoodsInst) {
            plan = inst.getDmGoodsPlan();
            BigDecimal price = new BigDecimal(plan.getPlanPrice().toString());
            buyingAmount = buyingAmount.add(price);
        }
        return buyingAmount.floatValue();
    }


    /**
     * 将商品移出购物车
     * @param instList
     */
    public void removeGoods(List<DmGoodsInst> instList) {
        dmGoodsInstList.removeAll(instList);
    }
    /**
     * 将商品移出购物车
     * @param goodsInst
     */
    public void removeGoods(DmGoodsInst goodsInst) {
        dmGoodsInstList.remove(goodsInst);
    }

    public void removeGoods(Integer[] instIds) {
        Iterator<DmGoodsInst> it = dmGoodsInstList.iterator();
        for (int instId : instIds) {
            while(it.hasNext()){
                DmGoodsInst inst = it.next();
                if(inst.getInstId().intValue() == instId){
                    it.remove();
                    break;
                }
            }
        }
    }

    public void removeAllGoods() {
        dmGoodsInstList.clear();
    }

    public void putGoodsInCart(Integer goodsId) {


    }
}