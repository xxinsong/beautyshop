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
<script type="text/javascript" src="js/selectiongood.js"></script>
</head>
<body>
	<!-- 查询表单 -->
	<div class="searchformDiv" width="90%">
		<table width="90%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<th>商品名称:</th>
				<td>
					<input type="text" name="searchGoodsName" id="searchGoodsName" class="searchipt" />
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
			<h2>商品列表</h2>
		</div>
		<div class="grid" id="goodList">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<th field="goodsId">商品id</th>
					<th field="goodsName">商品名称</th>
					<th field="goodsDesc">商品描述</th>
					<th field="createDate">创建时间</th>
					<th field="imageUri">商品图片</th>
				</tr>
			</table>
		</div>
	</div>

	<div class="formgrid" id="catalog_edit_form">
		<div class="btns">
			<a id="cancel" action="" href="javascript: void(0);" class="resetbtn">取消返回</a>
			<a id="sure" action="sure" href="javascript: void(0);" class="resetbtn">确认选择</a>
		</div>
	</div>
	<div id="loading" style="background: url(<%=path%>/public/v20/ui/images/loading.gif) #ecf5ff no-repeat;width: 80px;height: 80px;position: absolute;top: 45%;left: 45%;z-index: 3000;filter:alpha(opacity=80);opacity: 0.8;display: none;"></div>
</body>
</html>
