<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="library" content="market" />
<title>数据超市</title>
<script type="text/javascript" src="<%=path%>/public/core/EasyuiZX.js"></script>
<script type="text/javascript" src="<%=path%>/market/news/js/news.js"></script>
<style>
	.ntc_title
	{
	/*margin:auto;*/
	width:90%;
	width:900px;
	height:30px;
	padding-top: 18px;	
	padding-bottom: 36px;
	line-height: 200%
	}
	.article_context {
	margin-left:25px;
	width:85%;
	width:920px;
	line-height: 150%;
    color: #333333;
    font-size: 14px;
	}
	.article_bd {
	border-top: #E8E8E8 solid 1px;
	padding-top: 36px;	
	min-height: 400px;
	overflow: hidden;
	}
	.article_tit {
	font-size: 18px;
    font-weight: bold;
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
	<%--<div class="positionDiv"><a href="javascript: void(0)">首页</a> <span>></span> <a href="javascript: void(0)">新闻中心</a>
	</div>--%>

    <div class="wrap">
        <div class="detailL">
            <div class="user_left_side mt">
                <div class="user_div">
                    <div class="uesr_title">
                        <h2><i class="userico02"></i><img src="<%=request.getContextPath()%>/market/main/images/news.png" width="24" height="24" class="menuic" />新闻中心</h2>
                    </div>
                    <div class="user_content">
                        <ul class="user_list" id="newsCatg">
                            <%--<li class="curr"><a href="<%=request.getContextPath()%>/news/list/${item.value}">${item.name}</a></li>
                            <li id="mnu_invoice" class="curr"><a href="<%=request.getContextPath()%>/help/invoice">发票制度</a></li>
                            <li id="mnu_problems"><a href="<%=request.getContextPath()%>/help/problems">常见问题</a></li>
                            <li id="mnu_consuOrcomp"><a href="<%=request.getContextPath()%>/help/consuOrcomp">投诉咨询</a></li>
                            <li id="mnu_about"><a href="<%=request.getContextPath()%>/help/about">关于我们</a></li>
                            <li id="mnu_contact"><a href="<%=request.getContextPath()%>/help/contact">联系我们</a></li>
                            <li id="mnu_talente"><a href="<%=request.getContextPath()%>/help/talente">诚聘英才</a></li>
                            <li id="mnu_LegalNotices"><a href="<%=request.getContextPath()%>/help/legalNotices">法律声明</a></li>
                            <li id="mnu_friendConnection"><a href="<%=request.getContextPath()%>/help/links">友情链接</a></li>--%>
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
        <div class="pers_cen_div mt" id="newsListDiv">
            <div class="pers_cen_title">
                <h3 id="catg_name"></h3>
            </div>
            <div class="pers_cen_con">
                <div width="100%" height="500px">
                    <table id="news_list" width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr id="row_tpl" style="display:none;line-height: 22px" >
                            <td width="18px" style="vertical-align:middle">
                                <%--<div class="favs_content">--%>
                                    <img align="bottom" src="<%=request.getContextPath()%>/market/main/images/sanjiao.png" width="16" height="16" />
                                <%--</div>--%>
                            </td>
                            <td width="580px" style="font-size: 14px">
                                <a href="javascript:void(0);" name="news_title"></a>
                            </td>
                            <td style="font-size: 14px">
                                <p><span class="gray_font" name="publish_time">ss</span></p>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="news_page" style="display: block;" class="turnPageBottom">
                </div>
                <div class="clear"></div>

            </div>
        </div>
        <div id="newsDetailDiv" class="checkout" style="display:none ;margin-top: 10px;background-color: #fff; ">
            <div class="ntc_title">
                <h3 class="article_tit" id="news_title">标题标题标题标题标题标题</h3>
                <p class="article_info" ><span id="publisher">作者:管理员</span><span id="publish_time" style="margin-left: 10px">发布时间:2014-03-15</span></p>
            </div>
            <div class = "article_bd" >
                <div class="article_context" id="news_context">
                </div>
            </div>
        </div>
    </div>

</div>
<jsp:include page="../main/footer.jsp" flush="true"></jsp:include>
</body>
</html>
