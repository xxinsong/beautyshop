<%@ page language="java" pageEncoding="utf-8"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/market/main/js/topnav.js"></script>

<div class="topbar">
    <div class="wrap" style="z-index:2000;">
		<div class="top_l">
			<span id="welcome_msg">您好，欢迎光临！</span>
			<span>
			    <a href="javascript: void(0);" id="loginBtn">请登录</a>
			    <a href="javascript: void(0);" id="registerBtn">免费注册</a>
			    <a href="javascript: void(0);" id="logoutBtn" style="display: none;">[退出]</a>
			</span>
		</div>
		<div class="top_r">
            <div class="top_ul">
                <a href="<%=request.getContextPath()%>/app/download">手机客户端</a><span>|</span>
                <a href="<%=request.getContextPath()%>/order">我的订单</a><span>|</span>
                <a href="javascript: void(0)" class="" id="user_center" rel_div="user_center_list">个人中心<i class="arrow"></i></a>
                <div class="top_ul_selected" style="display: none;" id="user_center_list" rel_a="user_center">
                    <ul>
                        <li><a href="<%=request.getContextPath()%>/setting/account">账户信息</a></li>
                        <li><a href="<%=request.getContextPath()%>/setting/security">安全设置</a></li>
                        <li><a href="<%=request.getContextPath()%>/message">我的消息</a></li>
                        <li><a href="<%=request.getContextPath()%>/setting/address">我的地址</a></li>
                    </ul>
                </div>
                <span>|</span><a href="<%=request.getContextPath()%>/mycart">购物车</a>
                <%--<a href="javascript: void(0)">网站导航<i class="arrow"></i></a>--%>
            </div>
        </div>
    </div>
</div>