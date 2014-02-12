package com.qimeng.bs.market.user.dao;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import com.qimeng.bs.market.user.bean.DmUser;

@Repository
@SuppressWarnings("unchecked")
public interface DmUserMapper {
	int deleteByPrimaryKey(Integer userId);

	int insert(DmUser record);

	int insertSelective(DmUser record);

	DmUser selectByPrimaryKey(Integer userId);

	int updateByPrimaryKeySelective(DmUser record);

	int updateByPrimaryKey(DmUser record);

	int insertUser(Map params);

	int updateUser(Map params);

	List<DmUser> searchUser(Map params);

    DmUser selectByLogonName(String logonName);
}