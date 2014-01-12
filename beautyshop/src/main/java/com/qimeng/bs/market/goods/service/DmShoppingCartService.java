package com.qimeng.bs.market.goods.service;


import java.util.Arrays;
import java.util.Date;
import java.util.List;

import com.qimeng.bs.login.bean.LoginInfo;
import com.qimeng.bs.market.goods.bean.DmGoodsInst;
import com.qimeng.bs.market.goods.bean.DmShoppingCartItem;
import com.qimeng.common.tools.PKUtils;
import com.qimeng.common.web.ApplicationContextUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public DmShoppingCartItem insertShoppingCart(){
		DmShoppingCartItem record = new DmShoppingCartItem();
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

    public List<DmShoppingCartItem> selectShoppingCartItemsByMerchantId(int merchantId){
        List<DmShoppingCartItem> items = dmShoppingCartMapper.selectShoppingCartItemsByMerchantId(merchantId);
        return items;
    }

    /*public List<DmGoodsInst> selectGoodsInstInCart(int merchantId){
        List<DmGoodsInst> dmGoodsInsts = dmShoppingCartMapper.selectGoodsInstInCart(merchantId);
        return dmGoodsInsts;
    }*/

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

    public void saveShoppingCart(List<DmShoppingCartItem> items) {
//        LoginInfo currUser = ApplicationContextUtil.getCurrentLoginUser();
        for(DmShoppingCartItem item: items){
            /*if(item.getId()==null){
                item.setMerchantId(currUser.getMerchantId());
                dmShoppingCartMapper.insert(item);
                Integer id = PKUtils.lastInsertId();
                item.setId(id);
            }else{
                dmShoppingCartMapper.updateByPrimaryKey(item);
            }*/
            saveShoppingCart(item);
        }

    }

    public void saveShoppingCart(DmShoppingCartItem item) {
        LoginInfo currUser = ApplicationContextUtil.getCurrentLoginUser();
        if(item.getId()==null){
            item.setMerchantId(currUser.getMerchantId());
            dmShoppingCartMapper.insert(item);
            Integer id = PKUtils.lastInsertId();
            item.setId(id);
        }else{
            dmShoppingCartMapper.updateByPrimaryKey(item);
        }

    }
}
