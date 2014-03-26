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
<script type="text/javascript" src="js/orgmanager.js"></script>
</head>

<body>
	<div class="formgrid" style="margin-bottom: 10px;margin-top:5px;">
		<div class="formgrid_title">
			<h2>组织树</h2>
		</div>
		<div style="height: 300px; overflow: auto">
			<ul id="orgTree" class="ztree"></ul>
		</div>
	</div>

	<div class="formgrid" id="org_edit_form">
		<div class="formgrid_title">
			<h2>组织编辑</h2>
		</div>
		<input type="hidden" name="orgId" class="ipttxt" /> <input type="hidden" name="parentOrgId" class="ipttxt" /> <input type="hidden" id="pathName" name="pathName" class="ipttxt" /> <input type="hidden" id="pathCode" name="pathCode" class="ipttxt" /> <input type="hidden" id="createDate"
			name="createDate" class="ipttxt"
		/>

		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<th>上级组织：</th>
				<td>
					<input type="text" name="parentOrgName" class="ipttxt" />
				</td>
				<th><label class="ltxtc">*</label>组织名称：</th>
				<td>
					<input type="text" id="orgName" name="orgName" class="ipttxt" nullable="false" max_length="40" />
				</td>
				<th><label class="ltxtc">*</label>组织编码：</th>
				<td>
					<input type="text" id="orgCode" name="orgCode" class="ipttxt" nullable="false" max_length="40" />
				</td>
				<th><label class="ltxtc">*</label>组织类型：</th>
				<td style="padding-right:20px;">
					<select id="orgType" name="orgType" attr_code="ADMIN_ORG_TYPE" class="searchipt" nullable="false">
					</select>
				</td>
			</tr>
			<tr>
				<!-- <input type="text" id="orgLevel" name="orgLevel" class="ipttxt"  />
					<input type="text" id="lanId" name="lanId" class="ipttxt"  />
					<input type="text" id="statusCd" name="statusCd" class="ipttxt"  />
					<input type="text" id="orgType" name="orgType" class="ipttxt"  nullable="false"/>
					 -->
				<th><label class="ltxtc">*</label>是否叶子节点：</th>
				<td>
					<select name="isLeaf" class="searchipt" nullable="false">
						<option value="1">是</option>
						<option value="0">否</option>
					</select>
				</td>
				<th><label class="ltxtc">*</label>组织级别：</th>
				<td>
					<select name="orgLevel" id="orgLevel" attr_code="ADMIN_ORG_LEVEL" class="searchipt" nullable="false">
					</select>
				</td>
				<th><label class="ltxtc">*</label>本地网：</th>
				<td>
					<select id="lanId" name="lanId" attr_code="ADMIN_ORG_LAN" class="searchipt" nullable="false">
					</select>
				</td>
				<th><label class="ltxtc">*</label>当前状态：</th>
				<td>
					<select id="statusCd" name="statusCd" attr_code="ADMIN_ORG_STATUS" class="searchipt" nullable="false">
					</select>
				</td>
			</tr>
			<tr>
				<th><label class="ltxtc">*</label>状态时间：</th>
				<td style="padding-right:20px;">
					<input type="text" id="statusDate" name="statusDate" class="ipttxt" nullable="false" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" />
				</td>
				<th>组织简介：</th>
				<td colspan="3">
					<textarea id="orgContent" name="orgContent" class="ipttxt" rows="10" cols="90" max_length="2000">
					    </textarea>
				</td>
			</tr>
		</table>
		<div class="btns">
			<a id="add_root" action="addAction" href="javascript: void(0);" class="resetbtn">添加根组织</a>
			<a id="add_child" action="addAction" href="javascript: void(0);" class="resetbtn">添加子组织</a>
			<a id="update" action="updateAction" href="javascript: void(0);" class="resetbtn">修改</a>
			<a id="delete" action="deleteAction" href="javascript: void(0);" class="resetbtn">删除</a>
			<a id="cancel" action="" href="javascript: void(0);" class="resetbtn">取消</a>
			<a id="sure" action="sure" href="javascript: void(0);" class="resetbtn">保存</a>
		</div>
	</div>
	<div id="loading" style="background: url(<%=path%>/public/v20/ui/images/loading.gif) #ecf5ff no-repeat;width: 80px;height: 80px;position: absolute;top: 45%;left: 45%;z-index: 3000;filter:alpha(opacity=80);opacity: 0.8;display: none;"></div>
</body>
</html>

