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
<script type="text/javascript" src="<%=path%>/public/ajax/ajaxfileupload.js"></script>
<script type="text/javascript">
var path = '<%=path%>';
</script>
<script type="text/javascript" src="js/sitemsgmanager.js"></script>
</head>
<body>
	<!-- 查询表单 -->
	<div class="searchformDiv" width="90%">
		<table width="90%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<th>消息标题:</th>
				<td>
					<input type="text" name="searchMsgTitle" id="searchMsgTitle" class="searchipt" />
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
			<h2>消息列表</h2>
		</div>
		<div class="grid" id="msgList">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<!-- <th field="msgId">消息id</th> -->
					<th field="msgType" attr_code="ADMIN_MSG_TYPE">消息类型</th>
					<th field="title">消息标题</th>
					<th field="receiverType" attr_code="ADMIN_MSG_RECIVERTYPE">接收人类型</th>
				</tr>
			</table>
		</div>
	</div>

	<div class="formgrid" id="msg_edit_form">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<input type="hidden" id="msgId" name="msgId" class="ipttxt" />
				<th><label class="ltxtc">*</label>消息标题：</th>
				<td width="150">
					<input type="text" id="title" name="title" class="ipttxt" nullable="false" max_length="40" />
				</td>
				<th><label class="ltxtc">*</label>消息类型：</th>
				<td width="150">
				    <select id="msgType" name="msgType" attr_code="ADMIN_MSG_TYPE" class="searchipt" nullable="false">
					</select>
				</td>
				<th><label class="ltxtc">*</label>接收人类型：</th>
				<td width="150">
				    <select id="receiverType" name="receiverType" attr_code="ADMIN_MSG_RECIVERTYPE" class="searchipt" nullable="false">
					</select>
				</td>
			</tr>
			<tr>
			    <th id="receiverIdTh">接收用户：</th>
				<td id="receiverIdTd">
					<input type="hidden" id="receiverId" name="receiverId" value="-1" /> 
					<input type="text" id="receiverName" name="receiverName" readonly="readonly" onClick="selectReceiver()" class="ipttxt" />
				</td>
				<th><label class="ltxtc">*</label>消息内容：</th>
				<td colspan="3">
					<textarea id="content" name="content"  max_length="250" style="padding: 5px;" nullable="false">
					</textarea>
				</td>
			</tr>
		</table>
		<div class="btns">
			<a id="add" action="addAction" href="javascript: void(0);" class="resetbtn">编辑消息</a>
			<!-- <a id="update" action="updateAction" href="javascript: void(0);" class="resetbtn">修改</a> -->
			<a id="delete" action="deleteAction" href="javascript: void(0);" class="resetbtn">删除</a>
			<a id="sure" action="sure" href="javascript: void(0);" class="resetbtn">确定</a>
			<a id="cancel" action="" href="javascript: void(0);" class="resetbtn">取消</a>
		</div>
	</div>
	<div id="loading" style="background: url(<%=path%>/public/v20/ui/images/loading.gif) #ecf5ff no-repeat;width: 80px;height: 80px;position: absolute;top: 45%;left: 45%;z-index: 3000;filter:alpha(opacity=80);opacity: 0.8;display: none;"></div>
</body>
</html>
