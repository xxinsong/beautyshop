<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="library" content="easyui,internet,WdatePicker" />
		<title></title>
		<script type="text/javascript" src="<%=request.getContextPath()%>/public/core/EasyuiZX.js"></script>
		<script type="text/javascript" src="js/invoice.js"></script>		
	</head>

	<body>
        <!-- 查询表单 -->
		<div id="queryForm" class="searchformDiv">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<th>订单id:</th>
					<td>
						<input type="text" name="textfield" id="qryOrderId" class="searchipt" />
					</td>
					<%--<th>商户名称:</th>
					<td>
						<input type="text" name="textfield" id="qryMerchantName" class="searchipt" />
					</td>--%>
					<th>收票人:</th>
					<td>
						<input type="text" name="textfield" id="qryReceiver" class="searchipt" />
					</td>
					<th>是否出具发票：</th>
					<td>
						<select name="textfield" id="qryIsDrawup" class="searchipt" attr_code="IS_DRAWUP"></select>
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
							<span class="word">发票资料列表</span><span class="bg"></span>
						</li>
						<div class="clear"></div>
					</ul>
				</div>
			</h3>
		</div>

		<div>
			<div id="invoiceTab">
				<!-- 列表 -->
				<div class="grid">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th field="orderId">订单id</th>
							<th field="isDrawup" attr_code="IS_DRAWUP">是否已出具发票</th>
							<th field="invoiceNo">发票编号</th>
							<%--<th field="merchantCode" attr_code="MERCHANT_LEVEL">商户编码</th>
							<th field="merchantName">商户名称</th>--%>
							<th field="receiver">收票人</th>
							<th field="receiveAddress">收票地址</th>
							<th field="drawupTime">出具时间</th>
							<th field="operator">操作人</th>
						</tr>
					</table>
				</div>
			</div>
		</div>

		<!-- 分割线 -->
		<div class="btns" style="margin-top: 10px;text-align: center;">
			<a id="issueInvoice" href="javascript: issueInvoice();" class="ui_blue_btn"><span><em>出具发票</em></span></a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a id="noIssue" href="javascript: noIssue();" class="ui_blue_btn"><span><em>取消出具发票</em></span></a>
		</div>
		
        <div id="loading" style="background: url(images/loading.gif) #ecf5ff no-repeat;width: 80px;height: 80px;position: absolute;top: 45%;left: 45%;z-index: 3000;filter:alpha(opacity=80);opacity: 0.8;display: none;">
        </div>		
	</body>
</html>
