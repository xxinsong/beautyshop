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
                switchMainMenu($("#ensure"));
                switchMenu($("#mnu_ensure"));
                $("#sec_mnu").html("正品保证");
            });
    	</script>
	</head>
	<body>
		<jsp:include page="../main/header.jsp" flush="true"></jsp:include>
        <jsp:include page="helpmenu.jsp" flush="true"></jsp:include>
        <%--<div style="border:1px solid #dcdcdc;padding-left:225px;width:1000px">
            <img style="" src="<%=path%>/market/main/images/identify.jpg"/>
        </div>--%>
        <div class="detailR"<%-- style="padding-left:225px;width:775px; float:left;"--%>>
            <div class="pers_cen_div mt">
                <div class="pers_cen_title">
                    <h3>正品保证</h3>
                </div>
                <div class="pers_cen_con">
                    <div class="announce_content" align="center">
                        <img src="<%=path%>/market/main/images/ensure.jpg"/><br>
                        <img src="<%=path%>/market/main/images/100pct.png"/>
                        <p >以独一无二的诚挚和专注，韩塑美颠覆了化妆品护肤产品分享的最高体验标准。</p>
                        <p>最苛刻严格的100%韩国原装采购流程，6小时闪电发货标准，30天无拆封无条件退货政策。</p>
                        <p>韩塑美对每一个细节极致打磨，打造最值得信赖的分享体验。</p>
                        <p>让肌肤享受从UV的完美脱变，媲美微整形的瘦脸面膜。</p>
                        <p>相信千万用户信赖选择，相信韩塑美优品！</p>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <div class="clear"></div>
	<jsp:include page="../main/footer.jsp" flush="true"></jsp:include>
	</body>
</html>