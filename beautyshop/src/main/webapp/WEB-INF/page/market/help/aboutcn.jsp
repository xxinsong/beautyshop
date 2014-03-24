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
//                switchMainMenu($("#service"));
                switchMenu($("#mnu_aboutcn"));
            });
    	</script>
	</head>
	<body>
		<jsp:include page="../main/header.jsp" flush="true"></jsp:include>
        <jsp:include page="helpmenu.jsp" flush="true"></jsp:include>
        <%--<div style="border:1px solid #dcdcdc;padding-left:225px;width:1000px">
            <img style="" src="<%=path%>/market/main/images/identify.jpg"/>
        </div>--%>
        <div class="detailR" <%--style="padding-left:225px;width:775px; float:left;"--%>>
            <div class="pers_cen_div mt">
                <div class="pers_cen_title">
                    <h3>关于我们</h3>
                </div>
                <div class="pers_cen_con">
                    <div class="announce_content">
                        <p >韩塑美，是一家由韩国整形专家打造品牌及美妆垂直电商为一体的分享平台。韩塑美坚持自产自销，拥有由韩国整形专家专为亚洲女性研发的韩瘦美品牌以及引进韩国高科技成分和护肤技术的薇真品牌，以为女性提供时尚美容解决方案为主要服务宗旨，致力于创造简单、有趣、创造财富、分享快乐、值得信赖的化妆品购物体验，让消费者拥有良好的服务体验，进而取得消费者的信任。韩塑美拥独创的有完整专业的销售体系，自建渠道、仓储和物流，立志做女性化妆品专业分享型网站。</p>
                        <br>
                        <p >韩塑美面膜：韩国专家针对亚洲女性特定一款活化细胞、还颜童肤、深度锁水高科技面膜。</p>
                        <br>
                        <p >韩塑美总公司会不断寻找新产品上线，不断建立新的销售体系，使大家都有机会站在销售体系的上层，获得更多的利益。新产品可以由会员推介（推介者可以安排在体系最顶端优先分配利益），可由公司寻找新产品，或直接引进厂家的新产品。新产品要满足绿色、环保、廉价的日用消费品或者生活吃穿住行。</p>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <div class="clear"></div>
	<jsp:include page="../main/footer.jsp" flush="true"></jsp:include>
	</body>
</html>