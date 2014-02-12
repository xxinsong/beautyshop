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
<script type="text/javascript" src="<%=path%>/public/ajax/ajaxfileupload.js"></script>
<script type="text/javascript" src="js/selectiongoodpackage.js"></script>
</head>
<body>
	<!-- 查询表单 -->
	<div class="searchformDiv" width="100%">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<th>商品包名称:</th>
				<td>
					<input type="text" name="searchPackageName" id="searchPackageName" class="searchipt" />
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
			<h2>商品包列表</h2>
		</div>
		<!-- 列表 -->
		<div class="grid" id="packageList">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<th field="packageName">商品包名称</th>
					<th field="packageCode">商品包编码</th>
					<th field="packageDesc">商品描述</th>
					<th field="state" attr_code="ADMIN_PACKAGE_STATE">状态</th>
				</tr>
			</table>
		</div>
	</div>
	<div id="packageEditorForm" class="formgrid">
		<div class="btns">
			<a id="cancel" action="" href="javascript: void(0);" class="resetbtn">取消返回</a>
			<a id="sure" action="sure" href="javascript: void(0);" class="resetbtn">确认选择</a>
		</div>
	</div>
	<div id="loading" style="background: url(<%=path%>/public/v20/ui/images/loading.gif) #ecf5ff no-repeat;width: 80px;height: 80px;position: absolute;top: 45%;left: 45%;z-index: 3000;filter:alpha(opacity=80);opacity: 0.8;display: none;"></div>
</body>
</html>
