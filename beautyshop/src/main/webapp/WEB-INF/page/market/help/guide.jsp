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
                switchMenu($("#mnu_guide"));
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
                    <h3>新手指南</h3>
                </div>
                <div class="pers_cen_con">
                    <div class="announce_content">
                        <h2 style="background-color: #f0f0f0">•	登陆或注册 </h2>
                        <h2>购物流程 </h2>
                        <img src="<%=path%>/market/main/images/buyproc.png"/><br>
                        <h2 style="background-color: #f0f0f0">•	新用户注册 </h2>
                        <p>1、点击页面右上方的“<font color="red">会员注册</font>”按钮注册韩塑美账号。</p>
                        <img src="<%=path%>/market/main/images/guide_reg.png"/><br>
                        <p>2、注册前请仔细阅读《韩塑美用户协议》，如无异议请点击“同意以下协议并注册”。请根据相应提示在信息栏内填入您的注册信息。</p>
                        <img src="<%=path%>/market/main/images/guide_reg2.png"/><br>

                        <h2 style="background-color: #f0f0f0">•	登录 </h2>
                        <p>1、如您已经拥有韩塑美账号，请点击页面右上方的“<font color="red">会员登录</font>”按钮</p>
                        <img src="<%=path%>/market/main/images/guide_sign.png"/><br>
                        <h2 style="background-color: #f0f0f0">•	登录 </h2>
                        <p>2、 在登录页面的信息栏内填入对应信息，点击“<font color="red">会员登录</font>”按钮进行登录，或通过选择登录框下方的合作账号进行快速登录。登录成功后，系统将自动跳转下一页。</p>
                        <img src="<%=path%>/market/main/images/guide_sign2.png"/><br>


                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <div class="clear"></div>
	<jsp:include page="../main/footer.jsp" flush="true"></jsp:include>
	</body>
</html>