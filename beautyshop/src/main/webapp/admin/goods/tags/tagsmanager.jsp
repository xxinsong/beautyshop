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
<script type="text/javascript" src="js/tagsmanager.js"></script>
</head>

<body>
	<div class="formgrid" style="margin-bottom: 10px;margin-top:5px;">
		<div class="formgrid_title">
			<h2>标签树</h2>
		</div>
		<div style="height: 300px; overflow: auto">
			<ul id="tagTree" class="ztree"></ul>
		</div>
	</div>

	<div class="formgrid" id="tag_edit_form">
		<div class="formgrid_title">
			<h2>标签编辑</h2>
		</div>
		<input type="hidden" name="tagId" class="ipttxt" />
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<th>上级标签：</th>
				<td>
					<input type="hidden" name="parentTagId" class="ipttxt" /> <input type="text" name="parentTagName" class="ipttxt" />
					<input type="hidden" name="tagType" value="1" class="ipttxt" />
				</td>
				<%--<th><label class="ltxtc">*</label>标签类型：</th>
				<td>
					<select id="tagType" name="tagType" attr_code="ADMIN_TAG_TYPE" class="searchipt" nullable="false">
					</select>
				</td>--%>
				<th><label class="ltxtc">*</label>标签名称：</th>
				<td>
					<input type="text" id="tagName" name="tagName" class="ipttxt" nullable="false" max_length="200" />
				</td>
				<th><label class="ltxtc">*</label>是否叶子节点：</th>
				<td>
					<select name="isLeaf" class="searchipt" nullable="false">
						<option value="1">是</option>
						<option value="0">否</option>
					</select>
				</td>
			</tr>
			<input type="hidden" id="createDate" name="createDate" class="ipttxt" />
		</table>
		<div class="btns">
			<a id="add_root" action="addAction" href="javascript: void(0);" class="resetbtn">添加根标签</a>
			<a id="add_child" action="addAction" href="javascript: void(0);" class="resetbtn">添加子标签</a>
			<a id="update" action="updateAction" href="javascript: void(0);" class="resetbtn">修改</a>
			<a id="delete" action="deleteAction" href="javascript: void(0);" class="resetbtn">删除</a>
			<a id="cancel" action="" href="javascript: void(0);" class="resetbtn">取消</a>
			<a id="sure" action="sure" href="javascript: void(0);" class="resetbtn">保存</a>
		</div>
	</div>
	<div id="loading" style="background: url(<%=path%>/public/v20/ui/images/loading.gif) #ecf5ff no-repeat;width: 80px;height: 80px;position: absolute;top: 45%;left: 45%;z-index: 3000;filter:alpha(opacity=80);opacity: 0.8;display: none;"></div>
</body>
</html>

