<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="library" content="market" />
<title>数据超市</title>
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
	<div class="positionDiv"><a href="javascript: void(0)">首页</a> <span>></span> <a href="javascript: void(0)">系统公告</a>
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
