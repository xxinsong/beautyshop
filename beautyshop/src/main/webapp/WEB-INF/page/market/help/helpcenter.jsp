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
                switchMainMenu($("#helpcenter"));
                switchMenu($("#mnu_helpcenter"));
                $("#sec_mnu").html("帮助中心");
            });
    	</script>
	</head>
	<body>
		<jsp:include page="../main/header.jsp" flush="true"></jsp:include>
        <jsp:include page="helpmenu.jsp" flush="true"></jsp:include>
        <%--<div style="border:1px solid #dcdcdc;padding-left:225px;width:1000px">
            <img style="" src="<%=path%>/market/main/images/identify.jpg"/>
        </div>--%>
        <div class="detailR"<%-- style="padding-left:225px;width:800px; float:left;"--%>>
            <div class="pers_cen_div mt">
                <div class="pers_cen_title">
                    <h3>帮助中心</h3>
                </div>
                <div class="pers_cen_con">
                    <div class="announce_content">
                        <p style="font-weight: bold">•	购物流程</p>
                        <img src="<%=path%>/market/main/images/buyproc.png"/><br>
                        <p style="font-weight: bold">	使用帮助</p>
                        <p><a target="_blank" href="<%=request.getContextPath()%>/help/guide" style="font-size: 12px;padding-left: 25px;">新手指南</a></p>
                        <p><a target="_blank" href="<%=request.getContextPath()%>/help/problems" style="font-size: 12px;padding-left: 25px;">常见问题</a></p>
                        <p><a target="_blank" href="<%=request.getContextPath()%>/help/agreement" style="font-size: 12px;padding-left: 25px;">用户协议</a></p>
                        <p style="font-weight: bold">	支付相关</p>
                        <p><a target="_blank" href="<%=request.getContextPath()%>/help/cod" style="font-size: 12px;padding-left: 25px;">货到付款</a></p>
                        <p><a target="_blank" href="<%=request.getContextPath()%>/help/payonline" style="font-size: 12px;padding-left: 25px;">在线支付</a></p>
                        <p><a target="_blank" href="<%=request.getContextPath()%>/help/balance" style="font-size: 12px;padding-left: 25px;">余额支付</a></p>
                        <p><a target="_blank" href="<%=request.getContextPath()%>/help/cash" style="font-size: 12px;padding-left: 25px;">现金支付</a></p>
                        <p style="font-weight: bold">	配送方式</p>
                        <p><a target="_blank" href="<%=request.getContextPath()%>/help/post" style="font-size: 12px;padding-left: 25px;">买二包邮</a></p>
                        <p><a target="_blank" href="<%=request.getContextPath()%>/help/delivery" style="font-size: 12px;padding-left: 25px;">配送说明</a></p>
                        <p><a target="_blank" href="<%=request.getContextPath()%>/help/transfee" style="font-size: 12px;padding-left: 25px;">运费说明</a></p>
                        <p><a target="_blank" href="<%=request.getContextPath()%>/help/sign" style="font-size: 12px;padding-left: 25px;">验货签收</a></p>
                        <p style="font-weight: bold">	售后服务</p>
                        <p><a target="_blank" href="<%=request.getContextPath()%>/ensure" style="font-size: 12px;padding-left: 25px;">正品保证</a></p>
                        <p><a target="_blank" href="<%=request.getContextPath()%>/help/consult" style="font-size: 12px;padding-left: 25px;">售后咨询</a></p>
                        <p><a target="_blank" href="<%=request.getContextPath()%>/help/rtnpolicy" style="font-size: 12px;padding-left: 25px;">退货政策</a></p>
                        <p><a target="_blank" href="<%=request.getContextPath()%>/help/return" style="font-size: 12px;padding-left: 25px;">退货办理</a></p>
                        <p style="font-weight: bold">	韩塑美手机版</p>
                        <p><a target="_blank" href="<%=request.getContextPath()%>/app/download" style="font-size: 12px;padding-left: 25px;">手机客户端</a></p>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <div class="clear"></div>
	<jsp:include page="../main/footer.jsp" flush="true"></jsp:include>
	</body>
</html>