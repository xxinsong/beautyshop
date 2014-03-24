<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
    	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    	<meta http-equiv="library" content="market"/>
    	<title></title>
    	<link rel="stylesheet" href="css/style.css" type="text/css" />
    	<%--<link rel="stylesheet" href="<%=request.getContextPath()%>/market/help/css/style.css" type="text/css" />--%>
    	<script type="text/javascript" src="<%=path%>/public/core/EasyuiZX.js"></script>
    	<script type="text/javascript">
            $(function () {
                switchMenu($("#mnu_balance"));
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
                    <h3>余额支付</h3>
                </div>
                <div class="pers_cen_con">
                    <div class="announce_content">
                        <p>如果您的韩塑美账户中有可用的余额或者返金，您也可以使用韩塑美余额来支付您的订单，如果您需要查看您的余额，请点击<font color="red" style="text-underline-position: auto">我的余额</font></p>
                        <img src="<%=path%>/market/main/images/blance.jpg"/><br>
                        <h2>下面方式会获得余额：</h2>
                        <p>1. 会员每个月返回本金</p>
                        <p>2. 货到付款订单发生退货，对应支付款会退到余额中（包括退货导致的快递费用）。</p>
                        <p>3. 如果您的订单用余额支付，退货时会将对应支付款会退到余额中。</p>
                        <h2>使用余额支付：</h2>
                        <p>您可以使用余额为您的订单付款，根据余额和订单金额的不同，您可以使用余额支付全部订单金额或者使用余额支付一部分，余下部分用其他方式付款。</p>
                        <p>勾选使用余额支付后，会弹出余额支付安全验证的窗口（每次使用余额前都需要安全验证）。点击获取验证码，在等待短时间（正常情况下1分钟内）系统会给您绑定的手机号发送一条验证短信，其中包括校验码，请输入手机短信收到的校验码，并输入下方图片中的验证码。再点击确认，如果验证通过，余额就可以正常使用了。</p>
                        <h2>余额提现</h2>
                        <p>用户余额是可以提现的（礼品卡充值的余额除外），提现的余额可以转出到您的支付宝账户或银行卡（信用卡不支持提现）。如果需要提取余额，请在<font color="red" style="text-underline-position: auto">我的余额</font>里面选择提现。</p>

                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <div class="clear"></div>
	<jsp:include page="../main/footer.jsp" flush="true"></jsp:include>
	</body>
</html>