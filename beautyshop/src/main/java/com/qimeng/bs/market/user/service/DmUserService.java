package com.qimeng.bs.market.user.service;

import com.qimeng.bs.admin.merchant.bean.DmContact;
import com.qimeng.bs.admin.merchant.bean.DmMerchant;
import com.qimeng.bs.admin.merchant.dao.DmContactMapper;
import com.qimeng.bs.admin.merchant.dao.DmMerchantMapper;
import com.qimeng.bs.common.service.DcSystemConfigService;
import com.qimeng.bs.market.order.dao.DmCustOrderMapper;
import com.qimeng.bs.market.point.bean.DmPoints;
import com.qimeng.bs.market.point.dao.DmPointsMapper;
import com.qimeng.bs.market.user.bean.DmUser;
import com.qimeng.bs.market.user.bean.ReferrerInfo;
import com.qimeng.bs.market.user.dao.DmUserMapper;
import com.qimeng.bs.market.user.dao.ReferrerInfoMapper;
import com.qimeng.common.Constants;
import com.qimeng.common.Page;
import com.qimeng.common.tools.Const;
import com.qimeng.common.tools.DateFormatUtils;
import com.qimeng.common.tools.PKUtils;
import com.qimeng.common.tools.PasswordEncoder;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.PostConstruct;
import java.util.*;

@Service
@SuppressWarnings("unchecked")
public class DmUserService {
    @Autowired
    private DmUserMapper dmUserMapper;

    @Autowired
    private DmPointsMapper dmPointsMapper;

    @Autowired
    private DmMerchantMapper dmMerchantMapper;

    @Autowired
    private DmContactMapper dmContactMapper;

//    @Autowired
//    private DmMerchantActivityMapper dmMerchantActivityMapper;

    @Autowired
    private DmCustOrderMapper dmCustOrderMapper;

    @Autowired
    DcSystemConfigService systemConfigService;

    @Autowired
    private ReferrerInfoMapper referrerInfoMapper;
	
	public List<DmUser> searchUser(Map params) {
		return dmUserMapper.searchUser(params);
	}
    private int maxPresentee;

    @PostConstruct
    void initSystemParam(){
        try {
            String param = systemConfigService.getSystemParamValue("USER_MAX_PRESENTEE");
            maxPresentee = Integer.valueOf(param);
        }catch(Throwable e){
            maxPresentee = 10;
        }
    }

	@Transactional
	public Map insertUser(Map params) {
		Map result = new HashMap(); 
//		String s_verificCode = Const.getStrValue(params, "s_verificCode");
//		String verificCode = Const.getStrValue(params, "verificCode");
	
		//是否存在相同的登录名
		Map sqlParams = new HashMap();
		sqlParams.put("logonName", Const.getStrValue(params, "logon_name"));
		sqlParams.put("userName", Const.getStrValue(params, "user_name"));
		List<DmUser> dmUsers = dmUserMapper.searchUser(sqlParams);
		if (dmUsers.size() > 0) {
			result.put("flag", 1);
			result.put("reason", "已存在的登录名！");
			return result;
		}
		
		//验证码是否一致
		/*if (!StringUtils.equals(s_verificCode, verificCode)) {
			result.put("flag", 2);
			return result;
		}
		*/
        String referrerMobileNo = MapUtils.getString(params, "referrerMobileNo");
        DmUser referrerUser = null;
        if(StringUtils.isNotEmpty(referrerMobileNo)){
            referrerUser = dmUserMapper.selectByLogonName(referrerMobileNo);
            if(referrerUser==null){
                result.put("flag",3);
                result.put("reason", "推荐人不存在！");
                return result;
            }else if(referrerUser.getUserId()!=-1){
                int count = dmCustOrderMapper.countDealOrderByUserId(referrerUser.getUserId());
                if (count <= 0) {
                    result.put("flag",4);
                    result.put("reason", "推荐人没有支付过订单，不符合推荐人资格！");
                    return result;
                }
            }

        }
		sqlParams.put("passwd", PasswordEncoder.encode(Const.getStrValue(params, "passwd"), 
				Const.getStrValue(params, "logon_name")));
		sqlParams.put("state", Constants.USER_STATE_00A);
		sqlParams.put("level", 1);
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

        if(referrerUser!=null){
            referrerUser = addReferrerInfo(referrerUser.getUserId(),userId);
            if(referrerUser!=null){
                sqlParams.put("level", referrerUser.getLevel() + 1);
                dmUserMapper.updateUser(sqlParams);
            }
        }

		return result;
	}

    private DmUser addReferrerInfo(Integer referrerId, int presenteeId) {
        List<ReferrerInfo> presenteeList = referrerInfoMapper.findPresentee(referrerId);
        int size = presenteeList.size();

        if(size >= maxPresentee && -1!=referrerId.intValue()) {
            int currIndex = 0;
            for (ReferrerInfo info : presenteeList) {
                currIndex++;
                List<ReferrerInfo> lowerLevelList = referrerInfoMapper.findPresentee(info.getPresenteeId());
                if(lowerLevelList.size()< maxPresentee){
                    return addReferrerInfo(info.getPresenteeId(),presenteeId);
                }else{
                    if(currIndex<size){
                        continue;
                    }else{
                        Random ran = new Random();
                        int index = ran.nextInt(size);
                        return addReferrerInfo(presenteeList.get(index).getPresenteeId(),presenteeId);
                    }
                }
            }
        }else{
            ReferrerInfo referrerInfo = new ReferrerInfo();
            referrerInfo.setReferrerId(referrerId);
            referrerInfo.setPresenteeId(presenteeId);
            referrerInfo.setCreateTime(new Date());
            referrerInfoMapper.insert(referrerInfo);
            return dmUserMapper.selectByPrimaryKey(referrerId);
        }
        return null;
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
//		sqlParams.put("userId", MapUtils.getString(params, "userId"));
//		sqlParams.put("userName", MapUtils.getString(params, "userName"));
//		dmUserMapper.updateUser(sqlParams);
		
		//商户
		DmMerchant dmMerchant = new DmMerchant();
		dmMerchant.setMerchantName(MapUtils.getString(params, "merchantName"));
		dmMerchant.setGender(MapUtils.getString(params, "gender"));
        dmMerchant.setLegalCertType(MapUtils.getString(params,"cardType"));
		dmMerchant.setLegalCertNo(MapUtils.getString(params, "cardNo"));
		dmMerchant.setProvince(MapUtils.getString(params, "provinceCode"));
		dmMerchant.setCity(MapUtils.getString(params, "cityCode"));
		dmMerchant.setDistrict(MapUtils.getString(params, "districtCode"));
		dmMerchant.setAddress(MapUtils.getString(params, "address"));
//        dmMerchant.setLegalCertNo(Const.getStrValue(params,"legalCertNo"));
		if (!"0".equals(MapUtils.getString(params, "merchantId"))) {
			dmMerchant.setMerchantId(Integer.valueOf(MapUtils.getString(params, "merchantId")));
			dmMerchantMapper.updateByPrimaryKeySelective(dmMerchant);
		} else {
			dmMerchant.setUserId(Integer.valueOf(MapUtils.getString(params, "userId")));
			dmMerchant.setState(Constants.USER_STATE_00X);
			dmMerchantMapper.insertSelective(dmMerchant);
		}
		
		//联系人
		/*sqlParams.clear();
		sqlParams.put("merchantId", dmMerchant.getMerchantId());
		List<DmContact> contacts = dmContactMapper.searchContacts(sqlParams);
		DmContact dmContact = new DmContact();
		dmContact.setMerchantId(dmMerchant.getMerchantId());
		dmContact.setContactName(MapUtils.getString(params, "contactName"));
		if (contacts.size() > 0) {
			dmContactMapper.updateByMerchantId(dmContact);
		} else {
			dmContactMapper.insertSelective(dmContact);
		}*/

		return true;
	}
    @Transactional
    public boolean modifyCardInfo(Map params) {
        DmMerchant dmMerchant = new DmMerchant();
        dmMerchant.setMerchantId(MapUtils.getInteger(params, "merchantId"));
        dmMerchant.setMerchantName(MapUtils.getString(params, "merchantName"));
        dmMerchant.setLegalCertType(MapUtils.getString(params,"cardType"));
        dmMerchant.setLegalCertNo(MapUtils.getString(params, "cardNo"));
        dmMerchantMapper.updateByPrimaryKeySelective(dmMerchant);
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

    public int queryMyEffPoint(Integer userId){
        int point = 0;
        DmPoints points = dmPointsMapper.selectPointsByUserId(userId);
        if (points != null) {
            point = points.getRemainderPoints();
        }
        return point;
    }

   /* public int queryUserActivity(Integer merchantId){
        Integer ret = dmMerchantActivityMapper.selectActivityByMerchantId(merchantId);
        return ret;
    }*/

    public int queryBePaid(Integer merchantId) {
        Integer ret = dmCustOrderMapper.selectBePaidByMerchantId(merchantId);
        return ret;
    }
    public int queryDeliver(Integer merchantId) {
        Integer ret = dmCustOrderMapper.selectDeliverByMerchantId(merchantId);
        return ret;
    }

    //下面涉及的是安全设置
    @SuppressWarnings("rawtypes")
    public List getUserSecurity(Map param) {
        List<DmUser> list = dmUserMapper.searchUser(param);
        return list;
    }

    @Transactional
    @SuppressWarnings("rawtypes")
    public Map updateUserReg(Map params) {
        Map result = new HashMap();
        String s_yzCode = Const.getStrValue(params, "s_yzCode");
        String insertType=Const.getStrValue(params, "type");
        String emailCode = Const.getStrValue(params, insertType);
        if (!StringUtils.equals(s_yzCode, emailCode)) {
            result.put("flag", 1);
            return result;
        }
        Map sqlParams = new HashMap();
        String userId = Const.getStrValue(params, "userId");
        sqlParams.put("userId", userId);
        if (insertType.equals("email_yz")) {
            sqlParams.put("email", Const.getStrValue(params, "email_new"));
        }
        if (insertType.equals("pass_yz")) {
            DmUser dmUser = dmUserMapper.selectByPrimaryKey(Integer.valueOf(userId));
            boolean validFlag = PasswordEncoder.validate(Const.getStrValue(params,"pass_old"),Const.getStrValue(params,"logonName"), dmUser.getPasswd());
            if (!validFlag) {
                result.put("flag", 3);
                return result;
            }
            sqlParams.put("passwd", PasswordEncoder.encode(Const.getStrValue(params, "pass_new"), Const.getStrValue(params, "logonName")));
        }
        if(insertType.equals("ques_yz")){
            sqlParams.put("passwdQuestion", Const.getStrValue(params, "pass_ques_new"));
            sqlParams.put("passwdAnswer", Const.getStrValue(params, "pass_answ_new"));
        }
        int i=dmUserMapper.updateUser(sqlParams);
        if (i > 0) {
            result.put("flag", 0);
            return result;
        }else{
            result.put("flag", 2);
            return result;
        }
    }

    public Page queryAllUsers(Map params, int pageIndex, int pageSize) {
        Page page = new Page(pageIndex, pageSize);
        page.setParams(params);
        List<Map> list = dmUserMapper.queryAllUsers(page);
        page.setRows(list);
        return page;
    }

    public Page queryUsersByReferrer(Map params, int pageIndex, int pageSize) {
        Page page = new Page(pageIndex, pageSize);
        page.setParams(params);
        List<Map> list = dmUserMapper.queryUsersByReferrer(page);
        page.setRows(list);
        return page;
    }


}
