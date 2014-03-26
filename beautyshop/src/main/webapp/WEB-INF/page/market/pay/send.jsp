<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%
    String path = request.getContextPath();
    //***********************************************
    //获取传入的订单参数
    String ORDERSEQ = request.getParameter("ORDERSEQ")==null?"":request.getParameter("ORDERSEQ");
    String BANKID = request.getParameter("BANKID")==null?"":request.getParameter("BANKID");
    String AMOUNT = request.getParameter("AMOUNT")==null?"":request.getParameter("AMOUNT");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">  
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="library" content="easyui,internet,WdatePicker" />
		<title>深圳市韩塑美生物医学科技有限公司是一家化妆品面膜垂直电商为一体的分享平台互联网公司</title>
		<script type="text/javascript" src="<%=path%>/public/core/EasyuiZX.js"></script>
		<script type="text/javascript" src="js/send.js"></script>
	</head>
	
	<body>
		<form id = "send_form" action="<%=path%>/BankServlet" method="post" name="payForm">		  
			<input type="hidden" id="MERCHANTID"      name="MERCHANTID"       value=""/>
			<input type="hidden" id="SUBMERCHANTID"   name="SUBMERCHANTID"       value=""/>
			<input type="hidden" id="ORDERSEQ"        name="ORDERSEQ"         value="<%=ORDERSEQ%>"/>
			<input type="hidden" id="ORDERREQTRANSEQ" name="ORDERREQTRANSEQ"  value=""/>
			<input type="hidden" id="ORDERDATE"       name="ORDERDATE"        value=""/>
			<input type="hidden" id="ORDERAMOUNT"     name="ORDERAMOUNT"      value="<%=AMOUNT%>"/>
			<input type="hidden" id="PRODUCTAMOUNT"   name="PRODUCTAMOUNT"    value="<%=AMOUNT%>"/>
			<input type="hidden" id="ATTACHAMOUNT"    name="ATTACHAMOUNT"     value="0.00"/>
			<input type="hidden" id="CURTYPE"         name="CURTYPE"          value="RMB"/>
			<input type="hidden" id="ENCODETYPE"      name="ENCODETYPE"       value=""/>
			<input type="hidden" id="MERCHANTURL"     name="MERCHANTURL"      value=""/>
			<input type="hidden" id="BACKMERCHANTURL" name="BACKMERCHANTURL"  value=""/>
			<input type="hidden" id="BANKID"          name="BANKID"           value="<%=BANKID%>"/>
			<input type="hidden" id="ATTACH"          name="ATTACH"           value=""/>
			<input type="hidden" id="BUSICODE"        name="BUSICODE"         value="0001"/>			
			<input type="hidden" id="PRODUCTID"       name="PRODUCTID"        value=""/>
			<input type="hidden" id="TMNUM"           name="TMNUM"            value=""/>
			<input type="hidden" id="CUSTOMERID"      name="CUSTOMERID"       value=""/>
			<input type="hidden" id="PRODUCTDESC"     name="PRODUCTDESC"      value=""/>			
			<input type="hidden" id="MAC"             name="MAC"              value=""/>
			<input type="hidden" id="DIVDETAILS"      name="DIVDETAILS"       value=""/>
			<input type="hidden" id="PEDCNT"          name="PEDCNT"           value=""/>		
		</form>
	</body>
</html>
