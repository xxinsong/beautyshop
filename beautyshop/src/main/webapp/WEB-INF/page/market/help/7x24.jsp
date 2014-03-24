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
                switchMenu($("#mnu_7x24"));
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
                    <h3>7x24小时客服服务</h3>
                </div>
                <div class="pers_cen_con">
                    <div class="announce_content">
                        <h2 style="background-color: #f0f0f0">•	客服温馨提示 </h2>
                        <p>为了减少您可能的等待时间，您不妨先仔细阅读下面的常见问题。 查询物流状态，退货，退余额等操作均可以登录韩塑美网站后自助进行，无需联系客服。如果仍无法解决。请您在本页页底联系在线客服，或拨打韩塑美客服电话。小美谢谢您的理解！</p>
                        <h2 style="background-color: #f0f0f0">•	热门常见问题</h2>
                        <h2>韩塑美订单什么时候发货？大概多长时间可以收到货？</h2>
                        <p>正常情况下您的订单将在6小时内发出（最晚不超过1个工作日）。发货之后，您可以在我的订单中可以查看发货状态。由于快递公司可能无法实时更新信息，因此您看到的发货情况可能有一定延迟。</p>
                        <h2>为什么后下的订单，先收到了，之前下的订单还没有收到？你们是按什么顺序发货的？</h2>
                        <p>为了单位时间内以最快速度处理尽量多订单，韩塑美会适当综合按订单里货品配货的情况安排发货顺序，因此可能会出现订单发货和下单顺序不完全一致的情况。我们会尽一切努力为您尽快发货。</p>
                        <h2>订单显示发货了，但快递信息为什么还没有更新？</h2>
                        <p>您在韩塑美订单页面看到的物流查询信息由快递公司传递提供。由于快递公司信息更新会有一定延迟，请您多多谅解。（延迟时间可能从1天到3天不等，EMS快递的物流配送信息可能最多可能有1周左右延迟）</p>
                        <h2>韩塑美产品收到后，发现漏发了或者错发，应该怎么办？</h2>
                        <p>请您先准备好漏发，错发的相关图片（拍摄图片），再通过在线客服核实，我们需要和品牌商方面进行确认，待客服确认后会进行补发或退款。</p>
                        <h2>为什么我已经收到产品，但是订单仍显示正在配货</h2>
                        <p>由于不同快递公司物流信息更新时间略有不同，当韩塑美订单发货后，部分快递信息可能会延迟返回给韩塑美。</p>
                        <h2>订单使用什么快递公司为客户发货？如何收费？</h2>
                        <p>订单生成后，我们将根据您所填写的地址自动匹配当地运营较好的快递公司。
                            一般情况下，收费标准为：快递5元， EMS邮费15元。以下情况可以免邮哟~
                            对于同一个由韩塑美发出的订单，我们实行买两件商品（无论是否同一款）即快递包邮的政策。如果您选择的是EMS发货，则减免5元运费；（第三方发货不适用）
                        </p>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <div class="clear"></div>
	<jsp:include page="../main/footer.jsp" flush="true"></jsp:include>
	</body>
</html>