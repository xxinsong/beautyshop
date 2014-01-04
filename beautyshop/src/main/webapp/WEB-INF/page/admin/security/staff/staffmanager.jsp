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
<script type="text/javascript" src="<%=path%>/admin/security/js/buttonTools.js"></script>
<script type="text/javascript" src="<%=path%>/admin/security/js/jquery.jqia.dateFormat.js"></script>
<script type="text/javascript" src="js/staffmanager.js"></script>
</head>
<body>
	<div>
		<div style="float: left; width: 20%;">
			<div class="formgrid_title">
				<h2>组织树</h2>
			</div>
			<div style="height: 300px; overflow: auto">
				<ul id="orgTree" class="ztree"></ul>
			</div>
		</div>
		<!-- 查询表单 -->
		<div style="float: right; width: 79%">
			<div class="searchformDiv" width="90%">
				<table width="90%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<th>组织过滤</th>
						<td>
							<select id="hasOrg" name="hasOrg" class="searchipt" nullable="false">
								<option value="0">无组织</option>
								<option value="1">有组织</option>
							</select>
						</td>
						<input type="hidden" name="stafforgId" id="stafforgId" value="-1" class="searchipt" />
						<th>员工编码:</th>
						<td>
							<input type="text" name="staffCode" id="staffCode" class="searchipt" />
						</td>
						<th>员工名称:</th>
						<td>
							<input type="text" name="staffName" id="staffName" class="searchipt" />
						</td>
						<td style="text-align: center;">
							<a href="javascript: void(0);" id="search_btn" name="search_btn" class="ui_white_btn">
								<span><em>&nbsp;查&nbsp;询&nbsp;</em></span>
							</a>
						</td>
					</tr>
				</table>
			</div>


			<div class="formgrid" style="margin-bottom: 10px; margin-top: 10px;">
				<div class="formgrid_title">
					<h2>员工列表</h2>
				</div>
				<!-- 列表 -->
				<div class="grid">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th field="staffId">员工ID</th>
							<th field="staffCode">员工编码</th>
							<th field="staffName">员工名称</th>
							<th field="createDate">创建时间</th>
							<th field="effDate">生效时间</th>
						</tr>
					</table>
				</div>
			</div>

			<!-- tab -->
			<div class="stat_graph mt5">
				<h3>
					<div class="graph_tab">
						<ul>
							<li id="staff" crossBubble="true" class="selected"><span class="word">员工信息</span><span class="bg"></span></li>
							<li id="role" onClick="loadRoleTreeGrid(this)"><span class="word">员工角色</span><span class="bg"></span></li>
							<li id="privilege" onClick="loadTreeGrid(this)"><span class="word">员工个性化权限</span><span class="bg"></span></li>
							<div class="clear"></div>
						</ul>
					</div>
				</h3>
			</div>
			<div>
				<!-- 员工信息tab -->
				<div id="staffTab" style="margin-top: 10px;">
					<div class="formgrid" id="staff_editor_form">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<input type="hidden" id="staffId" name="staffId" class="ipttxt" />
								<input type="hidden" id="createDate" name="createDate" class="ipttxt" />
								<th><label class="ltxtc">*</label>员工编码：</th>
								<td>
									<input type="text" id="staffCode" name="staffCode" class="ipttxt" nullable="false" max_length="30" />
								</td>
								<th><label class="ltxtc">*</label>员工名称：</th>
								<td>
									<input type="text" id="staffName" name="staffName" class="ipttxt" nullable="false" max_length="50" />
								</td>
								<th><label class="ltxtc">*</label>密码：</th>
								<td>
									<input type="text" id="password" name="password" class="ipttxt" nullable="false" max_length="50" />
								</td>
							</tr>
							<tr>
								<input type="hidden" id="orgId" name="orgId" valid_type="integer" class="ipttxt" />
								<th>所属组织：</th>
								<td>
									<input type="text" id="orgName" name="orgName" readonly="readonly" onClick="selectOrg()" class="ipttxt" />
								</td>
								<th><label class="ltxtc">*</label>性别：</th>
								<td>
									<select name="gender" id="gender" attr_code="ADMIN_STAFF_GENDER" class="searchipt" nullable="false">
									</select>
								</td>
								<th>生效时间：</th>
								<td>
									<input type="text" id="effDate" name="effDate" class="ipttxt" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" />
								</td>

							</tr>
							<tr>
								<th><label class="ltxtc">*</label>状态：</th>
								<td>
									<select name="state" id="state" attr_code="ADMIN_STAFF_STATE" class="searchipt" nullable="false">
									</select>
								</td>
								<th>描述：</th>
								<td colspan="2">
									<textarea id="staffDesc" name="staffDesc" max_length="250">
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

				<!-- 员工角色tab -->
				<div id="roleTab" class="formgrid" style="margin-top: 10px;">
					<div id="roleContain" style="height: 130px;">
						<table id="roletreegrid">
							<thead>
								<tr>
									<th field="roleId" width="80" checkbox=true></th>
									<th field="roleName" width="300">角色名称</th>
									<th field="roleDesc" width="300" align="right">角色描述</th>
									<th field="state" width="200" align="right">角色状态</th>
								</tr>
							</thead>
						</table>

					</div>
					<div class="btns">
						<a id="updateRole" action="updateAction" href="javascript: void(0);" class="resetbtn">角色分配</a>
						<a id="sureRole" action="sure" href="javascript: void(0);" class="resetbtn">确定</a>
						<a id="cancelRole" action="" href="javascript: void(0);" class="resetbtn">取消</a>
					</div>
				</div>

				<!-- 员工个性化权限tab -->
				<div id="privilegeTab" style="margin-top: 10px;">
					<div id="privilegeContain" class="formgrid" style="height: 400px;">
						<table id="treegrid">
							<thead>
								<tr>
									<th field="privilegeName" formatter="formatCheckBox" width="330">权限名称</th>
									<!--  <th field="menuId" width="330" align="right">菜单id</th> -->
									<th field="type" width="230" align="right">权限类型</th>
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
		</div>
	</div>
	<div id="loading" style="background: url(<%=path%>/public/v20/ui/images/loading.gif) #ecf5ff no-repeat;width: 80px;height: 80px;position: absolute;top: 45%;left: 45%;z-index: 3000;filter:alpha(opacity=80);opacity: 0.8;display: none;"></div>
</body>
</html>
