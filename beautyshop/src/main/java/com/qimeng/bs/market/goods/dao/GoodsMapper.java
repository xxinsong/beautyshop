package com.qimeng.bs.market.goods.dao;

import java.util.List;
import java.util.Map;

import com.qimeng.bs.admin.goods.bean.DmGoods;
import org.springframework.stereotype.Repository;

import com.qimeng.common.Page;

@Repository
@SuppressWarnings("unchecked")
public interface GoodsMapper {

	public List<Map> searchGoodsTags(Map params);

	public List<Map> searchGoods(Map params);

	public List<Map> searchGoodsPage(Page page);
	
	public List<Map> searchHotGoods(Map params);

	public List<Map> searchGoodsCatalogs(Map params);

    public List<Map> searchAdGoods(Map params);

    List<DmGoods> getAllGoodsList();

    Map getGoodsById(Integer goodsId);
}
