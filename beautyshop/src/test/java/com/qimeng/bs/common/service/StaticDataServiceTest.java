package com.qimeng.bs.common.service;

import com.qimeng.com.ztesoft.test.BaseTest;
import com.qimeng.bs.system.staticdata.bean.DcAttrValue;
import com.qimeng.bs.system.staticdata.service.StaticDataService;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class StaticDataServiceTest extends BaseTest {
    @Autowired
    private StaticDataService staticDataService;

    @Before
    public void loadAllStaticData() {
        staticDataService.loadAllStaticData();
    }

    /**
     * Method: getStaticData(String attrCode)
     */
    @Test
    public void testGetStaticData() throws Exception {
        String TEST_CODE = "TEST";
        String NOT_EXIST = "NOT_EXIST";
        List<DcAttrValue> test = staticDataService.getStaticData(TEST_CODE);
        Assert.assertNotNull(test);

        staticDataService.refreshAll();
        test = staticDataService.getStaticData(TEST_CODE);
        Assert.assertNotNull(test);

        staticDataService.refreshAttr(TEST_CODE);
        test = staticDataService.getStaticData(TEST_CODE);
        Assert.assertNotNull(test);

        try {
            test = null;
            test = staticDataService.getStaticData(NOT_EXIST);
        } catch (Exception e) {
            e.printStackTrace();
        }
        Assert.assertNull(test);
    }
}
