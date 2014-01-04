package com.qimeng.bs.admin.goods.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.jcraft.jsch.JSchException;
import com.qimeng.common.Page;
import com.qimeng.common.tools.ImagesUtils;
import com.qimeng.common.tools.SFTPClient;
import com.qimeng.bs.admin.goods.bean.DmAdvertisement;
import com.qimeng.bs.admin.goods.dao.DmAdvertisementMapper;
import com.qimeng.bs.common.service.DcSystemConfigService;
@Service
public class DmAdvertisementService {

	@Autowired
	private DmAdvertisementMapper dmAdvertisementMapper;
	@Autowired
	private DcSystemConfigService dcSystemConfigService;
	private final Logger logger = Logger.getLogger(DmAdvertisementService.class);
	
	public Page<DmAdvertisement> queryPage(Page<DmAdvertisement> page){
		List<DmAdvertisement> rows = dmAdvertisementMapper.findAllAdvertisement(page);
		page.setRows(rows);
		return page;
	}
	
	@Transactional
	public int save(DmAdvertisement ad){
		int rows = dmAdvertisementMapper.insert(ad);
		return rows;
	}
	
	
	@Transactional
	public int update(DmAdvertisement ad){
		return dmAdvertisementMapper.updateByPrimaryKeySelective(ad);
	}
	
	@Transactional
	public int delete(DmAdvertisement ad){
		 Integer adId = ad.getId();
		 return dmAdvertisementMapper.deleteByPrimaryKey(adId);
	}
	
	@Transactional
	public String updateImageUrl(DmAdvertisement ad, MultipartFile adfile){
		SftpAssistor sftpAssistor = new SftpAssistor();
		String suffix = getSuffixWithDot(adfile.getOriginalFilename());
		String uuid = UUID.randomUUID().toString().replaceAll("-|:", "");
		String remoteFilePath = "";
		String compressRootPath = dcSystemConfigService.getSystemParamValue("COMPRESS_PATH");
		Integer adImageWmini = Integer.parseInt(dcSystemConfigService.getSystemParamValue("ADMIN_AD_IMAGE_W_MINI"));
		Integer adImageHmini = Integer.parseInt(dcSystemConfigService.getSystemParamValue("ADMIN_AD_IMAGE_H_MINI"));
		
		File compressedFileMini =  new File(compressRootPath+uuid+"_mini"+suffix);
		try {
			//等比压缩
			ImagesUtils.compressPic(adfile.getInputStream(), compressedFileMini, adImageWmini, adImageHmini, false);
			FileInputStream fiomini = new FileInputStream(compressedFileMini);
			sftpAssistor.changAndCreateDir(ad);
			sftpAssistor.storeFile(fiomini, uuid+"_mini" + suffix);
			sftpAssistor.storeFile(adfile.getInputStream(), uuid + suffix);
			remoteFilePath = "/photos"+ sftpAssistor.getCurrentPath() + uuid + suffix;
		    String deleteImageUrl = ad.getImageUrl();
			//update
		    ad.setImageUrl(remoteFilePath);
		    dmAdvertisementMapper.updateByPrimaryKeySelective(ad);
		    //delete the old imageFile
			if(!StringUtils.isEmpty(deleteImageUrl)&&!"null".equals(deleteImageUrl)){
				int index  = deleteImageUrl.lastIndexOf("/");
				String deleteImage = deleteImageUrl.substring(index+1);
				suffix  = getSuffixWithDot(deleteImage);
				int lastDotIndex = deleteImage.lastIndexOf(".");
				String deleteImageName = deleteImage.substring(0,lastDotIndex);
				sftpAssistor.deleteImageFile(deleteImageName+"_mini"+suffix);
				sftpAssistor.deleteImageFile(deleteImageName+"_mid"+suffix);
				sftpAssistor.deleteImageFile(deleteImageName+suffix);
		    }
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		} finally {
			sftpAssistor.disconnect();
			if(compressedFileMini.exists())
			   compressedFileMini.delete();
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
			String host = dcSystemConfigService
					.getSystemParamValue("FTP_HOSTNAME");
			String login = dcSystemConfigService
					.getSystemParamValue("FTP_USERNAME");
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
		
		void deleteImageFile(String path){
			sftpClient.rmFile(path);
		}

		void changAndCreateDir(DmAdvertisement ad) throws Exception {
			String adId = ad.getId() + "";
			StringBuffer path  = new StringBuffer(sftpClient.getWorkingDirectory());
			if (!sftpClient.changeDir("ads")) {
				sftpClient.createDirectory("ads");
				sftpClient.changeDir("ads");
			}
			if (!sftpClient.changeDir(adId)) {
				sftpClient.createDirectory(adId);
				sftpClient.changeDir(adId);
			}
			path.append("/ads").append("/")
			    .append(adId).append("/");
			currentPath = path.toString();
		}

		void storeFile(InputStream io, String fileName) throws IOException {
			try {
				System.out.println(sftpClient.getWorkingDirectory());
			} catch (Exception e) {
				e.printStackTrace();
			}
			sftpClient.uploadFile(io, currentPath, fileName);
		}

		void disconnect() {
			if (sftpClient != null)
				sftpClient.disconnect();
		}
		
		String getCurrentPath(){
			return this.currentPath;
		}
	}
}
