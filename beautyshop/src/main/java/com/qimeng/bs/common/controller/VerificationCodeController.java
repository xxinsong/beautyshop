package com.qimeng.bs.common.controller;

import org.apache.commons.lang3.StringUtils;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Controller;

/**
 * User: Simon
 * Date: 13-12-17
 */
@Controller
@RemoteProxy
public class VerificationCodeController extends GenericController{

    @RemoteMethod
    public boolean verifyCode(String inputCode){
        String randCode = (String) getSessionAttribute("VERIFICATION_CODE");
        if(StringUtils.equals(randCode,inputCode)){
            return true;
        }
        return false;
    }
}
