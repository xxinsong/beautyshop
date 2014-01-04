package com.qimeng.bs.admin.goods.controller;

import java.awt.Image;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.apache.log4j.Logger;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.qimeng.bs.admin.goods.bean.DmAdvertisement;
import com.qimeng.bs.admin.goods.bean.DmGoods;
import com.qimeng.bs.admin.goods.service.DmAdvertisementService;
import com.qimeng.bs.admin.goods.service.DmGoodsService;
import com.qimeng.bs.admin.merchant.bean.DmMerchant;
import com.qimeng.bs.admin.merchant.service.DmMerchantService;
import com.qimeng.bs.common.controller.GenericController;
import com.qimeng.bs.common.service.DcSystemConfigService;
import com.qimeng.bs.login.bean.LoginInfo;

@Controller
@RequestMapping(value = "image")
public class ImageUploadController extends GenericController{
	

	@Autowired
	private DmGoodsService dmGoodsService;
	@Autowired
	private DmAdvertisementService dmAdvertisementService;
	@Autowired
	private DcSystemConfigService dcSystemConfigService;
	@Autowired
	private DmMerchantService dmMerchantService;
	
	private final Logger logger = Logger.getLogger(ImageUploadController.class);

	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public ResponseEntity<String> upload(DmGoods good, MultipartFile gfile) throws IOException, JSONException {
		JSONObject retJson = new JSONObject();
		retJson.put("success", "true");
		retJson.put("msg", "上传成功");
		if (gfile.getSize() <= 0) {
			throw new RuntimeException();
		}
		HttpHeaders headers = new HttpHeaders();
		headers.set("Content-Type", "text/html; charset=UTF-8");
		Integer goodImageW = Integer.parseInt(dcSystemConfigService.getSystemParamValue("ADMIN_GOOD_IMAGE_W"));
		Integer goodImageH = Integer.parseInt(dcSystemConfigService.getSystemParamValue("ADMIN_GOOD_IMAGE_H"));
		Image img = ImageIO.read(gfile.getInputStream());
		Integer uploadImagW = img.getWidth(null);
		Integer uploadImagH = img.getHeight(null);
		if(uploadImagW.compareTo(goodImageW)!=0||uploadImagH.compareTo(goodImageH)!=0){
			retJson.put("success", "false");
			retJson.put("msg", "上传图片高度/宽度不正确，正确高宽比例 :"+goodImageH+"/"+goodImageW);
		}else{
			retJson.put("msg", "上传成功");
			retJson.put("remoteImgPath", dmGoodsService.updateImageUri(good, gfile));
		}
		return new ResponseEntity<String>(retJson.toString(), headers, HttpStatus.OK);
	}
	
	
	
	@RequestMapping(value = "adupload", method = RequestMethod.POST)
	public ResponseEntity<String> adupload(DmAdvertisement ad, MultipartFile adfile) throws IOException, JSONException {
		JSONObject retJson = new JSONObject();
		HttpHeaders headers = new HttpHeaders();
		retJson.put("success", "true");
		retJson.put("msg", "上传成功");
		if (adfile.getSize() <= 0) {
			throw new RuntimeException();
		}
		Integer adImageW = Integer.parseInt(dcSystemConfigService.getSystemParamValue("ADMIN_AD_IMAGE_W"));
		Integer adImageH = Integer.parseInt(dcSystemConfigService.getSystemParamValue("ADMIN_AD_IMAGE_H"));
		Image img = ImageIO.read(adfile.getInputStream());
		Integer uploadImagW = img.getWidth(null);
		Integer uploadImagH = img.getHeight(null);
		if(uploadImagW.compareTo(adImageW)!=0||uploadImagH.compareTo(adImageH)!=0){
			retJson.put("success", "false");
			retJson.put("msg", "上传失败-上传图片高度/宽度不正确，正确高宽比例 :"+adImageH+"/"+adImageW);
		}else{
			retJson.put("msg", "上传成功");
			retJson.put("remoteImgPath", dmAdvertisementService.updateImageUrl(ad, adfile));
		}
		headers.set("Content-Type", "text/html; charset=UTF-8");
		return new ResponseEntity<String>(retJson.toString(), headers, HttpStatus.OK);
	}
	
	
	@RequestMapping(value = "mfupload", method = RequestMethod.POST)
  public ResponseEntity<String> mfupload(LoginInfo logon, MultipartFile mffile) throws IOException, JSONException {
    JSONObject retJson = new JSONObject();
    HttpHeaders headers = new HttpHeaders();
    headers.set("Content-Type", "text/html; charset=UTF-8");
    retJson.put("success", "true");
    retJson.put("msg", "上传成功");
    if (mffile.getSize() <= 0) {
      throw new RuntimeException();
    }
    retJson.put("msg", "上传成功");
    DmMerchant userMerchant = dmMerchantService.findMerchantByUserId(logon.getUserId());
    if(userMerchant==null){
      retJson.put("success", "false");
      retJson.put("msg", "上传失败-当前账户不存在商户信息");
    }else{
      retJson.put("remoteImgPath", dmMerchantService.updateLicenseUri(userMerchant, mffile));
    }
    return new ResponseEntity<String>(retJson.toString(), headers, HttpStatus.OK);
  }
	
	
}
