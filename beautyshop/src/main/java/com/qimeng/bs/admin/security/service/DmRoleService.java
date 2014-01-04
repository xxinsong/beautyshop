package com.qimeng.bs.admin.security.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qimeng.common.Page;
import com.qimeng.bs.admin.security.bean.DmPrivilege;
import com.qimeng.bs.admin.security.bean.DmRole;
import com.qimeng.bs.admin.security.dao.DmRoleMapper;

@Service
public class DmRoleService {
	
	@Autowired
	public DmRoleMapper dmroleMapper ;
	
	public List<DmRole> query(DmRole dmrole){
		return dmroleMapper.findRoles(dmrole);
	}
	
	public Page<DmRole> queryPage(Page<DmRole> page){
		List<DmRole> rows = dmroleMapper.findAllRoles(page);
		page.setRows(rows);
		return page;
	}
	
	@Transactional
	public void save(DmRole role){
		dmroleMapper.insert(role);
		/*if(!role.getPrivileges().isEmpty())
		   dmroleMapper.attachPrivileges(role);*/
	}
	
	@Transactional
	public int update(DmRole role){
		return dmroleMapper.updateByPrimaryKeySelective(role);
	}
	
	/**
	 * 级联接触角色关系数据--权限,员工
	 * @param role
	 * @return
	 */
	@Transactional
	public int delete(DmRole role){
		Integer roleId = role.getRoleId();
		dmroleMapper.unattachPrivileges(roleId);
		dmroleMapper.unattachStaffs(roleId);
		return dmroleMapper.deleteByPrimaryKey(roleId);
	}
	
	
	/**
	 * 重新绑定权限关系
	 * @param role
	 */
	@Transactional
	public void attachPrivilege(DmRole role){
		DmRole dmRole = dmroleMapper.selectEagerByPrimaryKey(role.getRoleId());
	    Set<DmPrivilege> theOldPrivileges = dmRole.getPrivileges();
	    Set<DmPrivilege> theNewPrivileges = role.getPrivileges();//前台界面展示的所有权限
	    Set<DmPrivilege> theCheckedPrivileges = new HashSet<DmPrivilege>();//前台勾选的权限
	    for(DmPrivilege privilege:theNewPrivileges){
	    	if("true".equals(privilege.getChecked())){
	    		theCheckedPrivileges.add(privilege);
	    	}
	    }
	    //step1:先把前台展示的所有权限remove
	    theOldPrivileges.removeAll(theNewPrivileges);
	    //step2:再把前台勾选的所有权限add进去
	    theOldPrivileges.addAll(theCheckedPrivileges);
	    //step3:解除当前角色的所有权限,然后把最新的权限关系persist
	    dmroleMapper.unattachPrivileges(role.getRoleId());
	    dmRole.setPrivileges(theOldPrivileges);
	    if(!dmRole.getPrivileges().isEmpty())
	    dmroleMapper.attachPrivileges(dmRole);
	}
}
