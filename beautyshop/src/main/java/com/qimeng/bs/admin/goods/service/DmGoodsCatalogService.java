package com.qimeng.bs.admin.goods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qimeng.common.tools.Const;
import com.qimeng.bs.admin.goods.bean.DmGoodsCatalog;
import com.qimeng.bs.admin.goods.dao.DmGoodsCatalogMapper;
import com.qimeng.bs.admin.goods.dao.DmGoodsMapper;

@Service
@SuppressWarnings("unchecked")
public class DmGoodsCatalogService {
	
	@Autowired
	private DmGoodsCatalogMapper dmGoodsCatalogMapper;
	@Autowired
	private DmGoodsMapper dmGoodsMapper;
	
	public Map searchDmGoodsCatalogs(Map params) {
		return null;
	}
	
	public List<Map> searchAllDmGoodsCatalogs(Map params) {
		List<Map> catas = dmGoodsCatalogMapper.searchDmGoodsCatalogs(params);
		for (Map cata : catas) {
			Map m = new HashMap();
			m.put("up_catalog_id", Const.getStrValue(cata, "catalog_id"));
			cata.put("children", searchAllDmGoodsCatalogs(m));
		}
		return catas;
	}
	
	public String queryFullCataName(String catalog_id) {
		String result = "";
        if (StringUtils.isNotEmpty(catalog_id)) {
            result = dmGoodsCatalogMapper.queryFullCataName(Integer.valueOf(catalog_id));
        }
		return result;
	}
	
	public List<DmGoodsCatalog> query(DmGoodsCatalog dmOrganization){
		 List<DmGoodsCatalog> ret = dmGoodsCatalogMapper.findCatalogs(dmOrganization);
		 return ret;
	}
	
	@Transactional
	public int save(DmGoodsCatalog catalog){
		return dmGoodsCatalogMapper.insert(catalog);
	}
	
	/**
	 * 更新组织,级联更新组织路径
	 * @param catalog
	 * @return
	 */
	@Transactional
	public int update(DmGoodsCatalog catalog){
		return dmGoodsCatalogMapper.updateByPrimaryKeySelective(catalog);
	}
	
	/**
	 * 级联删除
	 * @param tag
	 * @return
	 */
	@Transactional
	public int delete(DmGoodsCatalog catalog){
		/*List<DmGoodsCatalog> list = dmGoodsCatalogMapper.findCatalogs(getChildrenCond(catalog));
		for(DmGoodsCatalog subDmGoodsCatalog: list){
			delete(subDmGoodsCatalog);
		}*/
		dmGoodsMapper.unattachCatalog(catalog.getCatalogId());
		return dmGoodsCatalogMapper.deleteByPrimaryKey(catalog.getCatalogId());
	}
	
	
	private DmGoodsCatalog getChildrenCond(DmGoodsCatalog catalog){
		DmGoodsCatalog deleteCond = new DmGoodsCatalog();
		deleteCond.setUpCatalogId(catalog.getCatalogId()==null?-999:catalog.getCatalogId());
		return deleteCond;
	}
}
