package com.qimeng.bs.system.staticdata.service;

import com.qimeng.bs.system.staticdata.bean.DcAttrValue;
import com.qimeng.bs.system.staticdata.bean.DcAttribute;
import com.qimeng.bs.system.staticdata.dao.DcAttributeMapper;
import com.qimeng.bs.common.exception.SystemConfigException;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * User: Simon
 * Date: 13-11-29
 * 静态数据访问
 */
@Service
public class StaticDataService {
    private final Logger logger = Logger.getLogger(StaticDataService.class);
    private Map<String,List<DcAttrValue>> staticDataCache = Collections.synchronizedMap(new HashMap<String,List<DcAttrValue>>());

    @Autowired
    private DcAttributeMapper dcAttributeMapper;

    public void loadAllStaticData(){
        List<DcAttribute> list = dcAttributeMapper.selectAllStaticData();
        for(DcAttribute attr :list){
            cacheSystemParam(attr);
        }
        logger.info("静态数据加载完成，共加载"+list.size()+"条数据。");
    }

    public DcAttribute loadStaticData(String attrCode){
        DcAttribute attribute = dcAttributeMapper.selectStaticDataByCode(attrCode);
        cacheSystemParam(attribute);
        return attribute;
    }

    public void refreshAll(){
        logger.info("刷新静态数据。");
        staticDataCache.clear();
        loadAllStaticData();
    }

    public DcAttribute refreshAttr(String attrCode){
        staticDataCache.remove(attrCode);
        return loadStaticData(attrCode);
    }

    public List<DcAttrValue> getStaticData(String attrCode){
        List<DcAttrValue> attr = staticDataCache.get(attrCode);
        if(attr == null){
            loadStaticData(attrCode);
            attr = staticDataCache.get(attrCode);
            if(attr == null){
                throw new SystemConfigException("找不到静态数据，静态数据编码："+attrCode);
            }
        }
        if(attr.isEmpty()){
            logger.warn("["+attrCode+"] 静态数据值为空。");
        }
        return attr;
    }

    public void cacheSystemParam(DcAttribute attr){
        if(attr !=null && StringUtils.isNotEmpty(attr.getAttrCode())){
            staticDataCache.put(attr.getAttrCode(), attr.getValueList());
        }
    }
}
