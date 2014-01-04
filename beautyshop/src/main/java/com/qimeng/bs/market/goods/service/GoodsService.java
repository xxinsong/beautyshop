package com.qimeng.bs.market.goods.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qimeng.common.Page;
import com.qimeng.common.tools.Const;
import com.qimeng.bs.market.goods.dao.GoodsMapper;

@Service
@SuppressWarnings("unchecked")
public class GoodsService {

	@Autowired
	private GoodsMapper goodsMapper;

	public List<Map> searchGoodsByCatalogId(String catalog_id) {
		Map params = new HashMap();
		params.put("catalog_id", catalog_id);
		List<Map> result = goodsMapper.searchGoods(params);
		return result;
	}

	public List<Map> searchGoodsTags(Map params) {
		List<Map> goods = searchGoodsByCatalogId(Const.getStrValue(params, "cata"));
		List goods_ids = new ArrayList();
		for (Map map : goods) {
			goods_ids.add(Const.getStrValue(map, "goods_id"));
		}
		if (goods_ids.size() == 0) {
			return new ArrayList();
		}
		Map sqlParams = new HashMap();
		sqlParams.put("goods", goods_ids);
		List<Map> result = goodsMapper.searchGoodsTags(sqlParams);
		return result;
	}
	
	public Page searchGoodsPage(Map params, int pageIndex, int pageSize) {
		String query_type = Const.getStrValue(params, "query_type");
		String catalog_id = Const.getStrValue(params, "catalog_id");
		
		if (StringUtils.isNotEmpty(catalog_id)) {
			List catas = new ArrayList();
			catas.add(catalog_id);
			catas.addAll(searchChildCatas(Integer.valueOf(catalog_id)));
			params.put("catas", catas);
		}
		Page page = new Page();
		page.setPageIndex(pageIndex);
		page.setPageSize(pageSize);
		page.setParams(params);
		List<Map> goods = new ArrayList<Map>();
		if ("001".equals(query_type)) {
			// 按销量
			goods.addAll(goodsMapper.searchGoodsPage(page));
		} else if ("002".equals(query_type)) {
			// 按价格
			goods.addAll(goodsMapper.searchGoodsPage(page));
		} else if ("003".equals(query_type)) {
			// 按评论
			goods.addAll(goodsMapper.searchGoodsPage(page));
		} else if ("004".equals(query_type)) {
			// 按时间
			goods.addAll(goodsMapper.searchGoodsPage(page));
		}
		page.setRows(goods);
		return page;
	}
	
	public List searchChildCatas(int catalog_id) {
		List result = new ArrayList();
		Map sqlParams = new HashMap();
		sqlParams.put("up_catalog_id", catalog_id);
		List<Map> list = goodsMapper.searchGoodsCatalogs(sqlParams);
		for (Map map : list) {
			result.add(Const.getStrValue(map, "catalog_id"));
			result.addAll(searchChildCatas(Integer.valueOf(Const.getStrValue(map, "catalog_id"))));
		}
		return result;
	}
	
	public List<Map> searchHotGoods(int num) {
		Map sqlParams = new HashMap();
		sqlParams.put("num", num);
		return goodsMapper.searchHotGoods(sqlParams);
	}
}
