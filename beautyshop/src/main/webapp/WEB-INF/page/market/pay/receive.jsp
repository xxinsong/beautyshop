<%@page contentType="text/html; charset=utf-8" language="java"%>
<%
	String path = request.getContextPath();	
	//获取参数
	String UPTRANSEQ = request.getParameter("UPTRANSEQ")==null?"":request.getParameter("UPTRANSEQ");
	String TRANDATE = request.getParameter("TRANDATE")==null?"":request.getParameter("TRANDATE");
	String RETNCODE = request.getParameter("RETNCODE")==null?"":request.getParameter("RETNCODE");
	String RETNINFO = request.getParameter("RETNINFO")==null?"":request.getParameter("RETNINFO");
	String ORDERREQTRANSEQ = request.getParameter("ORDERREQTRANSEQ")==null?"":request.getParameter("ORDERREQTRANSEQ");
	String ORDERSEQ = request.getParameter("ORDERSEQ")==null?"":request.getParameter("ORDERSEQ");
	String ORDERAMOUNT = request.getParameter("ORDERAMOUNT")==null?"":request.getParameter("ORDERAMOUNT");
	String PRODUCTAMOUNT = request.getParameter("PRODUCTAMOUNT")==null?"":request.getParameter("PRODUCTAMOUNT");
	String ATTACHAMOUNT = request.getParameter("ATTACHAMOUNT")==null?"":request.getParameter("ATTACHAMOUNT");
	String CURTYPE = request.getParameter("CURTYPE")==null?"":request.getParameter("CURTYPE");
	String ENCODETYPE = request.getParameter("ENCODETYPE")==null?"":request.getParameter("ENCODETYPE");
	String ATTACH = request.getParameter("ATTACH")==null?"":request.getParameter("ATTACH");
	String SIGN = request.getParameter("SIGN")==null?"":request.getParameter("SIGN");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="library" content="market"/>
    <title></title>
    <script type="text/javascript" src="<%=path%>/public/core/EasyuiZX.js"></script>
    <script type="text/javascript" src="js/receive.js"></script>
</head>
<body>
	<div class="header">
	    <jsp:include page="../main/topnav.jsp" flush="true"/>
	    <div class="wrap" style="z-index:1000;">
	        <div class="cart_logo"></div>
	        <div class="progress">
	            <ul class="progress-3">
	                <li class="step-1"><b></b>1.我的购物车</li>
	                <li class="step-2"><b></b>2.填写核对订单信息</li>
	                <li class="step-3"><b></b>3.成功提交订单</li>
	            </ul>
	        </div>
	        <div class="clear"></div>
	    </div>
	    <div class="menubar">
	        <div class="wrap">
	            <div class="order_pay_title"></div>
	        </div>
	    </div>
	</div>
	
	<div class="contaiter">
		<div class="qpay m m3 mt">
			<div id = "pay_sec" class="mc" style="display: none;"> 
				<s class="icon_succ02"></s>
				<div class="fore">
					<h3 class="ftx_02">订单支付成功！我们将尽快安排为您发货！</h3>
					<ul class="list_h">
						<li id="order_msg1" class="fore1">订单号：<%=ORDERSEQ%></li>
						<li id="order_msg2" class="fore2">应付金额（元）：<strong class="ftx_01"><%=ORDERAMOUNT%>元</strong></li>
	                    <div class="clear"></div>
					</ul>
				</div>
			</div>
			<div id = "pay_fal" class="mc" style="display: none;"> 
				<div class="fore">
					<h3 class="ftx_02">订单支付出错！</h3>
					<ul class="list_h">
						<li id="err_code" class="fore1">错误代码：1001</li>
						<li id="err_msg"class="fore2">错误原因：<strong class="ftx_01">商户未注册</strong></li>
	                    <div class="clear"></div>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<form id="form_req">
	    <input id = "UPTRANSEQ" type="hidden" name="UPTRANSEQ" value="<%=UPTRANSEQ%>"/>
	    <input id = "TRANDATE" type="hidden" name="TRANDATE" value="<%=TRANDATE%>"/>
	    <input id = "RETNCODE" type="hidden" name="RETNCODE" value="<%=RETNCODE%>"/>
	    <input id = "RETNINFO" type="hidden" name="RETNINFO" value="<%=RETNINFO%>"/>
	    <input id = "ORDERREQTRANSEQ" type="hidden" name="ORDERREQTRANSEQ" value="<%=ORDERREQTRANSEQ%>"/>
	    <input id = "ORDERSEQ" type="hidden" name="ORDERSEQ" value="<%=ORDERSEQ%>"/>
	    <input id = "ORDERAMOUNT" type="hidden" name="ORDERAMOUNT" value="<%=ORDERAMOUNT%>"/>
	    <input id = "PRODUCTAMOUNT" type="hidden" name="PRODUCTAMOUNT" value="<%=PRODUCTAMOUNT%>"/>
	    <input id = "ATTACHAMOUNT" type="hidden" name="ATTACHAMOUNT" value="<%=ATTACHAMOUNT%>"/>
	    <input id = "CURTYPE" type="hidden" name="CURTYPE" value="<%=CURTYPE%>"/>
	    <input id = "ENCODETYPE" type="hidden" name="ENCODETYPE" value="<%=ENCODETYPE%>"/>
	    <input id = "ATTACH" type="hidden" name="ATTACH" value="<%=ATTACH%>"/>
	    <input id = "SIGN" type="hidden" name="SIGN" value="<%=SIGN%>"/>
	</form>
	<jsp:include page="../main/footer.jsp" flush="true"></jsp:include>
</body>
</html>