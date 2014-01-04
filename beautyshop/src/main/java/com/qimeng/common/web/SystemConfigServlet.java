package com.qimeng.common.web;

import com.qimeng.common.tools.SensitiveWordFilter;
import com.qimeng.bs.common.service.DcSystemConfigService;
import com.qimeng.bs.system.staticdata.service.StaticDataService;
import org.apache.log4j.Logger;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

/**
 *加载系统初始化参数，静态数据等
 */
public class SystemConfigServlet extends HttpServlet {
    private final Logger logger = Logger.getLogger(SystemConfigServlet.class);

    private DcSystemConfigService dcSystemConfigService;
    private StaticDataService staticDataService;
    private SensitiveWordFilter filter;

    @Override
    public void init() throws ServletException {
        super.init();
        ServletContext sc = this.getServletContext();
        WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(sc);

//      加载系统配置参数
        dcSystemConfigService = (DcSystemConfigService) wac.getBean("dcSystemConfigService");
        dcSystemConfigService.loadAllSystemConfig();

//        加载静态数据
        staticDataService = (StaticDataService) wac.getBean("staticDataService");
        staticDataService.loadAllStaticData();

//        加载敏感词库
        filter = (SensitiveWordFilter) wac.getBean("sensitiveWordFilter");
        filter.initWordDict();

    }
}
