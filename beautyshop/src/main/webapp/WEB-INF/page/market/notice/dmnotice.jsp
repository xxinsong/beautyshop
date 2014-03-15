<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="library" content="market" />
<title>韩塑美-您的美容专柜</title>
<script type="text/javascript" src="<%=path%>/public/core/EasyuiZX.js"></script>
<script type="text/javascript" src="<%=path%>/market/notice/js/dmnotice.js"></script>
<style>
	.ntc_title
	{
	margin:auto;
	width:80%;
	width:900px;
	height:30px;
	padding-top: 18px;	
	padding-bottom: 36px;
	line-height: 200%
	}
	.article_context {
	margin:auto;
	width:85%;
	width:920px;
	line-height: 150%
	}
	.article_bd {
	border-top: #E8E8E8 solid 1px;
	padding-top: 36px;	
	min-height: 400px;
	overflow: hidden;
	}
	.article_tit {
	font-size: 18px;
	font-family: \5FAE\8F6F\96C5\9ED1;
	text-align: center;
	}
	.article_info {
	color: #999999;
	text-align: center;
	margin-top: 2px;
	}
</style>
</head>
<body>
<jsp:include page="../main/header.jsp" flush="true"></jsp:include>
<div class="contaiter">
	<div class="positionDiv"><a href="javascript: void(0)">首页</a> <span>></span> <a href="javascript: void(0)">新闻中心</a>
	</div>

    <div class="wrap">
        <div class="detailL">
            <div class="user_left_side mt">
                <div class="user_div">
                    <div class="uesr_title">
                        <h2><i class="userico02"></i><img src="<%=request.getContextPath()%>/market/main/images/news.png" width="24" height="24" class="menuic" />新闻中心</h2>
                    </div>
                    <div class="user_content">
                        <ul class="user_list">
                            <li id="mnu_invoice" class="curr"><a href="<%=request.getContextPath()%>/help/invoice">发票制度</a></li>
                            <li id="mnu_problems"><a href="<%=request.getContextPath()%>/help/problems">常见问题</a></li>
                            <li id="mnu_consuOrcomp"><a href="<%=request.getContextPath()%>/help/consuOrcomp">投诉咨询</a></li>
                            <li id="mnu_about"><a href="<%=request.getContextPath()%>/help/about">关于我们</a></li>
                            <li id="mnu_contact"><a href="<%=request.getContextPath()%>/help/contact">联系我们</a></li>
                            <li id="mnu_talente"><a href="<%=request.getContextPath()%>/help/talente">诚聘英才</a></li>
                            <li id="mnu_LegalNotices"><a href="<%=request.getContextPath()%>/help/legalNotices">法律声明</a></li>
                            <li id="mnu_friendConnection"><a href="<%=request.getContextPath()%>/help/links">友情链接</a></li>
                        </ul>
                    </div>
                    <div class="user_content">
                        <ul class="user_list">
                            <li><img src="<%=request.getContextPath()%>/market/main/images/contactus.jpg"></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
		<div class="checkout" sytle="margin-top: 10px;background-color: #fff;">
			<div class="ntc_title">
				<h3 class="article_tit" id="notice_title"></h3> 
				<p class="article_info" id="title_time">时间</p>
			</div>
			<div class = "article_bd" id="notice_context">
				<div class="article_context" id="nt_dest"></div>
				<div>
					<br/>
				</div>
		     	<div class="article_context" id="nt_context">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
		     	<div>
					<br/>
				</div>
				<div class="article_context" id="nt_publisher"></div>
				<div class="article_context" id="nt_publishtime"></div>
			</div>
		</div>
</div>
<jsp:include page="../main/footer.jsp" flush="true"></jsp:include>
</body>
</html>
