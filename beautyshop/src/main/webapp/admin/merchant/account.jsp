<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="library" content="easyui,internet,WdatePicker" />
		<title>深圳市韩塑美生物医学科技有限公司是一家化妆品面膜垂直电商为一体的分享平台互联网公司</title>
		<script type="text/javascript" src="<%=request.getContextPath()%>/public/core/EasyuiZX.js"></script>
		<script type="text/javascript" src="js/account.js"></script>
		<script type="text/javascript">
	       $(function() {
	           $("#auditPhotos").click(function() {
		           if (!memberGrid.getSelected()) {
		        	   messager.alert('请先选择记录！');
						return;
		           }
		           
	               overlay();
	               $("#overlayer").bind("click", function() {
	                   closeOverlay();
	                   $(".ui_dialog").hide();
	                   $("#loading").hide();
	               });
	               $("#photosIframe").attr("src", "photos.jsp?merchantId=" + memberGrid.getSelected().merchantId);
	               $("#popDiv").show();
	           });

	           $("#closePop").click(function() {
	        	   $("#overlayer").click();
	           });

	           // 弹出窗口居中
	           $('#popDiv').css('left', ($(window).width() - 1100)/2 -10 + 'px');
	       });

	       
        </script>
	</head>

	<body>

        <!-- 查询表单 -->
		<div id="queryForm" class="searchformDiv" style="margin-top:5px;">
			<table width="360" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<th>商户名称:</th>
					<td width="180" style="padding-left:5px;">
						<input type="text" name="textfield" id="qryMerchantName" class="searchipt" />
					</td>
					<td style="text-align: center;">
						<a href="javascript: queryData();" class="ui_white_btn"><span><em>&nbsp;查&nbsp;询&nbsp;</em></span></a>
					</td>
				</tr>
			</table>
		</div>

        <!-- tab -->
		<div class="stat_graph mt5">
			<h3>
				<div class="graph_tab">
					<ul>
						<li id="menu" class="selected">
							<span class="word">待审核商户列表</span><span class="bg"></span>
						</li>
						<div class="clear"></div>
					</ul>
				</div>
			</h3>
		</div>

		<div>
			<div id="merchantTab">
				<!-- 列表 -->
				<div class="grid">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th field="merchantCode">商户编码</th>
							<th field="merchantName">商户名称</th>
							<th field="kind" attr_code="MERCHANT_KIND">商户性质</th>
							<th field="level" attr_code="MERCHANT_LEVEL">商户等级</th>
							<th field="province" attr_code="MERCHANT_PROVINCE">省份</th>
							<th field="city" attr_code="MERCHANT_CITY">市/县</th>
							<th field="district" attr_code="MERCHANT_DISTRICT">区</th>
							<th field="address">实体店地址</th>
							<th field="merchantDesc">商户描述</th>
							<th field="legalPerson">法人代表</th>
							<th field="legalCertType" attr_code="LEGAL_CERT_TYPE">法人证件类型</th>
							<th field="legalCertNo">法人证件号码</th>
							<th field="licensesNo">工商执照号码</th>
							<th field="taxNo">税务登记号码</th>
							<th field="registerDate">登记时间</th>
							<th field="state" attr_code="MERCHANT_STATE">状态</th>
							<th field="createDate">创建时间</th>
							<th field="stateDate">状态时间</th>
							<th field="merchantType" attr_code="MERCHANT_TYPE">商户类型</th>
						</tr>
					</table>
				</div>
			</div>
		</div>

		<!-- 分割线 -->
		<div class="btns" style="margin-top: 10px;text-align: center;">
			<a id="lock" href="javascript: lock();" class="submitbtn"><span>锁定</span></a>
			<a id="unlock" href="javascript: unlock();" class="submitbtn"><span>解锁</span></a>
			<a id="cancel" href="javascript: cancel();" class="submitbtn"><span>注销</span></a>		
		</div>
		
        <div id="loading" style="background: url(images/loading.gif) #ecf5ff no-repeat;width: 80px;height: 80px;position: absolute;top: 45%;left: 45%;z-index: 3000;filter:alpha(opacity=80);opacity: 0.8;display: none;">
        </div>            
		
	</body>
</html>
