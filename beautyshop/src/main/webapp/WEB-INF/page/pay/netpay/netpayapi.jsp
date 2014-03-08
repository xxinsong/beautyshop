<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="library" content="market"/>
    <title></title>
    <script type="text/javascript" src="<%=path%>/public/core/EasyuiZX.js"></script>
    <script type="text/javascript" src="<%=path%>/pay/netpay/netpayapi.js"></script>
</head>
<body>

<div style="display: none;">
    <form id="chinapayForm" name="chinapayForm" action="https://payment.chinapay.com/pay/TransGet<%--https://payment.chinapay.com/pay/TransGet--%>" method="post">
        <%--<input type=hidden name="merId" value="${MerId}">
        <input type=hidden name="ordId" value="${OrdId}">
        <input type=hidden name="transAmt" value="${TransAmt}">
        <input type=hidden name="curyId" value="${CuryId}">
        <input type=hidden name="transDate" value="${TransDate}">
        <input type=hidden name="transType" value="${TransType}">
        <input type=hidden name="version" value="${Version}">
        <input type=hidden name="bgRetUrl" value="${BgRetUrl}">
        <input type=hidden name="pageRetUrl" value="${PageRetUrl}">
        <input type=hidden name="gateId" value="${GateId}">
        <input type=hidden name="priv1" value="${Priv1}">
        <input type=hidden name="chkValue" value="${ChkValue}">
        <input type=hidden name="countryId" value="${CountryId}">
        <input type=hidden name="transTime" value="${TransTime}">
        <input type=hidden name="timeZone" value="${TimeZone}">
        <input type=hidden name="dSTFlag" value="${DSTFlag}">
        <input type=hidden name="priv2" value="${Priv2}">
        <input type=hidden name="extFlag" value="${ExtFlag}">--%>
        <input type=hidden name="MerId" value="${MerId}">
        <input type=hidden name="OrdId" value="${OrdId}">
        <input type=hidden name="TransAmt" value="${TransAmt}">
        <input type=hidden name="CuryId" value="${CuryId}">
        <input type=hidden name="TransDate" value="${TransDate}">
        <input type=hidden name="TransType" value="${TransType}">
        <input type=hidden name="Version" value="${Version}">
        <input type=hidden name="BgRetUrl" value="${BgRetUrl}">
        <input type=hidden name="PageRetUrl" value="${PageRetUrl}">
        <input type=hidden name="GateId" value="${GateId}">
        <input type=hidden name="Priv1" value="${Priv1}">
        <input type=hidden name="ChkValue" value="${ChkValue}">
        <input type=hidden name="CountryId" value="${CountryId}">
        <input type=hidden name="TransTime" value="${TransTime}">
        <input type=hidden name="TimeZone" value="${TimeZone}">
        <input type=hidden name="DSTFlag" value="${DSTFlag}">
        <input type=hidden name="Priv2" value="${Priv2}">
        <input type=hidden name="ExtFlag" value="${ExtFlag}">
    </form>
</div>
</body>
</html>