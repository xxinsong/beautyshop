package com.qimeng.bs.admin.security.service;


import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qimeng.common.Page;
import com.qimeng.bs.admin.security.bean.DmPrivilege;
import com.qimeng.bs.admin.security.bean.DmRole;
import com.qimeng.bs.admin.security.bean.DmStaff;
import com.qimeng.bs.admin.security.dao.DmStaffMapper;
import com.qimeng.bs.common.service.DcSystemConfigService;

@Service
@SuppressWarnings("unchecked")
public class DmStaffService {
	
	@Autowired
	public DmStaffMapper dmstaffMapper ;
	
	@Autowired 
	private DcSystemConfigService dcSystemConfigService;
	
	public Page<DmStaff> queryPage(Page<DmStaff> page){
		List<DmStaff> rows = dmstaffMapper.findAllStaffs(page);
		page.setRows(rows);
		return page;
	}
	
	@Transactional
	public int save(DmStaff staff){
		int rows = dmstaffMapper.insert(staff.encodePassword());
		return rows;
	}
	
	@Transactional
	public int update(DmStaff staff){
		DmStaff dbStaff = dmstaffMapper.selectByPrimaryKey(staff.getStaffId());
		if(staff.getPassword().equals(dbStaff.getPassword())){
			staff.setPassword(null);
		}else{
			staff.encodePassword();
		}
		return dmstaffMapper.updateByPrimaryKeySelective(staff);
	}
	
	@Transactional
	public int delete(DmStaff staff){
		 Integer staffId = staff.getStaffId();
		 dmstaffMapper.unattachPrivileges(staffId);
		 dmstaffMapper.unattachRoles(staffId);
		 return dmstaffMapper.deleteByPrimaryKey(staffId);
	}
	
	@Transactional
	public void attachPrivilege(DmStaff staff){
		DmStaff dmStaff = dmstaffMapper.selectEagerByPrimaryKey(staff.getStaffId());
	    Set<DmPrivilege> theOldPrivileges = dmStaff.getPrivileges();
	    Set<DmPrivilege> theNewPrivileges = staff.getPrivileges();
	    Set<DmPrivilege> theCheckedPrivileges = new HashSet<DmPrivilege>();
	    for(DmPrivilege privilege:theNewPrivileges){
	    	if("true".equals(privilege.getChecked())){
	    		theCheckedPrivileges.add(privilege);
	    	}
	    }
	    theOldPrivileges.removeAll(theNewPrivileges);
	    theOldPrivileges.addAll(theCheckedPrivileges);
	    dmstaffMapper.unattachPrivileges(staff.getStaffId());
	    dmStaff.setPrivileges(theOldPrivileges);
	    if(!dmStaff.getPrivileges().isEmpty())
	    dmstaffMapper.attachPrivileges(dmStaff);
	}
	
	@Transactional
	public void attachRole(DmStaff staff){
		/*DmStaff dmStaff = dmstaffMapper.selectEagerByPrimaryKey(staff.getStaffId());
	    Set<DmRole> theOldRoles = dmStaff.getRoles();
	    Set<DmRole> theNewRoles = staff.getRoles();
	    Set<DmRole> theCheckedRoles = new HashSet<DmRole>();
	    for(DmRole privilege:theNewRoles){
	    	if("true".equals(privilege.getChecked())){
	    		theCheckedRoles.add(privilege);
	    	}
	    }
	    theOldRoles.removeAll(theNewRoles);
	    theOldRoles.addAll(theCheckedRoles);*/
	    dmstaffMapper.unattachRoles(staff.getStaffId());
//	    dmStaff.setRoles(theOldRoles);
	    if(!staff.getRoles().isEmpty())
	    dmstaffMapper.attachRoles(staff);
	}
	
	public boolean isAdmin(int staffId) {
		String ADMIN_ROLE_ID = dcSystemConfigService.getSystemParamValue("ADMIN_ROLE_ID");
		if (StringUtils.isEmpty(ADMIN_ROLE_ID)) {
			return false;
		}
		Map params = new HashMap();
		params.put("staffId", staffId);
		params.put("roleId", ADMIN_ROLE_ID);
		return dmstaffMapper.searchStaffRole(params).size() > 0;
	}
	
}
