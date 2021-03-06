package com.qimeng.bs.admin.security.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qimeng.common.Page;
import com.qimeng.bs.admin.security.bean.DmPrivilege;
@Repository
public interface DmPrivilegeMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_privilege
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    int deleteByPrimaryKey(Integer privilegeId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_privilege
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    int insert(DmPrivilege record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_privilege
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    int insertSelective(DmPrivilege record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_privilege
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    DmPrivilege selectByPrimaryKey(Integer privilegeId);
    
    List<DmPrivilege> findAllPrivileges(Page page);
    
    List<DmPrivilege> findPrivileges(Object params);
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_privilege
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    int updateByPrimaryKeySelective(DmPrivilege record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_privilege
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    int updateByPrimaryKey(DmPrivilege record);
    
    void deleteStaffRelationById(Integer privilegeId);
    
    void deleteRoleRelationById(Integer privilegeId);
    
    List<DmPrivilege> searchStaffPrivs(Integer staffId);
}