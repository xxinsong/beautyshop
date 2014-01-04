<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="library" content="easyui,internet,WdatePicker,zTree" />
		<title></title>
		<script type="text/javascript" src="<%=path%>/public/core/EasyuiZX.js"></script>
		<script type="text/javascript" src="js/menu.js"></script>

	</head>

	<body>
		<div class="formgrid" style="margin-bottom: 10px;">
			<div class="formgrid_title">
				<h2>
					菜单树
				</h2>
			</div>
			<div style="height: 300px;overflow: auto">
				<ul id="menuTree" class="ztree"></ul>
			</div>
		</div>

		<div class="formgrid" id="menu_edit_form">
			<div class="formgrid_title">
				<h2>菜单编辑</h2>
			</div>
			<div style="display: none;">
				<input type="hidden" name="menuId" class="ipttxt" />
			</div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<th>上级菜单：</th>
					<td>
						<input type="hidden" name="parentMenu" class="ipttxt" />
						<input type="text" name="parentMenuName" class="ipttxt" />
					</td>
					<th><label class="ltxtc">*</label>菜单编码：</th>
					<td><input type="text" name="menuCode" class="ipttxt" nullable="false" max_length="40"/></td>
					<th><label class="ltxtc">*</label>菜单名称：</th>
					<td><input type="text" name="menuName" class="ipttxt" nullable="false" max_length="40"/></td>
				</tr>
				<tr>
					<th><label class="ltxtc">*</label>是否叶子节点：</th>
					<td>
						<select name="isLeaf" class="searchipt" nullable="false">
							<option value="1">是</option>
							<option value="0">否</option>
						</select>
					</td>
					<th>菜单说明：</th>
					<td><input type="text" name="menuDesc" class="ipttxt" max_length="400"/></td>
					<th>菜单顺序：</th>
					<td><input type="text" name="menuOrder" class="ipttxt" valid_type="integer"/></td>
				</tr>
				<tr>
					<th>菜单链接：</th>
					<td colspan="5">
						<input type="text" name="url" class="ipttxt" style="width: 92%;" max_length="200"/>
					</td>
				</tr>
			</table>
			<div class="btns">
				<a id="btn_add_root" href="javascript: void(0);" class="resetbtn">添加根菜单</a>
				<a id="btn_add_child" href="javascript: void(0);" class="resetbtn">添加子菜单</a>
				<a id="btn_modify" href="javascript: void(0);" class="resetbtn">修改</a>
				<a id="btn_del" href="javascript: void(0);" class="resetbtn">删除</a>
				<a id="btn_cancel" href="javascript: void(0);" class="resetbtn">取消</a>
				<a id="btn_save" href="javascript: void(0);" class="submitbtn">保存</a>
			</div>
		</div>
	</body>
</html>
