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
		<script type="text/javascript" src="<%=path%>/market/order/js/payresult.js"></script>
	</head>
	
	<body>
		<div id="pay_page" class="trans_div" style="display: none;"></div>
		<div id="pay_result" class="login_pop" style="width:508px;display: none;">
		  <h2 id="pay_close">支付<a href="javascript: void(0)" class="pop_close">关闭</a></h2>
		    <div class="login_pop_table">
		    	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="form_table">
		        <tr>
		          <td>&nbsp;</td>
		          <td colspan="4">请您在新打开的网上银行页面进行支付，支付完成前请不要关闭该窗口。</td>
		        </tr>
		        <tr>
		          <td colspan="4"><a id="sucess_pay" href="javascript: void(0)" class="orangebtn_m"><span>已完成支付</span></a></td>
		          </tr>
		        <tr>
		          <td colspan="4"><a id="error_pay" href="javascript: void(0)" class="orangebtn_m"><span>支付遇到问题</span></a></td>
		        </tr>
		        <tr>
		          <td>&nbsp;</td>
		          <td colspan="4"><a id="return_pay" href="javascript: void(0)" class="blue">返回重新选择银行</a></td>
		        </tr>
		      </table>  
			</div>
		</div>
	</body>
</html>