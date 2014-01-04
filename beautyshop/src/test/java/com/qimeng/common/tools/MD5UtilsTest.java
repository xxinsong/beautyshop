package com.qimeng.common.tools;

import com.qimeng.com.ztesoft.test.BaseTest;
import junit.framework.Assert;
import org.junit.Test;


public class MD5UtilsTest extends BaseTest {
    private final String ORI_CODE = "123456";
    private final String SALT = "SALT";
    private final String ENCRYPT_CODE = "4f029bac9a75dda6313cbdfc96eedd3f";
    private final String ENCRYPT_CODE_WITH_SALT = "336ba2b2f99e3d01a8ec889426a5d37b";

    @Test
    public void testEncrypt() throws Exception {
        System.out.println(MD5Utils.encrypt(ORI_CODE));
        Assert.assertEquals(ENCRYPT_CODE,MD5Utils.encrypt(ORI_CODE));
        System.out.println(MD5Utils.encrypt(ORI_CODE,SALT));
        Assert.assertEquals(ENCRYPT_CODE_WITH_SALT,MD5Utils.encrypt(ORI_CODE,SALT));
    }


    public static void main(String[] args) {
        System.out.println("A".hashCode());
        System.out.println("B".hashCode());
        System.out.println("a".hashCode());
        System.out.println("b".hashCode());
        System.out.println("1".hashCode());
        System.out.println("2".hashCode());
    }
} 
