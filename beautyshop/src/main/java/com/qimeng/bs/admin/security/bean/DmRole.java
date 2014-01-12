package com.qimeng.bs.admin.security.bean;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.directwebremoting.annotations.DataTransferObject;
@DataTransferObject
public class DmRole {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_role.ROLE_ID
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    private Integer roleId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_role.ROLE_NAME
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    private String roleName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_role.ROLE_DESC
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    private String roleDesc;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_role.CREATE_DATE
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    private Date createDate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_role.STATE
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    private String state;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_role.STATE_DATE
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    private Date stateDate;
    
    private Set<DmPrivilege> privileges = new HashSet<DmPrivilege>();

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_role.CREATE_OPER_ID
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    private Integer createOperId;
    
    private String checked;
    
    private Integer staffId = -1;//实例数据--当前实例角色与实例员工绑定

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_role.ROLE_ID
     *
     * @return the value of dm_role.ROLE_ID
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    public Integer getRoleId() {
        return roleId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_role.ROLE_ID
     *
     * @param roleId the value for dm_role.ROLE_ID
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_role.ROLE_NAME
     *
     * @return the value of dm_role.ROLE_NAME
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    public String getRoleName() {
        return roleName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_role.ROLE_NAME
     *
     * @param roleName the value for dm_role.ROLE_NAME
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_role.ROLE_DESC
     *
     * @return the value of dm_role.ROLE_DESC
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    public String getRoleDesc() {
        return roleDesc;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_role.ROLE_DESC
     *
     * @param roleDesc the value for dm_role.ROLE_DESC
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    public void setRoleDesc(String roleDesc) {
        this.roleDesc = roleDesc;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_role.CREATE_DATE
     *
     * @return the value of dm_role.CREATE_DATE
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_role.CREATE_DATE
     *
     * @param createDate the value for dm_role.CREATE_DATE
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_role.STATE
     *
     * @return the value of dm_role.STATE
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    public String getState() {
        return state;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_role.STATE
     *
     * @param state the value for dm_role.STATE
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    public void setState(String state) {
        this.state = state;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_role.STATE_DATE
     *
     * @return the value of dm_role.STATE_DATE
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    public Date getStateDate() {
        return stateDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_role.STATE_DATE
     *
     * @param stateDate the value for dm_role.STATE_DATE
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    public void setStateDate(Date stateDate) {
        this.stateDate = stateDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_role.CREATE_OPER_ID
     *
     * @return the value of dm_role.CREATE_OPER_ID
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    public Integer getCreateOperId() {
        return createOperId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_role.CREATE_OPER_ID
     *
     * @param createOperId the value for dm_role.CREATE_OPER_ID
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    public void setCreateOperId(Integer createOperId) {
        this.createOperId = createOperId;
    }

	public Set<DmPrivilege> getPrivileges() {
		return privileges;
	}

	public void setPrivileges(Set<DmPrivilege> privileges) {
		this.privileges = privileges;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((roleId == null) ? 0 : roleId.hashCode());
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
		DmRole other = (DmRole) obj;
		if (roleId == null) {
			if (other.roleId != null)
				return false;
		} else if (!roleId.equals(other.roleId))
			return false;
		return true;
	}

	public Integer getStaffId() {
		return staffId;
	}

	public void setStaffId(Integer staffId) {
		this.staffId = staffId;
	}

	public String getChecked() {
		if(staffId!=null&&staffId!=-1){
			setChecked("true");
		}else{
			setChecked("false");
		}
        return checked;
	}

	public void setChecked(String checked) {
		this.checked = checked;
	}
}