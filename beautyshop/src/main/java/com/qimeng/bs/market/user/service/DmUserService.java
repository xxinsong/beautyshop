package com.qimeng.bs.market.user.service;

import java.util.*;

import com.qimeng.common.tools.PKUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qimeng.common.Constants;
import com.qimeng.common.tools.Const;
import com.qimeng.common.tools.DateFormatUtils;
import com.qimeng.common.tools.PasswordEncoder;
import com.qimeng.bs.admin.merchant.bean.DmContact;
import com.qimeng.bs.admin.merchant.bean.DmMerchant;
import com.qimeng.bs.admin.merchant.dao.DmContactMapper;
import com.qimeng.bs.admin.merchant.dao.DmMerchantMapper;
import com.qimeng.bs.market.user.bean.DmUser;
import com.qimeng.bs.market.user.dao.DmUserMapper;

@Service
@SuppressWarnings("unchecked")
public class DmUserService {

	@Autowired
	private DmUserMapper dmUserMapper;
	
	@Autowired
	private DmMerchantMapper dmMerchantMapper;
	
	@Autowired
	private DmContactMapper dmContactMapper;
	
	public List<DmUser> searchUser(Map params) {
		return dmUserMapper.searchUser(params);
	}

	@Transactional
	public Map insertUser(Map params) {
		Map result = new HashMap(); 
		String s_verificCode = Const.getStrValue(params, "s_verificCode");
		String verificCode = Const.getStrValue(params, "verificCode");
	
		//是否存在相同的登录名
		Map sqlParams = new HashMap();
		sqlParams.put("logonName", Const.getStrValue(params, "logon_name"));
		List<DmUser> dmUsers = dmUserMapper.searchUser(sqlParams);
		if (dmUsers.size() > 0) {
			result.put("flag", 1);
			return result;
		}
		
		//验证码是否一致
		if (!StringUtils.equals(s_verificCode, verificCode)) {
			result.put("flag", 2);
			return result;
		}
		
		sqlParams.put("passwd", PasswordEncoder.encode(Const.getStrValue(params, "passwd"), 
				Const.getStrValue(params, "logon_name")));
		sqlParams.put("state", Constants.USER_STATE_00A);
		sqlParams.put("createTime", DateFormatUtils.getFormatedDateTime());
		sqlParams.put("logonFailedCount", 0);
		sqlParams.put("lastLoginTime", DateFormatUtils.getFormatedDateTime());
		dmUserMapper.insertUser(sqlParams);
        int userId = PKUtils.lastInsertId();

		result.put("userId", Const.getStrValue(sqlParams, "userId"));
		result.put("flag", 0);

        DmMerchant merchant = new DmMerchant();
        merchant.setUserId(userId);
        merchant.setState("00L");
        merchant.setCreateDate(new Date());
        merchant.setStateDate(new Date());
        merchant.setMerchantType("01");
        dmMerchantMapper.insert(merchant);
		return result;
	}
	
	@Transactional
	public boolean updateUser(Map params) {
		dmUserMapper.updateUser(params);
		return true;
	}
	
	public String getVerificCode() {
		return getRomdom(6);
	}
	
	public String getRomdom(int len) {
		StringBuffer temp = new StringBuffer();
		Random random = new Random();
		for (int i = 0; i < len; i++) {
			temp.append((Math.abs(random.nextInt()) % 10));
		}
		return temp.toString();
	}
	
	@Transactional
	public boolean modifyBaseInfo(Map params) {
		Map sqlParams = new HashMap();
		sqlParams.put("userId", Const.getStrValue(params, "userId"));
		sqlParams.put("userName", Const.getStrValue(params, "userName"));
		dmUserMapper.updateUser(sqlParams);
		
		//商户
		DmMerchant dmMerchant = new DmMerchant();
		dmMerchant.setMerchantName(Const.getStrValue(params, "merchantName"));
		dmMerchant.setGender(Const.getStrValue(params, "gender"));
		dmMerchant.setLegalCertNo(Const.getStrValue(params, "cardNo"));
		dmMerchant.setProvince(Const.getStrValue(params, "provinceCode"));
		dmMerchant.setCity(Const.getStrValue(params, "cityCode"));
		dmMerchant.setDistrict(Const.getStrValue(params, "districtCode"));
		dmMerchant.setAddress(Const.getStrValue(params, "address"));
		if (!"0".equals(Const.getStrValue(params, "merchantId"))) {
			dmMerchant.setMerchantId(Integer.valueOf(Const.getStrValue(params, "merchantId")));
			dmMerchantMapper.updateByPrimaryKeySelective(dmMerchant);
		} else {
			dmMerchant.setUserId(Integer.valueOf(Const.getStrValue(params, "userId")));
			dmMerchant.setState(Constants.USER_STATE_00X);
			dmMerchantMapper.insertSelective(dmMerchant);
		}
		
		//联系人
		sqlParams.clear();
		sqlParams.put("merchantId", dmMerchant.getMerchantId());
		List<DmContact> contacts = dmContactMapper.searchContacts(sqlParams);
		DmContact dmContact = new DmContact();
		dmContact.setMerchantId(dmMerchant.getMerchantId());
		dmContact.setContactName(Const.getStrValue(params, "contactName"));
		if (contacts.size() > 0) {
			dmContactMapper.updateByMerchantId(dmContact);
		} else {
			dmContactMapper.insertSelective(dmContact);
		}

		return true;
	}
	
	@Transactional
	public Map modifyLogonName(Map params) {
		Map result = checkPasswd(params);
		if (!"0".equals(Const.getStrValue(result, "flag"))) {
			return result;
		}
		
		Map sqlParams = new HashMap();
		sqlParams.put("userId", Const.getStrValue(params, "userId"));
		sqlParams.put("logonName", Const.getStrValue(params, "logonName"));
		sqlParams.put("passwd", PasswordEncoder.encode(Const.getStrValue(params, "passwd"), 
				Const.getStrValue(params, "logonName")));
		dmUserMapper.updateUser(sqlParams);
		return result;
	}
	
	@Transactional
	public Map modifyEmail(Map params) {
		Map result = checkPasswd(params);
		if (!"0".equals(Const.getStrValue(result, "flag"))) {
			return result;
		}
		Map sqlParams = new HashMap();
		sqlParams.put("userId", Const.getStrValue(params, "userId"));
		sqlParams.put("email", Const.getStrValue(params, "email"));
		dmUserMapper.updateUser(sqlParams);
		return result;
	}
	
	public Map checkPasswd(Map params) {
		Map result = new HashMap();
		Map sqlParams = new HashMap();
		sqlParams.put("userId", Const.getStrValue(params, "userId"));
		List<DmUser> users = dmUserMapper.searchUser(sqlParams);
		if (users.size() == 0) {
			result.put("flag", "1");
			result.put("reason", "请重新登录");
			return result;
		}
		DmUser user = users.get(0);
		boolean validFlag = PasswordEncoder.validate(Const.getStrValue(params,
				"passwd"), user.getLogonName().toString(), user.getPasswd());
		if (!validFlag) {
			result.put("flag", "2");
			result.put("reason", "密码错误，请重新输入！");
			return result;
		}
		result.put("flag", "0");
		return result;
	}
}
