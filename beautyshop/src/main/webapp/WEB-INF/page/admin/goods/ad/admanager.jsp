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
<script type="text/javascript" src="<%=path%>/admin/goods/ad/js/admanager.js"></script>
<style type="text/css">
body {
	font-size: 14px;
}

input {
	vertical-align: middle;
	margin: 0;
	padding: 0;

}

.file-box {
	position: relative;
	width: 410px;
}

.txt {
	height: 22px;
	border: 1px solid #cdcdcd;
	width: 180px;
}

.btn {
	background-color: #FFF;
	border: 1px solid #CDCDCD;
	height: 24px;
	width: 70px;
	margin-left:10px;
	margin-top:-30px;
}

.file {
	position: absolute;
	top: 0;
	left: 225px;
	right: 80px;
	height: 24px;
	filter: alpha(opacity : 0);
	opacity: 0;
	width: 70px
}
</style>
</head>
<body>
	<!-- 查询表单 -->
	<div class="searchformDiv" width="100%" style="margin-top:5px;">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<th>广告名称:</th>
				<td>
					<input type="text" name="searchAdName" id="searchAdName" class="searchipt" />
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
			<h2>广告列表</h2>
		</div>
		<!-- 列表 -->
		<div class="grid" id="adList">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<th field="adName">广告名称</th>
					<th field="adLevel" attr_code="ADMIN_AD_LEVEL">级别</th>
					<th field="adDesc">广告描述</th>
					<th field="imageUrl">广告图</th>
				</tr>
			</table>
		</div>
	</div>
	<div id="adEditorForm" class="formgrid">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<input type="hidden" id="id" name="id" class="ipttxt" />
				<input type="hidden" id="goodsId" name="goodsId" class="ipttxt" />
				<th><label class="ltxtc">*</label>广告名称：</th>
				<td>
					<input type="text" id="adName" name="adName" class="ipttxt" nullable="false" />
				</td>
				<th><label class="ltxtc">*</label>关联商品：</th>
				<td>
					<input type="text" id="goodsName" name="goodsName" readonly="readonly" class="ipttxt" onclick="selectGood()" nullable="false" />
				</td>
				<th><label class="ltxtc">*</label>级别</th>
				<td>
					<select id="adLevel" name="adLevel" attr_code="ADMIN_AD_LEVEL" class="searchipt" nullable="false">
					</select>
				</td>
				<th><label class="ltxtc">*</label>排序：</th>
				<td>
					<input type="text" id="adOrder" name="adOrder" class="ipttxt" valid_type="integer"  nullable="false" />
				</td>
			</tr>
			<tr>
				
				<th>描述：</th>
				<td colspan="4">
					<textarea id="adDesc" name="adDesc" rows="3" cols="61" max_length="250">
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
	<div id="loading" style="background: url(<%=path%>/public/v20/ui/images/loading.gif) #ecf5ff no-repeat;width: 80px;height: 80px;position: absolute;top: 45%;left: 45%;z-index: 3000;filter:alpha(opacity=80);opacity: 0.8;display: none;"></div>
	<div id="popDiv" class="ui_dialog" style="display: none;">
		<div class="ui_dialog_fore">
			<div class="ui_dialog_title">
				<div class="buttons">
					<a class="close_btn" onclick="close_btn()"></a>
				</div>
				<span id="adupload_title">标题</span>
			</div>
			<div class="ui_dialog_body">
				<div class="ui_dialog_content">
					<div style="height: 200px; text-align: center;">
						<div id="imageUrlTd" class="file-box">
							<input type="hidden" name="imageUrl" id="imageUrl" class="gimage" value=""> 
							<input type='text' name='textfield' id='textfield' class='txt' /> 
							<input type='button' class='btn' style="margin-top: 0;" id="viewButtion" value='浏览...' /> 
							<input type="file" name="adfile" style="margin-top: 0;" class="file" id="adfile" size="28"
								onchange="document.getElementById('textfield').value=this.value" />
							<input type="button" id="uploadaButton" style="margin-top: 0;" class="btn" value="上 传" onclick="adImageUpload()" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
