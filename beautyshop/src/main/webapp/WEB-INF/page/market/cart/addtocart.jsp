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
    <script type="text/javascript" src="<%=path%>/public/core/EasyuiZX.js"></script>
    <%--<script type="text/javascript" src="<%=path%>/market/cart/js/mycart.js"></script>--%>
</head>
<body>
<jsp:include page="../main/header.jsp" flush="true"></jsp:include>
<div class="m" id="succeed">

    <div class="corner tl"></div>
    <div class="corner tr"></div>
    <div class="corner bl"></div>
    <div class="corner br"></div>
    <div class="success">
        <div class="success-b">
            <h3>商品已成功加入购物车！</h3>
            <span id="flashBuy" style="display:none">商品数量有限，请您尽快下单并付款！</span>
        </div>
        <span id="initCart_next_go"><a id="GotoShoppingCart" href="<%=path%>/mycart" class="btn-pay">去结算</a><a href="<%=path%>/welcome" class="btn-continue">继续购物</a></span></div>

</div>
<jsp:include page="../main/footer.jsp" flush="true"></jsp:include>
</body>
</html>