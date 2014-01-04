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
<script type="text/javascript" src="js/goodtagsselection.js"></script>
</head>

<body>
	<div class="formgrid" style="margin-bottom: 10px;">
		<div class="formgrid_title">
			<h2>标签选择树</h2>
		</div>
		<div style="height: 300px; overflow: auto">
			<table id="treegrid">
			</table>
		</div>
	</div>

	<div class="formgrid" id="tags_edit_form">
		<div class="formgrid_title">
			<h2>权限编辑</h2>
		</div>
		<div class="btns">
			<a id="cancel" action="" href="javascript: void(0);" class="resetbtn">取消</a>
			<a id="sure" action="sure" href="javascript: void(0);" class="resetbtn">确定</a>
		</div>
	</div>
	<div id="loading" style="background: url(<%=path%>/public/v20/ui/images/loading.gif) #ecf5ff no-repeat;width: 80px;height: 80px;position: absolute;top: 45%;left: 45%;z-index: 3000;filter:alpha(opacity=80);opacity: 0.8;display: none;"></div>
</body>
</html>

