package com.qimeng.bs.admin.security.bean;

import java.util.HashSet;
import java.util.Set;

import org.directwebremoting.annotations.DataTransferObject;

@DataTransferObject
public class DmPrivilege {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_privilege.PRIVILEGE_ID
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    private Integer privilegeId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_privilege.MENU_ID
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    private Integer menuId;

    private String menuName;
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_privilege.PRIVILEGE_NAME
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    private String privilegeName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_privilege.TYPE
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    private String type;
    
    private Integer parentPrivilegeId;
    private DmPrivilege parentPrivilege;
    
    private Set<DmPrivilege> ChildrenPrivileges = new HashSet<DmPrivilege>();

    private String isLeaf;//0-否，1-真
    
    /*****************实例字段**************************************************************/
    private Integer staffId = -1;//实例数据--当前权限实例属于staffId实例员工
   
    private Integer roleId = -1;//实例数据
    
    private String checked;
    
    @Deprecated
    private Boolean isParent;//非数据库字段--配合jquery插件ztree
    
    private String state;//实例数据--配合easyui的treegrid组件 open标识叶子节点，closed标识非叶子节点
   
    /*****************实例字段**************************************************************/
    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_privilege.PRIVILEGE_ID
     *
     * @return the value of dm_privilege.PRIVILEGE_ID
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    public Integer getPrivilegeId() {
        return privilegeId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_privilege.PRIVILEGE_ID
     *
     * @param privilegeId the value for dm_privilege.PRIVILEGE_ID
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    public void setPrivilegeId(Integer privilegeId) {
        this.privilegeId = privilegeId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_privilege.MENU_ID
     *
     * @return the value of dm_privilege.MENU_ID
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    public Integer getMenuId() {
        return menuId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_privilege.MENU_ID
     *
     * @param menuId the value for dm_privilege.MENU_ID
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_privilege.PRIVILEGE_NAME
     *
     * @return the value of dm_privilege.PRIVILEGE_NAME
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    public String getPrivilegeName() {
        return privilegeName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_privilege.PRIVILEGE_NAME
     *
     * @param privilegeName the value for dm_privilege.PRIVILEGE_NAME
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    public void setPrivilegeName(String privilegeName) {
        this.privilegeName = privilegeName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_privilege.TYPE
     *
     * @return the value of dm_privilege.TYPE
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    public String getType() {
        return type;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_privilege.TYPE
     *
     * @param type the value for dm_privilege.TYPE
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    public void setType(String type) {
        this.type = type;
    }

	public DmPrivilege getParentPrivilege() {
		return parentPrivilege;
	}

	public void setParentPrivilege(DmPrivilege parentPrivilege) {
		this.parentPrivilege = parentPrivilege;
	}

	public Set<DmPrivilege> getChildrenPrivileges() {
		return ChildrenPrivileges;
	}

	public void setChildrenPrivileges(Set<DmPrivilege> ChildrenPrivileges) {
		this.ChildrenPrivileges = ChildrenPrivileges;
	}

	public String getIsLeaf() {
		return isLeaf;
	}

	public void setIsLeaf(String isLeaf) {
		this.isLeaf = isLeaf;
	}

	public Integer getParentPrivilegeId() {
		return parentPrivilegeId;
	}

	public void setParentPrivilegeId(Integer parentPrivilegeId) {
		this.parentPrivilegeId = parentPrivilegeId;
	}

	 @Deprecated
	public Boolean getIsParent() {
		return "0".equals(getIsLeaf())?true:false;
	}
	 @Deprecated
	public void setIsParent(Boolean isParent) {
		this.isParent = isParent;
	}

	public String getState() {
		return "0".equals(getIsLeaf())?"closed":"open";
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getChecked() {
		if((roleId!=-1)||(staffId!=-1)){
			setChecked("true");
		}else{
			setChecked("false");
		}
        return checked;
	}

	public void setChecked(String checked) {
		this.checked = checked;
	}

	public Integer getStaffId() {
		return staffId;
	}

	public void setStaffId(Integer staffId) {
		this.staffId = staffId;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((privilegeId == null) ? 0 : privilegeId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		DmPrivilege other = (DmPrivilege) obj;
		if (privilegeId == null) {
			if (other.privilegeId != null)
				return false;
		} else if (!privilegeId.equals(other.privilegeId))
			return false;
		return true;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

}