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
import com.qimeng.bs.admin.goods.bean.DmGoods;
import com.qimeng.bs.admin.goods.bean.DmGoodsTag;
import com.qimeng.bs.admin.goods.dao.DmGoodsMapper;
import com.qimeng.bs.admin.goods.dao.DmGoodsTagMapper;
import com.qimeng.bs.admin.goods.dao.DmGoodsTagValueMapper;
import com.qimeng.bs.admin.goods.dao.DmTagsItemMapper;
import com.qimeng.bs.admin.goods.dao.DmTagsMapper;
import com.qimeng.bs.common.service.DcSystemConfigService;

@Service
public class DmGoodsService {

    @Autowired
	private DmGoodsMapper dmGoodsMapper;
	@Autowired
	private DmGoodsTagMapper dmGoodsTagMapper;
	@Autowired
	public DmTagsMapper dmTagsMapper ;
	@Autowired
	public DmTagsItemMapper dmTagsItemMapper ;
	@Autowired
	private DcSystemConfigService dcSystemConfigService;
	
	@Autowired
	private DmGoodsTagValueMapper dmGoodsTagValueMapper;
	private final Logger logger = Logger.getLogger(DmGoodsService.class);
	
	
	public Page<DmGoods> queryPage(Page<DmGoods> page){
		List<DmGoods> rows = dmGoodsMapper.findAllGoods(page);
		page.setRows(rows);
		return page;
	}
	
	
	@Transactional
	public int save(DmGoods good){
		int rows = dmGoodsMapper.insert(good);
		return rows;
	}
	
	
	@Transactional
	public DmGoods getGoodsById(DmGoods goods){
		DmGoods dmGoods= dmGoodsMapper.selectByPrimaryKey( goods.getGoodsId());
		return dmGoods ;
	}
	
	@Transactional
	public int update(DmGoods good){
		return dmGoodsMapper.updateByPrimaryKeySelective(good);
	}
	
	@Transactional
	public int delete(DmGoods good){
		 Integer goodId = good.getGoodsId();
		 List<DmGoodsTag> goodsTagList = dmGoodsTagMapper.findGoodsTagByGoodId(good.getGoodsId());
         for(DmGoodsTag goodtag:goodsTagList){//遍历商品与标签的关系表删除商品标签可选值关系
        	 dmGoodsTagValueMapper.releaseAllTagsItems(goodtag.getTagGroupId());
         }
		 dmGoodsTagMapper.deleteByGoodId(goodId);//删除商品与标签的中间关系
		 return dmGoodsMapper.deleteByPrimaryKey(goodId);
	}
	
	@Transactional
	public String updateImageUri(DmGoods good, MultipartFile gfile){
		SftpAssistor sftpAssistor = new SftpAssistor();
		String suffix = getSuffixWithDot(gfile.getOriginalFilename());
		String uuid = UUID.randomUUID().toString().replaceAll("-|:", "");
		String remoteFilePath = "";
		String compressRootPath = dcSystemConfigService.getSystemParamValue("COMPRESS_PATH");
		Integer goodImageWmini = Integer.parseInt(dcSystemConfigService.getSystemParamValue("ADMIN_GOOD_IMAGE_W_MINI"));
		Integer goodImageHmini = Integer.parseInt(dcSystemConfigService.getSystemParamValue("ADMIN_GOOD_IMAGE_H_MINI"));
		Integer goodImageWmid = Integer.parseInt(dcSystemConfigService.getSystemParamValue("ADMIN_GOOD_IMAGE_W_MID"));
		Integer goodImageHmid = Integer.parseInt(dcSystemConfigService.getSystemParamValue("ADMIN_GOOD_IMAGE_H_MID"));
		
		File compressedFileMini =  new File(compressRootPath+uuid+"_mini"+suffix);
		File compressedFileMid =  new File(compressRootPath+uuid+"_mid"+suffix);
		try {
			//等比压缩
			ImagesUtils.compressPic(gfile.getInputStream(), compressedFileMini, goodImageWmini, goodImageHmini, false);
			ImagesUtils.compressPic(gfile.getInputStream(), compressedFileMid, goodImageWmid, goodImageHmid, false);
			FileInputStream fiomini = new FileInputStream(compressedFileMini);
			FileInputStream fiomid = new FileInputStream(compressedFileMid);
			sftpAssistor.changAndCreateDir(good);
			sftpAssistor.storeFile(fiomini, uuid+"_mini" + suffix);
			sftpAssistor.storeFile(fiomid, uuid+"_mid" + suffix);
			sftpAssistor.storeFile(gfile.getInputStream(), uuid + suffix);
			
			remoteFilePath = "/photos"+ sftpAssistor.getCurrentPath() + uuid + suffix;
		    String deleteImageUrl = good.getImageUri();
		    
			//update
		    good.setImageUri(remoteFilePath);
		    dmGoodsMapper.updateByPrimaryKeySelective(good);
		    
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
			if(compressedFileMid.exists())
					compressedFileMid.delete();
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

		void changAndCreateDir(DmGoods good) throws Exception {
//			String catalogId = good.getCatalogId() + "";
			String goodId = good.getGoodsId() + "";
			StringBuffer path  = new StringBuffer(sftpClient.getWorkingDirectory());
			if (!sftpClient.changeDir("goods")) {
				sftpClient.createDirectory("goods");
				sftpClient.changeDir("goods");
			}
			/*if (!sftpClient.changeDir(catalogId)) {
				sftpClient.createDirectory(catalogId);
				sftpClient.changeDir(catalogId);
			}*/
			if (!sftpClient.changeDir(goodId)) {
				sftpClient.createDirectory(goodId);
				sftpClient.changeDir(goodId);
			}
			path.append("/goods").append("/")
//			    .append(catalogId).append("/")
			    .append(goodId).append("/");
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
