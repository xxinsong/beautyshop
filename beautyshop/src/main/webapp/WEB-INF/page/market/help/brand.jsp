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
//                switchMainMenu($("#service"));
                switchMenu($("#mnu_brand"));
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
                    <h3>品牌招商</h3>
                </div>
                <div class="pers_cen_con">
                    <div class="announce_content">
                        <img src="<%=path%>/market/main/images/brand.jpg"/><br>
                        <br>
                        <br>
                        <p >韩塑美的会员群体是为数众多的年轻人群、白领女性群体以及
                            名牌爱好者。通过各类有针对性的营销手法，韩塑美目前已经积累了一定的用户基础。
                            可利用站内所经营的品牌优势，树立品牌信用，扩大品牌影响力，并针对不同受众进行品牌特卖，增强网站会员凝聚力。
                        </p>
                        <br>
                        <p >韩塑美配有专业团队为品牌作包装宣传：设计团队为品牌制作形象展示动画，编辑团队以品牌故事及品牌资讯在“时尚会”作文字推广，客服团队每周进行品牌知识培训，把品牌信息带给消费者，加深其对品牌的印象。</p>
                        <br>
                        <p >韩塑美拥有专业的商业数据统计系统，品牌售卖结束后，会把全方位的统计数据（包括热销款式、客户群体分布状况、地区售卖情况、消费者反响等）反馈给品牌合作商，为其市场战略提供有价值的参考。
                            我们有专业拍摄、设计及制作团队，由专业资深人员把关，通过富有表现力的商品图片，充分展示各名牌商品的品牌意韵及特点。
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