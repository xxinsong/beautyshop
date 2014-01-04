package com.qimeng.bs.market.goods.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.qimeng.bs.login.bean.LoginInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qimeng.common.tools.PKUtils;
import com.qimeng.common.web.ApplicationContextUtil;
import com.qimeng.bs.admin.goods.bean.DmGoods;
import com.qimeng.bs.admin.goods.bean.DmGoodsPlan;
import com.qimeng.bs.admin.goods.dao.DmGoodsMapper;
import com.qimeng.bs.admin.goods.dao.DmGoodsPlanMapper;
import com.qimeng.bs.market.goods.ShoppingCart;
import com.qimeng.bs.market.goods.bean.DmBizCircle;
import com.qimeng.bs.market.goods.bean.DmGoodsInst;
import com.qimeng.bs.market.goods.bean.DmGoodsInstTagItem;
import com.qimeng.bs.market.goods.bean.DmShoppingCart;
import com.qimeng.bs.market.goods.dao.DmBizCircleMapper;
import com.qimeng.bs.market.goods.dao.DmGoodsInstMapper;
import com.qimeng.bs.market.goods.dao.DmGoodsInstTagItemMapper;
import com.qimeng.bs.market.goods.dao.DmShoppingCartMapper;

/**
 * User: Simon
 * Date: 13-12-11
 */
@Service
public class DmGoodsInstService {

    @Autowired
    private DmGoodsInstMapper dmGoodsInstMapper;
    @Autowired
    private DmGoodsMapper dmGoodsMapper;
    @Autowired
    private DmGoodsInstTagItemMapper dmGoodsInstTagItemMapper;
    @Autowired
    private DmGoodsPlanMapper dmGoodsPlanMapper;
    @Autowired
    private DmShoppingCartMapper dmShoppingCartMapper;
    @Autowired
    private DmShoppingCartService dmShoppingCartService;
	@Autowired
	private DmBizCircleMapper dmBizCircleMapper;
    

    public List<DmGoodsInst> queryAvailableGoodsInst(int merchantId, Integer checkedInstId) {
        Map params = new HashMap();
        params.put("merchantId", merchantId);
        params.put("checkedInstId", checkedInstId);
        return dmGoodsInstMapper.queryAvailableGoodsInst(params);
    }

    @Transactional
    public Map sumitCartGoods(Map param) {
    	
        String goodsId   = (String)param.get("goodsId");
        String circle_id   = (String)param.get("circle_id");
        List tags = (List) param.get("tags");
        
        DmGoods dmGoods = dmGoodsMapper.selectByPrimaryKey(Integer.valueOf(goodsId));
        DmGoodsPlan goodsPlan = dmGoodsPlanMapper.selectActiveGoodsPlan(goodsId);
        DmGoodsInst dmGoodsInst = new DmGoodsInst();
        dmGoodsInst.setGoodsId(dmGoods.getGoodsId());
        dmGoodsInst.setGoodsName(dmGoods.getGoodsName());
        dmGoodsInst.setGoodsType(dmGoods.getType());
        dmGoodsInst.setEffDate(dmGoods.getEffDate());
        dmGoodsInst.setExpDate(dmGoods.getExpDate());
        LoginInfo currUser = ApplicationContextUtil.getCurrentLoginUser();
        dmGoodsInst.setMerchantId(currUser.getMerchantId());
        dmGoodsInst.setPlanId(goodsPlan.getPlanId());
        dmGoodsInst.setDmGoodsPlan(goodsPlan);
        dmGoodsInst.setState("00P");

        //插入商品实例
        dmGoodsInstMapper.insert(dmGoodsInst);
        Integer inst_id = PKUtils.lastInsertId();
        dmGoodsInst.setInstId(inst_id);

        //加入商品到购物车
        DmShoppingCart dmShoppingCart = new DmShoppingCart();
        dmShoppingCart.setCteateTime(new Date());

        dmShoppingCart.setGoodsInstId(inst_id);
        dmShoppingCart.setGoodsItemNo(1);
        dmShoppingCart.setMerchantId(1);
        dmShoppingCartMapper.insert(dmShoppingCart);
        Integer dmShoppingCartId = PKUtils.lastInsertId();
        dmShoppingCart.setId(dmShoppingCartId);
        ShoppingCart shoppingCart = ApplicationContextUtil.getShoppingCart();
//        shoppingCart.addDmShoppingCart(dmShoppingCart);
        shoppingCart.putGoodsInCart(dmGoodsInst);

        //插入标签实例
        for (int i = 0; i < tags.size(); i++) {
            Map tag = (Map) tags.get(i);
            DmGoodsInstTagItem dmGoodsInstTagItem = new DmGoodsInstTagItem();
            dmGoodsInstTagItem.setInstId(inst_id);
            dmGoodsInstTagItem.setItemId(Integer.valueOf((String) tag.get("item_id")));
            dmGoodsInstTagItemMapper.insert(dmGoodsInstTagItem);
            Integer instTagItemId = PKUtils.lastInsertId();
            dmGoodsInstTagItem.setInstTagItemId(instTagItemId);
        }

        //最后更新营销区域
        DmBizCircle dmBizCircle = new DmBizCircle();
        dmBizCircle.setCircleId(Integer.valueOf(circle_id));
        dmBizCircle.setInstId(inst_id);
        dmBizCircleMapper.updateInstIdByPrimaryKey(dmBizCircle);

        return new HashMap();
    }

    public DmGoodsInst selectGoodsInstById(Integer goodsInstId) {
        return dmGoodsInstMapper.selectGoodsInstAndPrice(goodsInstId);
    }
}
