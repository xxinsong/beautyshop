<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="library" content="market"/>
    <title>深圳市韩塑美生物医学科技有限公司是一家化妆品面膜垂直电商为一体的分享平台互联网公司</title>
    <script type="text/javascript" src="<%=path%>/public/core/EasyuiZX.js"></script>
    <script type="text/javascript" src="<%=path%>/market/order/js/payment.js"></script>
</head>
<body>

<div class="header">
    <jsp:include page="../main/topnav.jsp" flush="true"/>
    <div class="wrap" style="z-index:1000;">
        <div class="cart_logo" style="cursor: pointer;" onclick="/welcome"></div>
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
		<div class="mc">
			<s class="icon_succ02"></s>
			<div class="fore">
				<h3 class="ftx_02">订单提交成功，请您尽快付款！</h3>
				<ul class="list_h">
					<li class="fore1">订单号：${orderNo}</li>
					<li class="fore2">应付金额（元）：<strong class="ftx_01">${amount}元</strong></li>
                    <div class="clear"></div>
				</ul>
				<p id="p_show_info">&nbsp;</p>
				<p class="reminder">
                	立即支付<span class="">${amount}元</span>，即可完成订单。</strong>
	    	请您在<span class="ftx-04">24小时</span>内完成支付，否则订单会被自动取消。
				</p>
			</div>
		</div>
	</div>
	<div id="qpay03" class="m tabs">
		<div class="mt">
			<div id="notice1" class="hn"></div>
		</div>
		<div data-widget="tabs" class="mc">
			<ul id="bank_tab" class="tab">
				<li id="pay_platform" >
					<a href="javascript:void(0);"><strong>支付方式</strong></a>
				</li>
				<div class="clear"></div>
			</ul>
			<div class="tabcon ol3">
				<div id="platform_list" class="mpart fore2">
					<ul class="bank_list">
						<li class="">
							<input type="radio" name="RadioGroup1" class="radio" checked="true" value="EASYPAY">
							<div class="bank_info">
                                <label>
                                    <a href="#none"><img width="125" height="28" src="<%=path%>/market/main/images/easypay.png" alt="易票连支付"></a>
                                </label>
							</div>
						</li>
					</ul>
				</div>
				<form id="form_pay" action="<%=path%>/easypay" method="POST" target="_blank">
		            <input type="hidden" name="orderNo" value="${orderNo}"/>
		            <%--<input id="orderName" type="hidden" name="orderName" value="韩塑美订单"/>--%>
		            <input type="hidden" name="amount" value="${amount}"/>
		            <input type="hidden" name="contactPerson" value="${contactPerson}"/>
		            <input type="hidden" name="mobilePhone" value="${mobilePhone}"/>
		            <input type="hidden" name="address" value="${address}"/>
		            <input type="hidden" name="zipCode" value="${zipCode}"/>
                    <input type="hidden" name="token" value="${token}"/>
		            <%--<input id="bankId" type="hidden" name="BANKID" value=""/>--%>

                    <%--<input type=hidden name="MerId" value="<%=MerId%>">
                    <input type=hidden name="OrdId" value="<%=OrdId%>">
                    <input type=hidden name="TransAmt" value="<%=TransAmt%>">
                    <input type=hidden name="CuryId" value="<%=CuryId%>">
                    <input type=hidden name="TransDate" value="<%=TransDate%>">
                    <input type=hidden name="TransType" value="<%=TransType%>">
                    <input type=hidden name="Version" value="<%=Version%>">（接口版本号）
                    <input type=hidden name="BgRetUrl" value="<%=BgRetUrl%>">（后台交易接收URL，长度不要超过80个字节）
                    <input type=hidden name="PageRetUrl" value="<%=PageRetUrl%>">（页面交易接收URL，长度不要超过80个字节）
                    <input type=hidden name="GateId" value="<%=GateId%>">（支付网关号，可选）
                    <input type=hidden name="Priv1" value="<%=Priv1%>">（商户私有域，可选，长度不要超过60个字节）
                    <input type=hidden name="ChkValue" value="<%=ChkValue%>">（256字节长的ASCII码）--%>
	        	</form>
    			<div class="btns">
    				<a id="btn_submit" href="javascript:void(0)" class="btn_surepay">确认支付方式</a>
    			</div>
			</div>
		</div>
	</div>

</div>
<jsp:include page="payresult.jsp" flush="true"></jsp:include>
<jsp:include page="../main/footer.jsp" flush="true"></jsp:include>

</body>
</html>