<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="library" content="easyui,internet,WdatePicker" />
<title>深圳市韩塑美生物医学科技有限公司是一家化妆品面膜垂直电商为一体的分享平台互联网公司</title>
<script type="text/javascript" src="<%=path%>/public/core/EasyuiZX.js"></script>
<script type="text/javascript" src="<%=path%>/admin/security/js/buttonTools.js"></script>
<script type="text/javascript" src="<%=path%>/admin/security/js/jquery.jqia.dateFormat.js"></script>
<script type="text/javascript" src="js/rolemanager.js"></script>

</head>
<body>
	<!-- 查询表单 -->
	<div class="searchformDiv" width="90%" style="margin-top:5px;">
		<table width="90%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<th>状态:</th>
				<td>
					<select name="state" id="state" attr_code="ADMIN_ROLE_STATE" class="searchipt">
					</select>
				</td>
				<th>角色名称:</th>
				<td>
					<input type="text" name="roleName" id="roleName" class="searchipt" />
				</td>
				<td style="text-align: center;">
					<a href="javascript: void(0);" id="search_btn" name="search_btn" class="ui_white_btn">
						<span><em>&nbsp;查&nbsp;询&nbsp;</em></span>
					</a>
				</td>
			</tr>
		</table>
	</div>


	<div style="margin-bottom: 10px; margin-top: 10px;">
		<div class="formgrid_title">
			<h2>角色列表</h2>
		</div>
		<!-- 列表 -->
		<div class="grid">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<!-- <th field="roleId">角色ID</th> -->
					<th field="roleName">角色名称</th>
					<th field="state" attr_code="ADMIN_ROLE_STATE">状态</th>
					<th field="createDate">创建时间</th>
					<th field="stateDate">状态时间</th>
				</tr>
			</table>
		</div>
	</div>

	<!-- tab -->
	<div class="stat_graph mt5">
		<h3>
			<div class="graph_tab">
				<ul>
					<li id="role" class="selected"><span class="word">角色信息</span><span class="bg"></span></li>
					<li id="privilege" onClick="loadTreeGrid(this)"><span class="word">角色权限</span><span class="bg"></span></li>
					<div class="clear"></div>
				</ul>
			</div>
		</h3>
	</div>
	<div>
		<div id="roleTab" style="margin-top: 10px;">
			<div class="formgrid" id="role_edit_form">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<input type="hidden" id="roleId" name="roleId" class="ipttxt" />
						<input type="hidden" id="createDate" name="createDate" class="ipttxt" />
						<th><label class="ltxtc">*</label>角色名称：</th>
						<td>
							<input type="text" id="roleName" name="roleName" class="ipttxt" nullable="false" max_length="50" />
						</td>
						<th><label class="ltxtc">*</label>状态：</th>
						<td>
							<select name="state" id="state" attr_code="ADMIN_ROLE_STATE" class="searchipt" nullable="false">
							</select>
						</td>
						<th>状态日期：</th>
						<td style="padding-right:10px;">
							<input type="text" id="stateDate" name="stateDate" class="ipttxt" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" />
						</td>
					</tr>
					<tr>
						<th>描述：</th>
						<td colspan="3">
							<textarea id="roleDesc" name="roleDesc" rows="7" cols="120" max_length="250" style="padding:5px;">
							</textarea>
						</td>
					</tr>
				</table>
				<div class="btns">
					<a id="add" action="addAction" href="javascript: void(0);" class="resetbtn">增加</a>
					<a id="update" action="updateAction" href="javascript: void(0);" class="resetbtn">修改</a>
					<a id="delete" action="deleteAction" href="javascript: void(0);" class="resetbtn">删除</a>
					<a id="sure" action="sure" href="javascript: void(0);" class="resetbtn">确定</a>
					<a id="cancel" action="" href="javascript: void(0);" class="resetbtn">取消</a>
				</div>
			</div>
		</div>
		<div id="privilegeTab" style="margin-top: 10px;">
			<div id="privilegeContain" class="formgrid" style="height: 200px;">
				<table id="treegrid">
					<thead>
						<tr>
							<th field="privilegeName" formatter="formatCheckBox" width="400">权限名称</th>
							<!-- <th field="menuId" width="400" align="right" style="display: none;">菜单id</th> -->
							<th field="type" width="300" align="right">权限类型</th>
						</tr>
					</thead>
				</table>
				<div class="btns">
					<a id="updatePri" action="updateAction" href="javascript: void(0);" class="resetbtn">修改</a>
					<a id="surePri" action="sure" href="javascript: void(0);" class="resetbtn">确定</a>
					<a id="cancelPri" action="" href="javascript: void(0);" class="resetbtn">取消</a>
				</div>
			</div>
		</div>
	</div>
	<div id="loading" style="background: url(<%=path%>/public/v20/ui/images/loading.gif) #ecf5ff no-repeat;width: 80px;height: 80px;position: absolute;top: 45%;left: 45%;z-index: 3000;filter:alpha(opacity=80);opacity: 0.8;display: none;"></div>
</body>
</html>
