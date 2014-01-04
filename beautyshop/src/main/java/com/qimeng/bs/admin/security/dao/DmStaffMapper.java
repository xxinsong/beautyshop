package com.qimeng.bs.admin.security.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.qimeng.common.Page;
import com.qimeng.bs.admin.security.bean.DmStaff;
@Repository
public interface DmStaffMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_staff
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    int deleteByPrimaryKey(Integer staffId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_staff
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    int insert(DmStaff record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_staff
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    int insertSelective(DmStaff record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_staff
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    DmStaff selectByPrimaryKey(Integer staffId);

    DmStaff selectEagerByPrimaryKey(Integer staffId);
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_staff
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    int updateByPrimaryKeySelective(DmStaff record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_staff
     *
     * @mbggenerated Tue Dec 03 09:53:31 CST 2013
     */
    int updateByPrimaryKey(DmStaff record);
    
    void attachRoles(DmStaff record);
    void attachPrivileges(DmStaff recore);
    void unattachRoles(Integer staffId);
    void unattachPrivileges(Integer staffId);
    void unattachOrg(Integer orgId);
    
    List<DmStaff> findAllStaffs(Page<DmStaff> page);
    List<DmStaff> findStaffs(Object params);
    
    @Select(value="select id from dm_staff_role where staff_id = #{staffId} and role_id = #{roleId}")
    List<Map> searchStaffRole(Map params);
}