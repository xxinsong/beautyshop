package com.qimeng.common.tools;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

/**
 * User: Simon
 * Date: 13-12-2
 * 系统中对密码的处理统一使用此类
 */
@Component
public class PasswordEncoder {

    /**
     * 对用户密码进行加密
     * 采用加盐方式的MD5算法
     * 用户名作为salt
     * @param salt  用户名作为佐料(加盐)
     * @param password  原始密码
     * @return  加密字符串
     */
    public static String encode(String password,String salt){
        return MD5Utils.encrypt(password,salt);
    }

    /**
     * 校验密码是否正确，需传入原始密码、用户名、加密后的密码
     * @param oriPassword   原始密码
     * @param salt  用户名作为佐料(加盐)
     * @param encPassword   加密后密码
     * @return  校验结果true|false
     */
    public static boolean validate(String oriPassword,String salt,String encPassword){
        return StringUtils.equals(encPassword,encode(oriPassword,salt));
    }
}
