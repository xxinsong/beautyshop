package com.qimeng.bs.admin.security.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.qimeng.bs.admin.security.bean.DmOrganization;
import com.qimeng.bs.admin.security.dao.DmOrganizationMapper;
import com.qimeng.bs.admin.security.dao.DmStaffMapper;

@Service
public class DmOrganizationService {
	@Autowired
	public DmOrganizationMapper dmOrganizationMapper ;
	@Autowired
	public DmStaffMapper dmstaffMapper ;
	
	public List<DmOrganization> query(DmOrganization dmOrganization){
		 List<DmOrganization> ret = dmOrganizationMapper.findOrgs(dmOrganization);
		 return ret;
	}
	
	@Transactional
	public int save(DmOrganization org){
		 dmOrganizationMapper.insert(org);
		 DmOrganization updateOrg = new DmOrganization();
		 updateOrg.setOrgId(org.getOrgId());
		 if(-1==org.getParentOrgId()){
			 updateOrg.setPathCode(org.getOrgId()+"");
			 updateOrg.setPathName(org.getOrgName());
		 }else{
			 DmOrganization parentOrg = dmOrganizationMapper.selectByPrimaryKey(org.getParentOrgId());
			 updateOrg.setPathCode(parentOrg.getPathCode()+"."+org.getOrgId());
			 updateOrg.setPathName(parentOrg.getPathName()+"."+org.getOrgName());
		 }
		 return dmOrganizationMapper.updateByPrimaryKeySelective(updateOrg);
	}
	
	/**
	 * 更新组织,级联更新组织路径
	 * @param org
	 * @return
	 */
	@Transactional
	public int update(DmOrganization org){
		List<DmOrganization> list = dmOrganizationMapper.findOrgs(getChildrenCond(org));
		reflsehPath(org);
		for(DmOrganization subDmOrganization: list){
			DmOrganization lazyOrg = new DmOrganization();
			lazyOrg.setPathName(org.getPathName()+"."+subDmOrganization.getOrgName());
			lazyOrg.setPathCode(org.getPathCode()+"."+subDmOrganization.getOrgCode());
//			lazyOrg.setOrgCode(subDmOrganization.getOrgCode());
			lazyOrg.setOrgName(subDmOrganization.getOrgName());
			lazyOrg.setOrgId(subDmOrganization.getOrgId());
			update(lazyOrg);
		}
		return dmOrganizationMapper.updateByPrimaryKeySelective(org);
	}
	
	/**
	 * 级联删除
	 * @param org
	 * @return
	 */
	@Transactional
	public int delete(DmOrganization org){
		/*List<DmOrganization> list = dmOrganizationMapper.findOrgs(getChildrenCond(org));
		for(DmOrganization subDmOrganization: list){
			delete(subDmOrganization);
		}*/
		dmstaffMapper.unattachOrg(org.getOrgId());
		return dmOrganizationMapper.deleteByPrimaryKey(org.getOrgId());
	}
	
	private void reflsehPath(DmOrganization org) {
		int tailDotIndex = org.getPathName().lastIndexOf(".");
		String parentPathName = "";
		String parentPathCode = "";
		if (tailDotIndex != -1){
			parentPathName = org.getPathName().substring(0, tailDotIndex);
			org.setPathName(parentPathName + "." + org.getOrgName());// 设置更改后的路径树名称
		}else{
			org.setPathName(org.getOrgName());
		}
		tailDotIndex = org.getPathCode().lastIndexOf(".");
		if (tailDotIndex != -1){
			parentPathCode = org.getPathCode().substring(0, tailDotIndex);
			org.setPathCode(parentPathCode + "." + org.getOrgId());// 设置更改后的路径树编码
		}else{
			org.setPathCode(org.getOrgId()+"");
		}
	}
	
	private DmOrganization getChildrenCond(DmOrganization org){
		DmOrganization deleteCond = new DmOrganization();
		deleteCond.setParentOrgId(
				org.getOrgId()==null?-9999:org.getOrgId());
		return deleteCond;
	}
	
}
