package com.qimeng.bs.admin.goods.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.qimeng.bs.admin.goods.bean.DmGoodsCatalog;

@Repository
@SuppressWarnings("unchecked")
public interface DmGoodsCatalogMapper {
    int deleteByPrimaryKey(Integer catalogId);

    int insert(DmGoodsCatalog record);

    int insertSelective(DmGoodsCatalog record);

    DmGoodsCatalog selectByPrimaryKey(Integer catalogId);
    
	List<Map> searchDmGoodsCatalogs(Map params);

    int updateByPrimaryKeySelective(DmGoodsCatalog record);

    int updateByPrimaryKey(DmGoodsCatalog record);
    
    List<DmGoodsCatalog> findCatalogs(Object params);
    
    @Select(value = "select func_cata_name(#{catalogId})")
	public String queryFullCataName(Integer catalogId);
}