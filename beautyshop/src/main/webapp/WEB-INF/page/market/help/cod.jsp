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
                switchMenu($("#mnu_cod"));
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
                    <h3>货到付款</h3>
                </div>
                <div class="pers_cen_con">
                    <div class="announce_content">
                        <h2 style="background-color: #f0f0f0">•	货到付款</h2>
                        <p>韩塑美在广东省开通货到付款啦！广东的用户均可以享受货到付款服务！</p>
                        <h2 style="background-color: #f0f0f0">•	支持地区</h2>
                        <p>广东省 广州、深圳、东莞、中山、佛山、珠海</p>
                        <h2 style="background-color: #f0f0f0">•	使用方法</h2>
                        <p>在您下单时，快递方式选择“普通快递”，在支付方式里选择“货到付款”即可。</p>
                        <img src="<%=path%>/market/main/images/cod.jpg"/><br>
                        <h2 style="background-color: #f0f0f0">•	注意事项</h2>
                        <p>	货到付款的订单不支持推迟发货/合并发货</p>
                        <p>	货到付款的订单在经过系统或客服确认之后（订单状态显示为已确认）才会计算库存占用，因此小美建议商品使用在线支付抢购，否则等到货到付款订单确认时可能已经抢光啦！</p>
                        <p>	韩塑美工作人员可能会与您电话确认订单，请填写常用的通讯号码</p>
                        <h2 style="background-color: #f0f0f0">•	常见问题</h2>
                        <h2>货到付款需要额外费用吗？</h2>
                        <p>不需要，与您正常使用普通快递一样收取快递费5元。</p>
                        <h2>是否可以开封验货？不满意是否可以拒收？</h2>
                        <p>您可以在快递员在场的时候打开包裹检查货物是否完整完好。如果您对收到的货物不满意，您可以选择当场拒收整个包裹（不支持部分拒收，如果需要退回部分商品，请在签收之后发起部分退货）</p>
                        <br>
                        <p style="font-weight: bold">在试点过程中我们会积极听取大家的反馈，如果您对我们的货到付款业务有任何意见或建议，欢迎与韩塑美客服联系，期待您的反馈：)</p>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <div class="clear"></div>
	<jsp:include page="../main/footer.jsp" flush="true"></jsp:include>
	</body>
</html>