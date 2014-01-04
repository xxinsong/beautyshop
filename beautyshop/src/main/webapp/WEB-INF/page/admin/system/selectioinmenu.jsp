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
		<script type="text/javascript" src="js/selectionmenu.js"></script>

	</head>

	<body>
		<div class="formgrid" style="margin-bottom: 10px;">
			<div class="formgrid_title">
				<h2>
					
				</h2>
			</div>
			<div style="height: 300px;overflow: auto">
				<ul id="menuTree" class="ztree"></ul>
			</div>
		</div>

		<div class="formgrid" id="menu_edit_form">
			<div class="btns">
				<a id="cancel" href="javascript: void(0);" class="resetbtn">取消返回</a>
				<a id="sure" href="javascript: void(0);" class="submitbtn">确定选择</a>
			</div>
		</div>
	</body>
</html>
