package com.qimeng.bs.admin.merchant.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.jcraft.jsch.JSchException;
import com.qimeng.common.Page;
import com.qimeng.common.tools.SFTPClient;
import com.qimeng.bs.admin.merchant.bean.DmMerchant;
import com.qimeng.bs.admin.merchant.bean.DmMerchantFile;
import com.qimeng.bs.admin.merchant.dao.DmMerchantFileMapper;
import com.qimeng.bs.admin.merchant.dao.DmMerchantMapper;
import com.qimeng.bs.common.service.DcSystemConfigService;

@Service
@SuppressWarnings("unchecked")
public class DmMerchantService {
  
  @Autowired
  public DmMerchantMapper DmMerchantMapper;
  @Autowired
  private DcSystemConfigService dcSystemConfigService;
  @Autowired
  public DmMerchantFileMapper dmMerchantFileMapper ;
  
  private final Logger logger = Logger.getLogger(DmMerchantService.class);
  
  public Page<DmMerchant> queryPage(Map params, int pageIndex, int pageSize) {
    Page<DmMerchant> page = new Page<DmMerchant>(pageIndex, pageSize);
    page.setParams(params);
    List<DmMerchant> rows = DmMerchantMapper.findAllMerchant(params);
    page.setRows(rows);
    return page;
  }
  
  public DmMerchant findMerchantByUserId(Integer userId){
    Map params = new HashMap();
    params.put("userId", userId);
    List<DmMerchant> rows = DmMerchantMapper.findAllMerchant(params);
    if(rows.isEmpty()){
      return null;
    }else{
      return rows.get(0);
    }
  }
  
  public int updateMerchantState(Map params) {
    DmMerchant record = new DmMerchant();
    record.setMerchantId((Integer) params.get("merchant_id"));
    record.setState((String) params.get("state"));
    return DmMerchantMapper.updateByPrimaryKeySelective(record);
  }
  
  public int updateMerchant(DmMerchant dmMerchant) {
    return DmMerchantMapper.updateByPrimaryKeySelective(dmMerchant);
  }
  
  public int updateStateByPrimaryKey(DmMerchant dmMerchant) {
    return DmMerchantMapper.updateStateByPrimaryKey(dmMerchant);
  }
  
  
  @Transactional
  public String updateLicenseUri(DmMerchant dmMerchant, MultipartFile gfile){
    SftpAssistor sftpAssistor = new SftpAssistor();
    String suffix = getSuffixWithDot(gfile.getOriginalFilename());
    String uuid = UUID.randomUUID().toString().replaceAll("-|:", "");
    String remoteFilePath = "";
    String deleteImageUrl = "";
    Map params = new HashMap();
    params.put("merchantId",dmMerchant.getMerchantId());
    params.put("type", "01");
    List<DmMerchantFile>  merchantFileList = dmMerchantFileMapper.searchMerchantFiles(params);
    
    try {
      sftpAssistor.changAndCreateDir(dmMerchant);
      sftpAssistor.storeFile(gfile.getInputStream(), uuid + suffix);
      
      remoteFilePath = "/photos"+ sftpAssistor.getCurrentPath() + uuid + suffix;
      if(merchantFileList.isEmpty()){
        DmMerchantFile dmMerchantFile = new DmMerchantFile();
        dmMerchantFile.setUri(remoteFilePath);
        dmMerchantFile.setMerchantId(dmMerchant.getMerchantId());
        dmMerchantFile.setType("01");
        dmMerchantFile.setName("营业执照");
        dmMerchantFile.setState("00A");
        dmMerchantFile.setCreateDate(new Date());
        dmMerchantFile.setStateDate(new Date());
        dmMerchantFileMapper.insert(dmMerchantFile);
      }else{
      //update
        DmMerchantFile dmMerchantFile = merchantFileList.get(0);
        deleteImageUrl = dmMerchantFile.getUri();
        dmMerchantFile.setUri(remoteFilePath);
        dmMerchantFileMapper.updateByPrimaryKeySelective(dmMerchantFile);
      }
        
        //delete the old imageFile
      if(!StringUtils.isEmpty(deleteImageUrl)){
        int index  = deleteImageUrl.lastIndexOf("/");
        String deleteImage = deleteImageUrl.substring(index+1);
        sftpAssistor.deleteImageFile(deleteImage);
      }
      
    } catch (Exception e) {
      e.printStackTrace();
      throw new RuntimeException(e.getMessage());
    } finally {
      sftpAssistor.disconnect();
    }
    return remoteFilePath;
  }
  
  public static String getSuffixWithDot(String fileName) {
    if (fileName.indexOf(".") != -1)
      return fileName.substring(fileName.lastIndexOf("."));
    else
      return fileName;
  }
  
  class SftpAssistor {
    
    private SFTPClient sftpClient;
    
    private String currentPath;
    
    public SftpAssistor() {
      this.sftpClient = new SFTPClient();
      this.initSFTPConnection();
    }
    
    private void initSFTPConnection() {
      String host = dcSystemConfigService.getSystemParamValue("FTP_HOSTNAME");
      String login = dcSystemConfigService.getSystemParamValue("FTP_USERNAME");
      String password = dcSystemConfigService
          .getSystemParamValue("FTP_PASSWORD");
      int port = Integer.parseInt(dcSystemConfigService
          .getSystemParamValue("FTP_PORT"));
      try {
        sftpClient.connect(host, login, password, port);
      } catch (JSchException e) {
        logger.error("存储图片的FTP服务器连接失败！！");
        e.printStackTrace();
      }
    }
    
    void deleteImageFile(String path) {
      sftpClient.rmFile(path);
    }
    
    void changAndCreateDir(DmMerchant dmMerchant) throws Exception {
      String merchantId = dmMerchant.getMerchantId() + "";
      StringBuffer path = new StringBuffer(sftpClient.getWorkingDirectory());
      if (!sftpClient.changeDir("mf")) {
        sftpClient.createDirectory("mf");
        sftpClient.changeDir("mf");
      }
      if (!sftpClient.changeDir(merchantId)) {
        sftpClient.createDirectory(merchantId);
        sftpClient.changeDir(merchantId);
      }
      path.append("/mf").append("/").append(merchantId).append("/");
      currentPath = path.toString();
    }
    
    void storeFile(InputStream io, String fileName) throws IOException {
      sftpClient.uploadFile(io, currentPath, fileName);
    }
    
    void disconnect() {
      if (sftpClient != null) sftpClient.disconnect();
    }
    
    String getCurrentPath() {
      return this.currentPath;
    }
  }
}
