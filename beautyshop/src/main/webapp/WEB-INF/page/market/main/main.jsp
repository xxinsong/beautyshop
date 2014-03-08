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
<script type="text/javascript" src="<%=path%>/market/main/js/main.js"></script>
<script type="text/javascript" src="<%=path%>/market/main/js/jquery.KinSlideshow-1.2.1.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp" flush="true">
     <jsp:param name="from_page" value="main"/>
</jsp:include>
<div class="content">
	<div class="wrap clearfix">
		<div class="left_side">
			<div class="promo_show">
				<div class="promo_wrapper">
					<ol class="clearfix" style="">
                    	<li flag="7">
                            <%--<a target="_blank" class="big_pic" href="#">
                                <img src="<%=path%>/market/main/images/flash_pic01.jpg" alt="1号店-生活电器中心-夏降到底3折起">
                            </a>--%>
                            <div id="KinSlideshow"  style="visibility:hidden;">
                            </div>
                            <div class="mini_promo clearfix">
                            </div>
                            <a id ="templSecondeId" target="_blank" href="#" class="templClass" style="display: none;">
                                <img src="#" alt="1号店-生活电器中心-夏降到底3折起">
                                <div class="transCon"></div>
                                <div class="open_pop">
                                    <p class="p_title">鼠标停留后滑出，商品标题名称</p>
                                    <p class="p_info"><span class="price">折扣价:￥998</span><span class="comment">评论(99999)</span></p>
                                </div>
                            </a>
                            <%--<div class="mini_promo clearfix">
                                <a target="_blank" href="#">
                                    <img src="<%=path%>/market/main/images/flash_mini_01.jpg" alt="1号店-生活电器中心-夏降到底3折起">
                                    <div class="transCon"></div>
                                    <div class="open_pop">
                                    	<p class="p_title">鼠标停留后滑出，商品标题名称</p>
                                        <p class="p_info"><span class="price">折扣价:￥998</span><span class="comment">评论(99999)</span></p>
                                    </div>
                                </a>
                                <a target="_blank" href="#">
                                    <img src="<%=path%>/market/main/images/flash_mini_02.jpg" alt="行车记录仪之大起底">
                                    <div class="transCon"></div>
                                    <div class="open_pop">
                                    	<p class="p_title">鼠标停留后滑出，商品标题名称</p>
                                        <p class="p_info"><span class="price">折扣价:￥998</span><span class="comment">评论(99999)</span></p>
                                    </div>
                                </a>
                                <a target="_blank" href="http://channel.yihaodian.com/dianqi/1/">
                                    <img src="<%=path%>/market/main/images/flash_mini_03.jpg" alt="电器城">
                                    <div class="transCon"></div>
                                    <div class="open_pop">
                                    	<p class="p_title">鼠标停留后滑出，商品标题名称</p>
                                        <p class="p_info"><span class="price">折扣价:￥998</span><span class="comment">评论(99999)</span></p>
                                    </div>
                                </a>
                            </div>--%>
						</li>						
					</ol>
				</div>
				<div class="show_num_bg"></div>
                <%--<ul>
                    <li class="cur"></li>
                    <li class=""></li>
                    <li class=""></li>
                    <li class=""></li>
                </ul>--%>
            </div>
		</div>
 		<div class="right_side">
        	<%--<div class="right_info"><img src="<%=path%>/market/main/images/right_gg_01.jpg" width="218" height="90" /></div>
            <div class="right_info news_div">--%>
            <div class="right_info" id="right_info"></div>
            <div class="right_info news_div">
                <h2>特百公告</h2>
                <div class="news_content" style="display: none;">
                    <ul class="news_list">
                        <li><a href="javascript: void(0)">·这里是公告的标题</a></li>
                        <li><a href="javascript: void(0)">·这里是公告的标题</a></li>
                        <li class="last"><a href="javascript: void(0)">·这里是公告的标题</a></li>
                    </ul>
                </div>
                <div class="news_content" id="top_notices">
                </div>
            </div>
            <div class="right_info" id="quick_user_div">
            	<div class="only_yhd_div" style="display: ;">
                	<div class="user_msg_div">
                    	<div class="user_msg_pic"><img src="<%=path%>/market/main/images/user_pic.gif" width="50" height="50" /></div>
                        <div class="user_msg_txt">
                        	<p>Hi,<a href="javascript: void(0)">未登录</a></p>
                            <p style="display: none;">当前积分: <span class="integral">--</span></p>
                        </div>
                    </div>
                    <div class="user_no_login">
                    	<a href="javascript: void(0)" class="user_login_btn" name="btn_user_login">登录</a>
                        <a href="javascript: void(0)" class="new_register user_login_btn" name="btn_user_register">免费注册</a>
                    </div>
                </div>
                <div class="only_yhd_div" style="display: none;">
                	<div class="user_msg_div">
                    	<div class="user_msg_pic"><img src="<%=path%>/market/main/images/user_pic.gif" width="50" height="50" /></div>
                        <div class="user_msg_txt">
                        	<p>Hi,<span class="userName" name="userName"></span><a href="javascript: void(0)" class="login_out" name="btn_logout">登出</a></p>
                            <p>当前积分: <span class="integral" name="userPoint">0</span></p>
                        </div>
                    </div>
                    <div class="user_login">
                    	<a id="availableGoods" href="javascript: void(0)">
                        	<p class="number" name="deliver">0</p>
                            <p class="nameCurr">已发货</p>
                        </a>
                        <a id="waitForPay" href="javascript: void(0)">
                        	<p class="number" name="userBePaid">0</p>
                            <p class="nameCurr">待支付</p>
                        </a>
                        <%--<a id="waitForComment" href="javascript: void(0)" class="last">
                        	<p class="number">0</p>
                            <p class="nameCurr">待评价</p>
                        </a>--%>
                    </div>
                </div>
          	</div>  
   	  	</div>
	</div>
</div>
<div class="wrap index_floor floor1 floor_height" style="display: none;">
	<div class="clearfix floor_wrap">
        <div class="middle_module">
        	<ul class="tab_li">
            	<li class="curr"><a href="#">热销商品分类</a></li>
            	<li><a href="#">热销商品分类</a></li>
            	<li><a href="#">热销商品分类</a></li>
                <div class="clear"></div>
            </ul>
            <div style="display:block ;" class="tab_li_content none">
                <ul class="clearfix">
                    <li>
                        <a title="Philips 飞利浦 电饭煲 HD3060" class="pro_img" href="#"><img src="<%=path%>/market/main/images/pic150X150_01.jpg"></a>
                        <a target="_blank" title="商品名称一行十二个字，字数多可换行，最多两行…" href="#" class="pro_name">商品名称一行十二个字，字数多可换行，最多两行…</a>
                        <p class="starCon"><span class="star fivestar"></span></p>
                      	<p class="tl">折扣价：<strong>¥399</strong><del>￥1298</del></p>
                        <p class="buyOn"><span>售出(99999)</span><span>评论(99999)</span></p>
                    </li>
                    <li>
                    	<span class="yize"></span>
                        <a title="Philips 飞利浦 电动剃须刀 PQ182" class="pro_img" href="#"><img src="<%=path%>/market/main/images/pic150X150_02.jpg"></a>
                        <a target="_blank" title="商品名称一行十二个字，字数多可换行，最多两行…" href="#" class="pro_name">商品名称一行十二个字，字数多可换行，最多两行…</a>
                        <p class="starCon"><span class="star fivestar"></span></p>
                      	<p class="tl">折扣价：<strong>¥399</strong><del>￥1298</del></p>
                        <p class="buyOn"><span>售出(99999)</span><span>评论(99999)</span></p>
                    </li>
                    <li>
                    	<span class="zhij"></span>
                        <a target="_blank" title="长城世喜 高效清洁玻璃水 1.8L CCB-002" class="pro_img" href="#"><img src="<%=path%>/market/main/images/pic150X150_03.jpg"></a>
                        <a target="_blank" title="商品名称一行十二个字，字数多可换行，最多两行…" href="#" class="pro_name">商品名称一行十二个字，字数多可换行，最多两行…</a>
                        <p class="starCon"><span class="star fivestar"></span></p>
                      	<p class="tl">折扣价：<strong>¥399</strong><del>￥1298</del></p>
                        <p class="buyOn"><span>售出(99999)</span><span>评论(99999)</span></p>
                    </li>
                    <li class="">
                        <a target="_blank" title="Povos 奔腾 电水壶S1873 银色" class="pro_img" href="#"><img src="<%=path%>/market/main/images/pic150X150_04.jpg"></a>
                        <a target="_blank" title="商品名称一行十二个字，字数多可换行，最多两行…" href="#" class="pro_name">商品名称一行十二个字，字数多可换行，最多两行…</a>
                        <p class="starCon"><span class="star fivestar"></span></p>
                      	<p class="tl">折扣价：<strong>¥399</strong><del>￥1298</del></p>
                        <p class="buyOn"><span>售出(99999)</span><span>评论(99999)</span></p>
                    </li>
                    <li class="rightnor">
                    	<span class="tehui"></span>
                        <a target="_blank" title="长城世喜 高效清洁玻璃水 1.8L 2瓶装 CCB-027" class="pro_img" href="#"><img src="<%=path%>/market/main/images/pic150X150_05.jpg"></a>
                        <a target="_blank" title="商品名称一行十二个字，字数多可换行，最多两行…" href="#" class="pro_name">商品名称一行十二个字，字数多可换行，最多两行…</a>
                        <p class="starCon"><span class="star fivestar"></span></p>
                      	<p class="tl">折扣价：<strong>¥399</strong><del>￥1298</del></p>
                        <p class="buyOn"><span>售出(99999)</span><span>评论(99999)</span></p>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="wrap index_floor floor1 floor_height">
	<div class="clearfix floor_wrap">
        <div class="middle_module" id="hot_goods_div">
        	<div class="pro_title">
            	<h2>热销商品</h2>
            </div>
            <div class="div_loading">
				<span>加载中...</span>
			</div>
        </div>
    </div>
</div>
<div class="wrap index_floor floor1 floor_height" style="display: none;">
	<div class="clearfix floor_wrap">
        <div class="middle_module">
        	<ul class="tab_li">
            	<li class="curr"><a href="#">热销商品分类</a></li>
            	<li><a href="#">热销商品分类</a></li>
            	<li><a href="#">热销商品分类</a></li>
                <div class="clear"></div>
            </ul>
            <div style="display:block ;" class="tab_li_content none">
                <ul class="clearfix">
                    <li>
                        <a title="Philips 飞利浦 电饭煲 HD3060" class="pro_img" href="#"><img src="<%=path%>/market/main/images/pic150X150_01.jpg"></a>
                        <a target="_blank" title="商品名称一行十二个字，字数多可换行，最多两行…" href="#" class="pro_name">商品名称一行十二个字，字数多可换行，最多两行…</a>
                        <p class="starCon"><span class="star fivestar"></span></p>
                      	<p class="tl">折扣价：<strong>¥399</strong><del>￥1298</del></p>
                        <p class="buyOn"><span>售出(99999)</span><span>评论(99999)</span></p>
                    </li>
                    <li>
                    	<span class="yize"></span>
                        <a title="Philips 飞利浦 电动剃须刀 PQ182" class="pro_img" href="#"><img src="<%=path%>/market/main/images/pic150X150_02.jpg"></a>
                        <a target="_blank" title="商品名称一行十二个字，字数多可换行，最多两行…" href="#" class="pro_name">商品名称一行十二个字，字数多可换行，最多两行…</a>
                        <p class="starCon"><span class="star fivestar"></span></p>
                      	<p class="tl">折扣价：<strong>¥399</strong><del>￥1298</del></p>
                        <p class="buyOn"><span>售出(99999)</span><span>评论(99999)</span></p>
                    </li>
                    <li>
                    	<span class="zhij"></span>
                        <a target="_blank" title="长城世喜 高效清洁玻璃水 1.8L CCB-002" class="pro_img" href="#"><img src="<%=path%>/market/main/images/pic150X150_03.jpg"></a>
                        <a target="_blank" title="商品名称一行十二个字，字数多可换行，最多两行…" href="#" class="pro_name">商品名称一行十二个字，字数多可换行，最多两行…</a>
                        <p class="starCon"><span class="star fivestar"></span></p>
                      	<p class="tl">折扣价：<strong>¥399</strong><del>￥1298</del></p>
                        <p class="buyOn"><span>售出(99999)</span><span>评论(99999)</span></p>
                    </li>
                    <li class="">
                        <a target="_blank" title="Povos 奔腾 电水壶S1873 银色" class="pro_img" href="#"><img src="<%=path%>/market/main/images/pic150X150_04.jpg"></a>
                        <a target="_blank" title="商品名称一行十二个字，字数多可换行，最多两行…" href="#" class="pro_name">商品名称一行十二个字，字数多可换行，最多两行…</a>
                        <p class="starCon"><span class="star fivestar"></span></p>
                      	<p class="tl">折扣价：<strong>¥399</strong><del>￥1298</del></p>
                        <p class="buyOn"><span>售出(99999)</span><span>评论(99999)</span></p>
                    </li>
                    <li class="rightnor">
                    	<span class="tehui"></span>
                        <a target="_blank" title="长城世喜 高效清洁玻璃水 1.8L 2瓶装 CCB-027" class="pro_img" href="#"><img src="<%=path%>/market/main/images/pic150X150_05.jpg"></a>
                        <a target="_blank" title="商品名称一行十二个字，字数多可换行，最多两行…" href="#" class="pro_name">商品名称一行十二个字，字数多可换行，最多两行…</a>
                        <p class="starCon"><span class="star fivestar"></span></p>
                      	<p class="tl">折扣价：<strong>¥399</strong><del>￥1298</del></p>
                        <p class="buyOn"><span>售出(99999)</span><span>评论(99999)</span></p>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="wrap index_floor floor1 floor_height" style="display: none;">
	<div class="clearfix floor_wrap">
        <div class="middle_module">
        	<div class="pro_title">
            	<h2>热销商品分类</h2>
            </div>
            <div style="display:block ;" class="tab_li_content none">
                <ul class="clearfix">
                    <li>
                        <a title="Philips 飞利浦 电饭煲 HD3060" class="pro_img" href="#"><img src="<%=path%>/market/main/images/pic150X150_06.jpg"></a>
                        <a target="_blank" title="商品名称一行十二个字，字数多可换行，最多两行…" href="#" class="pro_name">商品名称一行十二个字，字数多可换行，最多两行…</a>
                        <p class="starCon"><span class="star fivestar"></span></p>
                      	<p class="tl">折扣价：<strong>¥399</strong><del>￥1298</del></p>
                        <p class="buyOn"><span>售出(99999)</span><span>评论(99999)</span></p>
                    </li>
                    <li>
                        <a title="Philips 飞利浦 电动剃须刀 PQ182" class="pro_img" href="#"><img src="<%=path%>/market/main/images/pic150X150_07.jpg"></a>
                        <a target="_blank" title="商品名称一行十二个字，字数多可换行，最多两行…" href="#" class="pro_name">商品名称一行十二个字，字数多可换行，最多两行…</a>
                        <p class="starCon"><span class="star fivestar"></span></p>
                      	<p class="tl">折扣价：<strong>¥399</strong><del>￥1298</del></p>
                        <p class="buyOn"><span>售出(99999)</span><span>评论(99999)</span></p>
                    </li>
                    <li>
                        <a target="_blank" title="长城世喜 高效清洁玻璃水 1.8L CCB-002" class="pro_img" href="#"><img src="<%=path%>/market/main/images/pic150X150_08.jpg"></a>
                        <a target="_blank" title="商品名称一行十二个字，字数多可换行，最多两行…" href="#" class="pro_name">商品名称一行十二个字，字数多可换行，最多两行…</a>
                        <p class="starCon"><span class="star fivestar"></span></p>
                      	<p class="tl">折扣价：<strong>¥399</strong><del>￥1298</del></p>
                        <p class="buyOn"><span>售出(99999)</span><span>评论(99999)</span></p>
                    </li>
                    <li class="">
                        <a target="_blank" title="Povos 奔腾 电水壶S1873 银色" class="pro_img" href="#"><img src="<%=path%>/market/main/images/pic150X150_09.jpg"></a>
                        <a target="_blank" title="商品名称一行十二个字，字数多可换行，最多两行…" href="#" class="pro_name">商品名称一行十二个字，字数多可换行，最多两行…</a>
                        <p class="starCon"><span class="star fivestar"></span></p>
                      	<p class="tl">折扣价：<strong>¥399</strong><del>￥1298</del></p>
                        <p class="buyOn"><span>售出(99999)</span><span>评论(99999)</span></p>
                    </li>
                    <li class="rightnor">
                        <a target="_blank" title="长城世喜 高效清洁玻璃水 1.8L 2瓶装 CCB-027" class="pro_img" href="#"><img src="<%=path%>/market/main/images/pic150X150_10.jpg"></a>
                        <a target="_blank" title="商品名称一行十二个字，字数多可换行，最多两行…" href="#" class="pro_name">商品名称一行十二个字，字数多可换行，最多两行…</a>
                        <p class="starCon"><span class="star fivestar"></span></p>
                      	<p class="tl">折扣价：<strong>¥399</strong><del>￥1298</del></p>
                        <p class="buyOn"><span>售出(99999)</span><span>评论(99999)</span></p>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp" flush="true"></jsp:include>
</body>
</html>
