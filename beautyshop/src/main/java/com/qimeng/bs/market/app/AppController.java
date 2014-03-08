package com.qimeng.bs.market.app;

import com.qimeng.bs.common.controller.GenericController;
import com.qimeng.bs.common.service.DcSystemConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

/**
 * User: Simon
 * Date: 14-3-7
 */
@Controller
public class AppController extends GenericController{

    @Autowired
    private DcSystemConfigService systemConfigService;

    @RequestMapping("/app/download")
    public String appDownload(HttpServletRequest request,HttpServletResponse response){
        String filePath = systemConfigService.getSystemParamValue("APP_FILE_PATH");
        response.setContentType("application/x-download");
        response.addHeader("Content-Disposition", "attachment; filename="
                + "hsm_app.apk");
        response.setCharacterEncoding("UTF-8");
        OutputStream outp = null;
        FileInputStream in = null;
        try {
            outp = response.getOutputStream();
            in = new FileInputStream(filePath);
            byte[] b = new byte[1024];
            int i = 0;
            while ((i = in.read(b)) > 0) {
                outp.write(b, 0, i);
            }
            outp.flush();
        } catch (Exception e) {
            System.out.println("文件下载失败!");
            e.printStackTrace();
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (IOException e) {
                    e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
                }
                in = null;
            }
            if (outp != null) {
                try {
                    outp.close();
                } catch (IOException e) {
                    e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
                }
                outp = null;
            }
        }
        return null;
    }
}
