package com.qimeng.bs.market.goods;

import java.math.BigDecimal;
import java.util.*;

import com.qimeng.bs.admin.goods.bean.DmGoods;
import com.qimeng.bs.market.goods.bean.DmShoppingCartItem;
import org.springframework.stereotype.Component;

@Component
public class ShoppingCart {

    //  购物车商品清单
    private List<DmShoppingCartItem> items = new ArrayList<DmShoppingCartItem>();
    //  购物车中将购买的商品清单（将要生成订单的商品列表）
    private List<DmShoppingCartItem> buying = new ArrayList<DmShoppingCartItem>();
    private float freight = 10.0f;


    /**
     * 获取购物车中所有商品列表
     * @return
     */
    public List<DmShoppingCartItem> getAllGoodsInCart() {
        return items;
    }


    /**
     * 获取生成购物车中订单的商品列表
     * @return
     */
    public List<DmShoppingCartItem> getBuying() {
        return buying;
    }

    /**
     * 添加商品到订单的清单中
     * @param goodsId
     */
    public void addBuyingGoods(int goodsId){
        for(DmShoppingCartItem item:items){
            if(item.getGoodsId().intValue()==goodsId){
                buying.add(item);
            }
        }
    }

    /**
     * 购物车中的商品总额
     * @return
     */
    public Float getTotalAmount() {
        BigDecimal amount = new BigDecimal(0.0);
        for (DmShoppingCartItem item:items) {
            float itemAmount = item.getAmount();
            BigDecimal price = new BigDecimal(String.valueOf(itemAmount));
            amount = amount.add(price);
            /*if(item.getItemNo()>1){
                freight = 0.0f;
            }*/
        }
        /*if(items.size()>1){
            freight = 0.0f;
        }*/
//        amount = amount.add(new BigDecimal(freight));
        return amount.floatValue();
    }

    /**
     * 购物车中的商品总数
     * @return
     */
    public int getTotalCount() {
        int count = 0;
        for (DmShoppingCartItem item:items) {
            count = count + item.getItemNo();
        }
        return count;
    }

    /**
     * 订单清单中的商品总额
     * @return
     */
    public Float getBuyingAmount() {
        BigDecimal buyingAmount = new BigDecimal(0.0);
        for (DmShoppingCartItem item:buying) {
            float itemAmount = item.getAmount();
            BigDecimal price = new BigDecimal(String.valueOf(itemAmount));
            buyingAmount = buyingAmount.add(price);

        }
        return buyingAmount.floatValue();
    }
    /**
     * 订单总额=商品金额+运费
     * @return
     */
    public float getPayAmount() {
        Float buyingAmount = getBuyingAmount();
        float payAmount = new BigDecimal(buyingAmount).add(new BigDecimal(freight)).floatValue();
        return payAmount;
    }

    /**
     * 订单清单中的商品总数
     * @return
     */
    public int getBuyingCount() {
        int count = 0;
        for (DmShoppingCartItem item:buying) {
            int itemNo = item.getItemNo();
            count = count + itemNo;
        }

        return count;
    }

    /**
     * 批量将商品放入购物车，从数据库加载
     * @param items
     */
    public void putGoodsInCart(List<DmShoppingCartItem> items) {
        for(DmShoppingCartItem item:items){
            boolean exist = false;
            for(DmShoppingCartItem sessionItem:this.items){
                if(item.isSameGoods(sessionItem)){
                    sessionItem.setId(item.getId());
                    sessionItem.setMerchantId(item.getMerchantId());
                    sessionItem.increase(item.getItemNo());
                    exist = true;
                    break;
                }
            }
            if(!exist) {
                this.items.add(item);
            }
        }
    }

    /**
     * 将商品放入购物车
     * @param goodsId
     */
    /*public void putGoodsInCart(Integer goodsId) {
        putGoodsInCart(goodsId,1);
    }

    *//**
     * 将商品放入购物车
     * @param goodsId
     *//*
    public void putGoodsInCart(Integer goodsId,int num) {
        boolean exist = false;
        for(DmShoppingCartItem item:items){
            if(item.getGoodsId().intValue()==goodsId.intValue()){
                item.increase(num);
                exist = true;
                break;
            }
        }
        if(!exist){
            DmShoppingCartItem item = new DmShoppingCartItem(goodsId,num);
            items.add(item);
        }
    }*/

    /**
     * 将商品放入购物车
     * @param goods
     */
    public DmShoppingCartItem putGoodsInCart(DmGoods goods) {
        return putGoodsInCart(goods,1);
    }

    /**
     * 将商品放入购物车
     * @param goods
     */
    public DmShoppingCartItem putGoodsInCart(DmGoods goods,int num) {
        int goodsId = goods.getGoodsId();
//        boolean exist = false;
        for(DmShoppingCartItem item:items){
            if(item.getGoodsId().intValue()==goodsId){
                item.increase(num);
                return item;
//                exist = true;
//                break;
            }
        }
//        if(!exist){
        DmShoppingCartItem item = new DmShoppingCartItem(goodsId,num);
        item.setGoodsNo(goods.getGoodsNo());
        item.setGoodsName(goods.getGoodsName());
        item.setGoodsImage(goods.getSmallImageUri());
        item.setPrice(goods.getPrice());
        items.add(item);
//        }
        return item;
    }

    public DmShoppingCartItem saveGoodsInCart(DmGoods goods,int num) {
        int goodsId = goods.getGoodsId();
        for(DmShoppingCartItem item:items){
            if(item.getGoodsId().intValue()==goodsId){
                item.setItemNo(num);
                return item;
            }
        }
        DmShoppingCartItem item = new DmShoppingCartItem(goodsId,num);
        item.setGoodsNo(goods.getGoodsNo());
        item.setGoodsName(goods.getGoodsName());
        item.setGoodsImage(goods.getSmallImageUri());
        item.setPrice(goods.getPrice());
        items.add(item);
        return item;
    }

    /**
     * 批量将商品移出购物车
     * @param goodsIds
     */
    public void removeGoods(Integer[] goodsIds) {
        for(int goodsId:goodsIds){
            removeGoods(goodsId);
        }
    }
    /**
     * 将商品移出购物车
     * @param goodsId
     */
    public void removeGoods(Integer goodsId) {
        for(Iterator<DmShoppingCartItem> it=items.iterator();it.hasNext();){
            DmShoppingCartItem item = it.next();
            if(item.getGoodsId().intValue()==goodsId.intValue()){
                it.remove();
                break;
            }
        }
    }
    /**
     * 将商品移出购物车
     * @param items
     */
    public void removeGoods(List<DmShoppingCartItem> items) {
        for(DmShoppingCartItem item : items){
            removeGoods(item);
        }
    }
    /**
     * 将商品移出购物车
     * @param goodsItem
     */
    public void removeGoods(DmShoppingCartItem goodsItem) {
        for(Iterator<DmShoppingCartItem> it=items.iterator();it.hasNext();){
            DmShoppingCartItem item = it.next();
            if(item.isSameGoods(goodsItem)){
                it.remove();
                break;
            }
        }
    }
    /**
     * 设置购物车中商品数量
     * @param goodsId
     * @param num
     */
    public DmShoppingCartItem setGoodsItemNo(Integer goodsId,int num){
        for(DmShoppingCartItem item:items){
            if(item.getGoodsId().intValue()==goodsId.intValue()){
                item.setItemNo(num);
                return item;
            }
        }
        return null;
    }

    /**
     * 清空购物车
     */
    public void removeAllGoods() {
        items.clear();
    }


    public float getFreight() {
        int count = getBuyingCount();
        if(count>1){
            freight = 0.0f;
        }else{
            freight = 10.0f;
        }
        return freight;
    }
}