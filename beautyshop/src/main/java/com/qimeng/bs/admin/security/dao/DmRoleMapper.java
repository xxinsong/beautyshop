package com.qimeng.bs.admin.security.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qimeng.common.Page;
import com.qimeng.bs.admin.security.bean.DmRole;
@Repository
public interface DmRoleMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_role
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    int deleteByPrimaryKey(Integer roleId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_role
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    int insert(DmRole record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_role
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    int insertSelective(DmRole record);

    int attachPrivileges(DmRole record);
    int unattachPrivileges(Integer roleId);
    int unattachStaffs(Integer roleId);
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_role
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    DmRole selectByPrimaryKey(Integer roleId);
    DmRole selectEagerByPrimaryKey(Integer roleId);
//    DmRole selectWithPrivilegesById(Integer roleId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_role
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    int updateByPrimaryKeySelective(DmRole record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_role
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    int updateByPrimaryKey(DmRole record);
    
    List<DmRole> findAllRoles(Page<DmRole> page);
    List<DmRole> findRoles(Object params);
    
}