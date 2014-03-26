<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="library" content="easyui,internet,WdatePicker,zTree" />
<title>深圳市韩塑美生物医学科技有限公司是一家化妆品面膜垂直电商为一体的分享平台互联网公司</title>
<script type="text/javascript" src="<%=path%>/public/core/EasyuiZX.js"></script>
<script type="text/javascript" src="<%=path%>/admin/security/js/buttonTools.js"></script>
<script type="text/javascript" src="<%=path%>/admin/security/js/jquery.jqia.dateFormat.js"></script>
<script type="text/javascript" src="js/privilegemanager.js"></script>
</head>

<body>
	<div class="formgrid" style="margin-bottom: 10px;">
		<div class="formgrid_title">
			<h2>权限树</h2>
		</div>
		<div style="height: 300px; overflow: auto">
			<table id="treegrid">
			</table>
		</div>
	</div>

	<div class="formgrid" id="privilege_edit_form">
		<div class="formgrid_title">
			<h2>权限编辑</h2>
		</div>
		<input type="hidden" name="privilegeId" class="ipttxt" />
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<th>上级权限：</th>
				<td>
					<input type="hidden" id="parentPrivilegeId" name="parentPrivilegeId" class="ipttxt" /> <input type="text" id="parentPrivilegeName" readonly="readonly" name="parentPrivilegeName" class="ipttxt" />
				</td>
				<th><label class="ltxtc">*</label>权限类型：</th>
				<td>
					<select name="type" id="type" attr_code="ADMIN_PRIVILEGE_TYPE" class="searchipt" nullable="false">
					</select>
				</td>
				<th><label class="ltxtc">*</label>权限名称：</th>
				<td>
					<input type="text" id="privilegeName" name="privilegeName" class="ipttxt" nullable="false" max_length="20" />
				</td>
			</tr>
			<tr>
				<th><label class="ltxtc">*</label>是否叶子节点：</th>
				<td>
					<select name="isLeaf" class="searchipt" nullable="false">
						<option value="1">是</option>
						<option value="0">否</option>
					</select>
				</td>
				<th id="menuIdTh">关联菜单：</th>
				<td id="menuIdTd">
					<input type="hidden" id="menuId" name="menuId" value="-1" /> <input type="text" id="menuName" name="menuName" readonly="readonly" onClick="selectMenu()" class="ipttxt" />
				</td>
			</tr>
		</table>
		<div class="btns">
			<a id="add_root" action="addAction" href="javascript: void(0);" class="resetbtn">添加根权限</a>
			<a id="add_child" action="addAction" href="javascript: void(0);" class="resetbtn">添加子权限</a>
			<a id="update" action="updateAction" href="javascript: void(0);" class="resetbtn">修改</a>
			<a id="delete" action="deleteAction" href="javascript: void(0);" class="resetbtn">删除</a>
			<a id="cancel" action="" href="javascript: void(0);" class="resetbtn">取消</a>
			<a id="sure" action="sure" href="javascript: void(0);" class="resetbtn">保存</a>
		</div>
	</div>
	<div id="loading" style="background: url(<%=path%>/public/v20/ui/images/loading.gif) #ecf5ff no-repeat;width: 80px;height: 80px;position: absolute;top: 45%;left: 45%;z-index: 3000;filter:alpha(opacity=80);opacity: 0.8;display: none;"></div>
</body>
</html>

