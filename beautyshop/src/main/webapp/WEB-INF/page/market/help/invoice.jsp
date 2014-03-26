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
    	<script type="text/javascript" src="<%=path%>/public/core/EasyuiZX.js"></script>
    	<script type="text/javascript" src="<%=path%>/market/help/js/invoice.js"></script>
	</head>
	<body>
		<jsp:include page="../main/header.jsp" flush="true"></jsp:include>
		<jsp:include page="helpmenu.jsp" flush="true"></jsp:include>
		<div class="detailR">
     		<div class="pers_cen_div mt">
                <div class="pers_cen_title">
                	<h3>发票制度</h3>
                </div>
                <div class="pers_cen_con">
                	<div class="announce_content">
						<h2>发票制度，不知道放什么东西在这个里面！！！</h2>
						<p>随便写点东西，当作测试！！</p>
						<h2>如何验证手机和邮箱？</h2>
						<p>方法一：登录京东账户，在“我的京东-账户中心-账户安全”里，您可以修改密码、绑定账户到邮箱和手机、设置支付密码：
						<br />方法二：在“我的京东”首页个人信息栏点击“手机未验证”、“邮箱未验证”、“未设置支付密码”进行相应的设置。</p>
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