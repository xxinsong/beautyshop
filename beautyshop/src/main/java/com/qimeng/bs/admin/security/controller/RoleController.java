package com.qimeng.bs.admin.security.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.qimeng.bs.login.bean.AdminLoginInfo;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;

import com.qimeng.common.Page;
import com.qimeng.bs.admin.security.bean.DmPrivilege;
import com.qimeng.bs.admin.security.bean.DmRole;
import com.qimeng.bs.admin.security.bean.DmRole;
import com.qimeng.bs.admin.security.service.DmRoleService;
import com.qimeng.bs.common.controller.GenericController;
import com.qimeng.bs.login.bean.LoginInfo;

@Controller
@RemoteProxy
@SuppressWarnings("unchecked")
public class RoleController extends GenericController {

    @Autowired
    private DmRoleService dmRoleService;

    /**
     * 获取与员工绑定的权限实例集合
     *
     * @return
     */
    @RemoteMethod
    public List<DmRole> queryRolesOnStaff(DmRole dmrole) {
        Assert.isTrue(dmrole.getStaffId() != -1, "please offer the staffId~");
        List<DmRole> ret = dmRoleService.query(dmrole);
        return ret;
    }

    @RemoteMethod
    public Page queryPage(Map params, int pageIndex, int pageSize) {
        Page<DmRole> page = new Page<DmRole>(pageIndex, pageSize);
        page.setParams(params);
        page = dmRoleService.queryPage(page);
        return page;
    }

    @RemoteMethod
    public Map<String, Object> addAction(DmRole role) {
        Map<String, Object> ret = new HashMap<String, Object>();
        ret.put("success", true);
        ret.put("msg", "添加成功");
        AdminLoginInfo loginInfo = getCurrentLoginAdmin();
        if (loginInfo != null && loginInfo.getStaffId() != 0) {
            role.setCreateOperId(loginInfo.getStaffId());
        }
        dmRoleService.save(role);
        return ret;
    }

    @RemoteMethod
    public Map<String, Object> updateAction(DmRole role) {
        Map<String, Object> ret = new HashMap<String, Object>();
        ret.put("success", true);
        ret.put("msg", "更新成功");
        dmRoleService.update(role);
        return ret;
    }

    @RemoteMethod
    public Map<String, Object> deleteAction(DmRole role) {
        Map<String, Object> ret = new HashMap<String, Object>();
        ret.put("success", true);
        ret.put("msg", "删除成功");
        dmRoleService.delete(role);
        return ret;
    }

    @RemoteMethod
    public Map<String, Object> attachPrivilege(DmRole role) {
        Map<String, Object> ret = new HashMap<String, Object>();
        ret.put("success", true);
        ret.put("msg", "修改成功");
        dmRoleService.attachPrivilege(role);
        return ret;
    }
}
