<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">  
  	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="library" content="internet,WdatePicker" />
		<title>深圳市韩塑美生物医学科技有限公司是一家化妆品面膜垂直电商为一体的分享平台互联网公司</title>
		<script type="text/javascript" src="<%=path%>/core/EasyuiZX.js"></script>
	</head>
    <body>
    	<form id=payForm action="<%=path%>/market/pay/send.jsp" name="form1" method="post" target="_blank">
    		<input type="text" name="ORDERSEQ" value="20131234">
    		<input type="text" name="AMOUNT" value="0.01">
    		<input type="text" name="BANKID" value="BOC">
    		<input type="submit" name="Submit" value="开始支付">
    	</form>
    </body>
</html>
