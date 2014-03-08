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
		<script type="text/javascript" src="js/orderadmin.js"></script>
	</head>

	<body>
        <!-- 查询表单 -->
		<div id="queryForm" class="searchformDiv">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<th>订单编号:</th>
					<td>
						<input type="text" name="textfield" id="qryOrderNo" class="searchipt" />
					</td>
					<%--<th>商户名称:</th>
					<td>
						<input type="text" name="textfield" id="qryMerchantName" class="searchipt" />
					</td>--%>
					<th>用户帐号:</th>
					<td>
						<input type="text" name="textfield" id="qryLogonName" class="searchipt" />
					</td>
					<th>订单状态：</th>
					<td>
						<select name="textfield" id="qryOrderState" class="searchipt" attr_code="ORDER_STATE"></select>
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
							<span class="word">订单列表</span><span class="bg"></span>
						</li>
						<div class="clear"></div>
					</ul>
				</div>
			</h3>
		</div>

		<div>
			<div id="orderTab">
				<!-- 列表 -->
				<div class="grid">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th field="orderNo">订单编号</th>
							<th field="amount">总金额</th>
							<th field="relaMan">收货人</th>
							<th field="fullAddress">收货地址</th>
							<th field="state" attr_code="ORDER_STATE">状态</th>
							<th field="createTime">下单时间</th>
							<th field="operDate">发货时间</th>
						</tr>
					</table>
				</div>
			</div>
		</div>

		<!-- 分割线 -->
		<div class="btns" style="margin-top: 10px;text-align: center;">
			<a id="deliver" style="display: none;" href="javascript: deliverGoods();" class="ui_blue_btn"><span><em>发货</em></span></a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		
        <div id="loading" style="background: url(/market/main/images/loading.gif) #ecf5ff no-repeat;width: 80px;height: 80px;position: absolute;top: 45%;left: 45%;z-index: 3000;filter:alpha(opacity=80);opacity: 0.8;display: none;">
        </div>		
	</body>
</html>
