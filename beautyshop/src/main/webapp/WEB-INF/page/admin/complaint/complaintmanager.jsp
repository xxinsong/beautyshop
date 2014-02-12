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
<script type="text/javascript">
var path = '<%=path%>';
</script>
<script type="text/javascript" src="js/complaintmanager.js"></script>
</head>
<body>
	<!-- 查询表单 -->
	<div class="searchformDiv" width="90%">
		<table width="90%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<th>订单编码:</th>
				<td>
					<input type="text" name="searchOrderNo" id="searchOrderNo" class="searchipt" />
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
			<h2>投诉列表</h2>
		</div>
		<div class="grid" id="complList">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<!-- <th field="goodsId">商品id</th> -->
					<th field="orderNo">订单编码</th>
					<th field="merchantName">商户名称</th>
					<th field="commitTime">投诉时间</th>
					<th field="content">投诉内容</th>
					<th field="replyTime">回复时间</th>
				</tr>
			</table>
		</div>
	</div>
	<div id="complEditorForm" class="formgrid">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<input type="hidden" id="id" name="id" class="ipttxt" />
							<th>咨询内容：</th>
							<td>
							    <textarea  id="content" name="content" style="width: 900px;"></textarea>
							</td>
						</tr>
						<tr>
						    <th><label class="ltxtc">*</label>回复内容：</th>
							<td>
							    <textarea  id="replyContent" name="replyContent" style="width: 900px;" nullable="false" ></textarea>
							</td>
						</tr>
					</table>


					<div class="btns">
						<a id="update" action="updateAction" href="javascript: void(0);" class="resetbtn">编辑回复</a>
						<a id="sure" action="sure" href="javascript: void(0);" class="resetbtn">确定</a>
						<a id="cancel" action="" href="javascript: void(0);" class="resetbtn">取消</a>
					</div>
				</div>
	<div id="loading" style="background: url(<%=path%>/public/v20/ui/images/loading.gif) #ecf5ff no-repeat;width: 80px;height: 80px;position: absolute;top: 45%;left: 45%;z-index: 3000;filter:alpha(opacity=80);opacity: 0.8;display: none;"></div>
</body>
</html>
