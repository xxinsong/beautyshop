package com.qimeng.bs.market.goods.service;


import java.util.Arrays;
import java.util.Date;
import java.util.List;

import com.qimeng.bs.market.goods.bean.DmGoodsInst;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qimeng.bs.market.goods.bean.DmShoppingCart;
import com.qimeng.bs.market.goods.dao.DmShoppingCartMapper;
import com.qimeng.bs.market.order.bean.DmSubCustOrder;
import com.qimeng.bs.market.order.dao.DmSubCustOrderMapper;

@Service
@SuppressWarnings("unchecked")
public class DmShoppingCartService {
	
	@Autowired
	private DmSubCustOrderMapper dmSubCustOrderMapper;
	@Autowired
	private DmShoppingCartMapper dmShoppingCartMapper;
 
	/**
	 * 插入客户子订单
	 */
	public DmShoppingCart insertShoppingCart(){
		DmShoppingCart record = new DmShoppingCart();
		record.setCteateTime(new Date());
		dmShoppingCartMapper.insert(record);
		return record;
	}
	
	/**
	 * 插入客户子订单
	 */
	public void insertCustSubOrder(){
		DmSubCustOrder record = new DmSubCustOrder();
		dmSubCustOrderMapper.insert(record);
		
	}

    public List<DmGoodsInst> selectGoodsInstInCart(int merchantId){
        List<DmGoodsInst> dmGoodsInsts = dmShoppingCartMapper.selectGoodsInstInCart(merchantId);
        return dmGoodsInsts;
    }

    /*public Page selectGoodsInstInCart(Map params, int pageIndex, int pageSize) {
        Page page = new Page(pageIndex,pageSize);
        page.setParams(params);
        List<DmGoodsInst> dmGoodsInsts = dmShoppingCartMapper.selectGoodsInstInCart(page);
        page.setRows(dmGoodsInsts);
        return page;
    }*/

    public void removeGoodsInCart(DmGoodsInst goodsInst) {
        dmShoppingCartMapper.removeGoodsInCart(goodsInst.getInstId());
    }

    public void batchRemoveGoodsInCart(List<Integer> instList) {
        dmShoppingCartMapper.batchRemoveGoodsInCart(instList);
    }

    public void removeGoodsInCart(Integer[] instIds) {
        dmShoppingCartMapper.batchRemoveGoodsInCart(Arrays.asList(instIds));
    }

    public void removeAllGoods(int merchantId) {
        dmShoppingCartMapper.removeGoodsInCartByMerchantId(merchantId);
    }

    public void saveShoppingCart(List<DmGoodsInst> goodsInstList) {
        for(DmGoodsInst inst: goodsInstList){
            DmShoppingCart cart = new DmShoppingCart();
            cart.setMerchantId(inst.getMerchantId());
            cart.setGoodsInstId(inst.getInstId());
            cart.setGoodsItemNo(1);
            cart.setCteateTime(new Date());
            cart.setState("00A");
            dmShoppingCartMapper.insert(cart);
        }

    }
}
