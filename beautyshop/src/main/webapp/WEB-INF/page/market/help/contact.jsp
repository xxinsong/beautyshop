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
    	<script type="text/javascript" src="<%=path%>/market/help/js/contact.js"></script>
	</head>
	<body>
		<jsp:include page="../main/header.jsp" flush="true"></jsp:include>
		<jsp:include page="helpmenu.jsp" flush="true"></jsp:include>
		<div class="detailR">
     		<div class="pers_cen_div mt">
                <div class="pers_cen_title">
                	<h3>联系我们</h3>
                </div>
                <div class="pers_cen_con">
                	<div class="announce_content">
						<h2>电话服务中心联系方式 </h2>
						<p>如果您对韩塑美的产品有任何疑问，或对我们的服务有任何意见或建议，欢迎您直接与我们联络，我们将竭诚为您服务。</p>
						<p>电话服务中心工作时间：周一至周日8时—21时（春节法定假日期间如有工作时间的调整，以网站公告时间为准）</p>
						<p>全国免费咨询热线：400-0282-113</p>
						<p>客服邮箱：249309847@qq.com</p>

						<h2>公司地址</h2>
                        <p>联系方式：0755-22675837</p>
						<p>深圳市南山区南海大道海王大厦A座23B韩塑美科技公司</p>
					</div>
                    <div class="clear"></div>  
      			</div>
            </div>
        </div>
		<div class="clear"></div>
		<div class="consult_div" id="consult_tpl_answer" style="display: none;">
			<div class="faq"><span name="content"></span><span class="faq_time" name="commit_time"></span></div>
			<div class="answer" name="answer"><span name="reply_content"></span><span class="faq_time" name="reply_time"></span></div>
         </div>
         <div class="consult_div" id="consult_tpl_noanswer" style="display: none;">
			<div class="faq"><span name="content"></span><span class="faq_time" name="commit_time"></span></div>
			<div class="noAnswer" name="noAnswer"></div>
         </div>
	<jsp:include page="../main/footer.jsp" flush="true"></jsp:include>
	</body>
</html>