package com.qimeng.common.tools;

import com.qimeng.com.ztesoft.test.BaseTest;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.*;

/**
 * PKUtils Tester.
 *
 * @author <Authors name>
 * @version 1.0
 */
public class PKUtilsTest extends BaseTest {
    @Autowired
    private PKUtils pkUtils;
    /**
     * Method: nextVal(String tableName)
     */
    @Test
    public void testNextVal() throws Exception {
        ExecutorService executorService = Executors.newFixedThreadPool(50);
        List<Future<List<Integer>>> resultList = new ArrayList<Future<List<Integer>>>();
        long start = System.currentTimeMillis();

        for (int i = 0; i < 100; i++) {
            Future<List<Integer>> future = executorService.submit(new Callable<List<Integer>>(){
                @Override
                public List<Integer> call() throws Exception {
                    List<Integer> list = new ArrayList<Integer>();
                    for(int i=0;i<100;i++){
                        int key = pkUtils.nextVal("test");
                        list.add(key);
                    }
                    return list;
                }
            });
            resultList.add(future);
        }
        executorService.shutdown();

        Set<Integer> set = new HashSet<Integer>();
        for (Future<List<Integer>> fs : resultList) {
            try {
                List<Integer> list = fs.get();
                Assert.assertTrue(set.addAll(list));
            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (ExecutionException e) {
                executorService.shutdownNow();
                e.printStackTrace();
                return;
            }
        }
        Assert.assertEquals(100*100,set.size());
        long end = System.currentTimeMillis();
        System.out.println((end-start)/1000);
    }


}
