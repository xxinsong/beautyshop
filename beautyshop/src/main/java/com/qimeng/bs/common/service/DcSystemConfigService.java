package com.qimeng.bs.common.service;

import com.qimeng.bs.common.bean.DcSystemConfig;
import com.qimeng.bs.common.dao.DcSystemConfigMapper;
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
 * 系统参数
 */
@Service
public class DcSystemConfigService {
    private final Logger logger = Logger.getLogger(DcSystemConfig.class);
    private Map<String,DcSystemConfig> systemConfigCache = Collections.synchronizedMap(new HashMap<String,DcSystemConfig>());

    @Autowired
    private DcSystemConfigMapper dcSystemConfigMapper;

    public void loadAllSystemConfig(){
        List<DcSystemConfig> list = dcSystemConfigMapper.selectAll();
        for(DcSystemConfig cfg:list){
            cacheSystemParam(cfg);
        }
        logger.info("系统配置参数加载完成，共加载"+list.size()+"条数据。");
    }

    private DcSystemConfig loadSystemConfig(String paramCode) {
        DcSystemConfig cfg = dcSystemConfigMapper.selectByParamCode(paramCode);
        cacheSystemParam(cfg);
        return cfg;
    }

    public void refreshAll(){
        logger.info("刷新系统配置参数。");
        systemConfigCache.clear();
        loadAllSystemConfig();
    }

    public DcSystemConfig refreshParam(String paramCode){
        systemConfigCache.remove(paramCode);
        return loadSystemConfig(paramCode);
    }



    public DcSystemConfig getSystemParam(String paramCode){
        DcSystemConfig cfg = systemConfigCache.get(paramCode);
        if(cfg==null){
            cfg = refreshParam(paramCode);
            if(cfg==null){
                throw new SystemConfigException("未找到参数["+paramCode+"],请检查配置！");
            }
        }
        return cfg;
    }

    public String getSystemParamValue(String paramCode){
        DcSystemConfig cfg = getSystemParam(paramCode);
        if(cfg!=null){
            return cfg.getParamValue();
        }
        return null;
    }

    public void cacheSystemParam(DcSystemConfig cfg){
        if(cfg!=null && StringUtils.isNotEmpty(cfg.getParamCode())){
            systemConfigCache.put(cfg.getParamCode(),cfg);
        }
    }
}
