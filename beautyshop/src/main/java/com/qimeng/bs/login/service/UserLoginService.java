package com.qimeng.bs.login.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.qimeng.common.web.ApplicationContextUtil;
import com.qimeng.bs.common.exception.LoginException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qimeng.common.tools.DateFormatUtils;
import com.qimeng.common.tools.PasswordEncoder;
import com.qimeng.bs.admin.merchant.bean.DmContact;
import com.qimeng.bs.admin.merchant.bean.DmMerchant;
import com.qimeng.bs.admin.merchant.dao.DmContactMapper;
import com.qimeng.bs.admin.merchant.dao.DmMerchantMapper;
import com.qimeng.bs.login.bean.LoginInfo;
import com.qimeng.bs.login.bean.UserLoginRequest;
import com.qimeng.bs.login.bean.UserLoginRespond;
import com.qimeng.bs.market.user.bean.DmUser;
import com.qimeng.bs.market.user.dao.DmUserMapper;

@Service
@SuppressWarnings("unchecked")
public class UserLoginService {

	@Autowired
	private DmUserMapper dmUserMapper;
	
	@Autowired
	private DmMerchantMapper dmMerchantMapper;
	
	@Autowired
	private DmContactMapper dmContactMapper;

	@Transactional
	public UserLoginRespond login(UserLoginRequest loginRequest) {
		UserLoginRespond loginRespond = new UserLoginRespond();
		Map sqlParams = new HashMap();
		sqlParams.put("logonName", loginRequest.getLogonName());
		List<DmUser> dmUsers = dmUserMapper.searchUser(sqlParams);

//        用户不存在直接返回
        if (dmUsers.size() == 0) {
			loginRespond.setSuccess(false);
			loginRespond.setReason(UserLoginRespond.ERROR_USER_NOT_EXISTS);
			return loginRespond;
		}

		DmUser dmUser = dmUsers.get(0);
		loginRespond.setDmUser(dmUser);
//      用户状态不是生效状态，直接返回
		if (!"00A".equals(dmUser.getState())) {
			loginRespond.setSuccess(false);
			if ("00X".equals(dmUser.getState())) {
				loginRespond.setReason(UserLoginRespond.ERROR_USER_INVALID);
			} else if ("00L".equals(dmUser.getState())) {
				loginRespond.setReason(UserLoginRespond.ERROR_USER_LOCKED);
			} else {
				loginRespond.setReason(UserLoginRespond.ERROR_UNKONWN);
			}
			return loginRespond;
		}
//		密码不正确直接返回
		if (!PasswordEncoder.validate(
                loginRequest.getPasswd(), dmUser.getLogonName(),
                dmUser.getPasswd())) {
			loginRespond.setSuccess(false);
			loginRespond.setReason(UserLoginRespond.ERROR_PASSWORD_INCORRECT);
			return loginRespond;
		}

		loginRespond.setSuccess(true);

		return loginRespond;
	}

    public LoginInfo getLoginInfo(DmUser user) {
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.setUserId(user.getUserId());
		loginInfo.setUserName(user.getUserName());
		loginInfo.setLogonName(user.getLogonName());
		loginInfo.setHeadImage(user.getHeadImage());
		loginInfo.setEmail(user.getEmail());
		loginInfo.setLoginTime(DateFormatUtils.getCurrentDate());
		
		Map sqlParams = new HashMap();
		sqlParams.put("userId", user.getUserId());
		DmMerchant merchant = dmMerchantMapper.findMerchantByUserId(user.getUserId());
		if (merchant != null) {
			loginInfo.setMerchantId(merchant.getMerchantId());
			loginInfo.setMerchantCode(merchant.getMerchantCode());
			loginInfo.setMerchantName(merchant.getMerchantName());
			loginInfo.setGender(merchant.getGender());
			loginInfo.setKind(merchant.getKind());
			loginInfo.setLevel(merchant.getLevel());
			loginInfo.setProvinceCode(merchant.getProvince());
			loginInfo.setProvinceName("");
			loginInfo.setCityCode(merchant.getCity());
			loginInfo.setCityName("");
			loginInfo.setDistrictCode(merchant.getDistrict());
			loginInfo.setDistrictName("");
			loginInfo.setAddress(merchant.getAddress());
			loginInfo.setCardType(merchant.getLegalCertType());
			loginInfo.setCardNo(merchant.getLegalCertNo());
		}else{
            throw new LoginException("未能获取到对应的商户信息！");
        }
		sqlParams.clear();
		if (!"".equals(String.valueOf(loginInfo.getMerchantId()))) {
			sqlParams.put("merchantId", loginInfo.getMerchantId());
			List<DmContact> contacts = dmContactMapper.searchContacts(sqlParams);
			if (contacts.size() > 0) {
				DmContact contact = contacts.get(0);
				loginInfo.setContactName(contact.getContactName());
				loginInfo.setContactPhone(contact.getContactPhone());
			}
		}

		return loginInfo;
	}
    
	/**
	 * 刷新登录信息
	 */
	public void refreshLoginInfo(int userId) {
		Map sqlParams = new HashMap();
		sqlParams.put("userId", userId);
		List<DmUser> users = dmUserMapper.searchUser(sqlParams);
		if (users.size() > 0) {
			ApplicationContextUtil.setCurrentLoginUser(getLoginInfo(users.get(0)));
		}
	}
}
