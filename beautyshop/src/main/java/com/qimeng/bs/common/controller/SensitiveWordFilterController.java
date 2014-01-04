package com.qimeng.bs.common.controller;

import com.qimeng.common.tools.SensitiveWordFilter;
import com.qimeng.common.tools.filter.SensitiveInfo;
import org.apache.log4j.Logger;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * User: Simon
 * Date: 13-12-17
 */
@Controller
@RemoteProxy
public class SensitiveWordFilterController {
    private Logger logger = Logger.getLogger(SensitiveWordFilterController.class);
    @Autowired
    private SensitiveWordFilter filter;

    @RemoteMethod
    public boolean filterContent(String smsContent) {
        SensitiveInfo sensitiveInfo = filter.filter(smsContent);
        String[] foundWords = sensitiveInfo.getFoundWords();
        if (foundWords.length > 0) {
            StringBuilder sb = new StringBuilder();
            for (String word : foundWords) {
                sb.append(word).append("|");
            }
            logger.debug("发现敏感词：\n" + sb.toString());
            return false;
        }
        return true;
    }
}
