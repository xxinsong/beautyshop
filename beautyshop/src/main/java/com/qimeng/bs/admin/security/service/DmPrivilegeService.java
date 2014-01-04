package com.qimeng.bs.admin.security.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qimeng.bs.admin.security.bean.DmPrivilege;
import com.qimeng.bs.admin.security.dao.DmPrivilegeMapper;

@Service
public class DmPrivilegeService {
	@Autowired
	public DmPrivilegeMapper dmPrivilegeMapper ;
	
	public List<DmPrivilege> query(DmPrivilege dmPrivilege){
		return dmPrivilegeMapper.findPrivileges(dmPrivilege);
	}
	
	@Transactional
	public int save(DmPrivilege pri){
		return dmPrivilegeMapper.insert(pri);
	}
	
	@Transactional
	public int update(DmPrivilege pri){
		return dmPrivilegeMapper.updateByPrimaryKeySelective(pri);
	}
	
	/**
	 * 级联删除
	 * @param pri
	 * @return
	 */
	@Transactional
	public int delete(DmPrivilege pri){
		List<DmPrivilege> list = dmPrivilegeMapper.findPrivileges(getChildrenCond(pri));
		for(DmPrivilege subDmPrivilege: list){
			delete(subDmPrivilege);
		}
		dmPrivilegeMapper.deleteStaffRelationById(pri.getPrivilegeId());
		dmPrivilegeMapper.deleteRoleRelationById(pri.getPrivilegeId());
		return dmPrivilegeMapper.deleteByPrimaryKey(pri.getPrivilegeId());
	}
	
	private DmPrivilege getChildrenCond(DmPrivilege pri){
		DmPrivilege deleteCond = new DmPrivilege();
		deleteCond.setParentPrivilegeId(
				pri.getPrivilegeId()==null?-9999:pri.getPrivilegeId());
		return deleteCond;
	}
	
}
