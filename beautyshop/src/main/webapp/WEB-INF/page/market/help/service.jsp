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
                switchMainMenu($("#service"));
                switchMenu($("#mnu_service"));
                $("#sec_mnu").html("客户服务");
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
                    <h3>客户服务</h3>
                </div>
                <div class="pers_cen_con">
                    <div class="announce_content">
                        <p style="font-weight: bold">服务理念：以会员为中心，打造品牌服务</p>
                        <p style="font-weight: bold"> 服务宗旨：客户会员全面满意</p>
                        <p style="font-weight: bold">服务口号：心的付出、新的感受</p>
                        <p >•	客服服务是服务会员的重要窗口，负责向会员解答相关的业务咨询及受理各种投诉。</p>
                        <p >•	包括提供热线服务、在线回复、BBS帖子回复，网上业务信息安全审核等。</p>
                        <p >•	不断努力向会员客户提供服务支持。</p>
                        <p >•	专业化客服人员将为您提供全面、贴心、及时的优质金牌服务。</p>
                        <p >服务热线 :400-0282-113</p>
                        <img src="<%=path%>/market/main/images/service.png"/><br>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <div class="clear"></div>
	<jsp:include page="../main/footer.jsp" flush="true"></jsp:include>
	</body>
</html>