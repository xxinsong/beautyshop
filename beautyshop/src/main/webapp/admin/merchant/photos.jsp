<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String merchantId = request.getParameter("merchantId");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="library" content="easyui,internet,WdatePicker" />
		<title></title>
		<script type="text/javascript" src="<%=request.getContextPath()%>/public/core/EasyuiZX.js"></script>
		
		<script type="text/javascript">
			var merchantId = "<%=merchantId%>";
			var contextPath = "<%=path%>";
			
	       $(function() {
	           $("#overlayerBtn").click(function() {
	               overlay();
	               $("#overlayer").bind("click", function() {
	                   closeOverlay();
	                   $(".ui_dialog").hide();
	                   $("#loading").hide();
	               });
	           });
	           
	       })
	       
        </script>
        
        <script type="text/javascript" src="js/photos.js"></script>
	</head>

	<body>

        <!-- 查询表单 -->
		<div class="searchformDiv" style="display: none">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<th>商户名称:</th>
					<td>
						<input type="text" name="textfield" id="qryMerchantName" class="searchipt" />
					</td>
					<td style="text-align: center;">
						<a id="queryBtn" href="javascript: queryData();" class="ui_white_btn"><span><em>&nbsp;查&nbsp;询&nbsp;</em></span></a>
					</td>
				</tr>
			</table>
		</div>

		<div>
			<div id="menuTab">
				<!-- 列表 -->
				<div class="grid" style="text-align: center;height:450px;width: 1000px;">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th field="uri">档案图片</th>
						</tr>
					</table>
				</div>
			</div>
		</div>

		
        <div id="loading" style="background: url(images/loading.gif) #ecf5ff no-repeat;width: 80px;height: 80px;position: absolute;top: 45%;left: 45%;z-index: 3000;filter:alpha(opacity=80);opacity: 0.8;display: none;">
        </div>
        
	</body>
</html>
