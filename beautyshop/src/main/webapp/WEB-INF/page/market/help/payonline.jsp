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
    	<link rel="stylesheet" href="css/style.css" type="text/css" />
    	<%--<link rel="stylesheet" href="<%=request.getContextPath()%>/market/help/css/style.css" type="text/css" />--%>
    	<script type="text/javascript" src="<%=path%>/public/core/EasyuiZX.js"></script>
    	<script type="text/javascript">
            $(function () {
                switchMenu($("#mnu_payonline"));
            });
    	</script>
	</head>
	<body>
		<jsp:include page="../main/header.jsp" flush="true"></jsp:include>
        <jsp:include page="helpmenu.jsp" flush="true"></jsp:include>
        <%--<div style="border:1px solid #dcdcdc;padding-left:225px;width:1000px">
            <img style="" src="<%=path%>/market/main/images/identify.jpg"/>
        </div>--%>
        <%--<div align="center">
            <img src="<%=path%>/market/main/images/30days.jpg"/><br>
        </div>--%>
        <div class="detailR"<%-- style="padding-left:225px;width:775px; float:left;"--%>>
            <div class="pers_cen_div mt">
                <div class="pers_cen_title">
                    <h3>在线支付</h3>
                </div>
                <div class="pers_cen_con">
                    <div class="announce_content">
                        <p>韩塑美目前提供了多种在线付款方式供您选择。</p>
                        <h2>一、支付宝（含信用卡快捷支付）</h2>
                        <p>如果您已经拥有支付宝账户，可选择支付宝进行付款。</p>
                        <p>如果您还不知道如何使用支付宝，了解支付宝使用帮助。 </p>
                        <img src="<%=path%>/market/main/images/payonline.jpg"/><br>
                        <h2>二、网银直接支付</h2>
                        <p>选择网银支付，您的银行卡需要开通相应的在线业务。因各地银行政策不同，建议您在网上支付前拨打所在地银行电话，咨询该行可供网上支付的银行卡种类及开通手续。</p>
                        <p>网银支付平台目前所支持的银行卡种列表如下： </p>
                        <img src="<%=path%>/market/main/images/payonline2.jpg"/><br>
                        <p>部分卡种存在在线支付限额，为方便您抢购，小美建议您提前充值部分金额。 </p>

                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <div class="clear"></div>
	<jsp:include page="../main/footer.jsp" flush="true"></jsp:include>
	</body>
</html>