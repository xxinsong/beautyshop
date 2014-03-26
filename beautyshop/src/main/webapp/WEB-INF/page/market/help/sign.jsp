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
                switchMenu($("#mnu_sign"));
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
                    <h3>验货签收</h3>
                </div>
                <div class="pers_cen_con">
                    <div class="announce_content">
                        <h2>关于快递问题导致的订单纠纷</h2>
                        <p>请您签收货品时，尽量在快递人员在场时当面检查商品（如果快递人员坚持先前签收再验货，可以在签收之后立刻检查）。请注意——</p>
                        <br>
                        <p>1. 务必检查封箱胶带是否为韩塑美专用胶带，胶带是否有被拆开重新粘贴过的痕迹。</p>
                        <p>2. 务必检查包装箱是否为韩塑美专用粉色包装箱，包装箱上是否有韩塑美客户留档信息。</p>
                        <p>3. 快递包装是否有破损、渗漏、缺少等现象。</p>
                        <p>4. 若出现以上情况，建议您尽快与我们取得联系，并拍照存档，把照片发给我们的客服人员，以便我们对物流快递公司进行追责。</p>
                        <br>
                        <p>当然，根据我们的30天无条件退货政策，无论是因为快递还是其他原因导致商品破损、渗漏等现象，只要您有意退货，我们都会马上为您办理退货手续。 客服热线（免长途费）：4000-282-113</p>
                        <br>
                        <p>请注意：价值500元以上商品不支持30天无条件退货政策，拆封后如无质量问题不退不换。请您务必在签收时仔细检查货品包装是否完好，因物流原因造成损坏的，请立即致电我们的客服人员为您处理。</p>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <div class="clear"></div>
	<jsp:include page="../main/footer.jsp" flush="true"></jsp:include>
	</body>
</html>