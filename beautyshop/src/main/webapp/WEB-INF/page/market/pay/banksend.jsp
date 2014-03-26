<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%
	String path = request.getContextPath();	
	String TRANDATE = request.getParameter("ORDERDATE");
	String ORDERREQTRANSEQ = request.getParameter("ORDERREQTRANSEQ");
	String ORDERSEQ = request.getParameter("ORDERSEQ");
	String ORDERAMOUNT = request.getParameter("ORDERAMOUNT");
	String PRODUCTAMOUNT = request.getParameter("PRODUCTAMOUNT");
	String ATTACHAMOUNT = request.getParameter("ATTACHAMOUNT");
	String CURTYPE = request.getParameter("CURTYPE");
	String ENCODETYPE = request.getParameter("ENCODETYPE");
	String ATTACH = request.getParameter("ATTACH");
	String MERCHANTURL = request.getParameter("MERCHANTURL");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="library" content="easyui,internet,WdatePicker" />
    <title>深圳市韩塑美生物医学科技有限公司是一家化妆品面膜垂直电商为一体的分享平台互联网公司</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/core/EasyuiZX.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/market/pay/js/banksend.js"></script>
</head>
	<body>
		<form id="banksendForm" action="<%=MERCHANTURL%>" method="post" name="sendForm">		  
			<input id="UPTRANSEQ" type="hidden" name="UPTRANSEQ"    		value="<%=ORDERREQTRANSEQ%>"/>
			<input id="TRANDATE"  type="hidden" name="TRANDATE"        	value="<%=TRANDATE%>"/>
			<input id="retnCode" type="hidden" name="RETNCODE"     value="0000"/>
			<input id="retnInfo" type="hidden" name="RETNINFO"     value="0000"/>
			<input id="ORDERREQTRANSEQ" type="hidden" name="ORDERREQTRANSEQ"     value="<%=ORDERREQTRANSEQ%>"/>
			<input id="ORDERSEQ" type="hidden" name="ORDERSEQ"     	value="<%=ORDERSEQ%>"/>
			<input id="ORDERAMOUNT" type="hidden" name="ORDERAMOUNT"     value="<%=ORDERAMOUNT%>"/>
			<input id="PRODUCTAMOUNT" type="hidden" name="PRODUCTAMOUNT"   value="<%=PRODUCTAMOUNT%>"/>
			<input id="ATTACHAMOUNT" type="hidden" name="ATTACHAMOUNT"    value="<%=ATTACHAMOUNT%>"/>
			<input id="CURTYPE" type="hidden" name="CURTYPE"     	value="<%=CURTYPE%>"/>
			<input id="ENCODETYPE"  type="hidden" name="ENCODETYPE"     	value="<%=ENCODETYPE%>"/>
			<input id="sign" type="hidden" name="SIGN"  value=""/>		
		</form>
	</body>
</html>
