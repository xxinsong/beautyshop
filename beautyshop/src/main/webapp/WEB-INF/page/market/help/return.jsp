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
                switchMenu($("#mnu_return"));
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
                    <h3>退货办理</h3>
                </div>
                <div class="pers_cen_con">
                    <div class="announce_content">
                        <h2>在韩塑美办理退货手续简单而方便，请您按下列步骤办理。</h2>
                        <p>阅读我们的退货政策，确认您要退的商品符合退货要求。</p>
                        <p>	填写退货申请表（只需2分钟）</p>
                        <p>	您的退货申请被批准后，您的注册邮箱将收到一封确认邮件，请根据邮件中地址将退货产品寄回。</p>
                        <p>	收到货品后，聚美优品客服代表将于7天内与您确认退款。退货完成！</p>
                        <p>	退货流程示意：</p>
                        <img src="<%=path%>/market/main/images/return.jpg"/><br>

                        <h2>1. 填写“退货申请表”</h2>
                        <p>在韩塑美网站底部点击　“退货办理” 进入后 填写 “退货申请”</p>
                        <img src="<%=path%>/market/main/images/rtnapply.jpg"/><br>
                        <h2>2. 待客服确认</h2>
                        <p>我们的客服将打电话跟您确认退货信息，退货批准后您将同时收到一条退货短信和一封确认退货信息的邮件。</p>
                        <p>请根据邮件或短信中的地址将退货产品退回。</p>
                        <p>点击 “我的退货进度” 可查看退货进度。</p>
                        <h2>3. 寄回退货商品</h2>
                        <p>您退货产生的运费将由自己承担。</p>
                        <p>填写发货单背面的售后服务单，连同商品寄回到短信或邮件中提示的地址。</p>
                        <h2>4. 客服收退货后退款</h2>
                        <p>收到退货商品后， 我们会于7天内将退款发出。</p>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <div class="clear"></div>
	<jsp:include page="../main/footer.jsp" flush="true"></jsp:include>
	</body>
</html>