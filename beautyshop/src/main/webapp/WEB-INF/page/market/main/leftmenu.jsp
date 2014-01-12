<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/market/main/js/leftmenu.js"></script>"
<div class="contaiter">
    <div class="positionDiv"><a href="javascript: void(0)">首页</a> <span>></span> <a href="javascript: void(0)">个人中心</a> <span>></span> <a href="javascript: void(0)" id="curr_mnu"></a>
    </div>
    <div class="wrap">
        <div class="detailL">
            <div class="user_left_side mt">
                <div class="user_div">
                    <div class="uesr_title">
                        <h2><i class="userico02"></i><img src="<%=request.getContextPath()%>/market/main/images/menuic01.gif" width="24" height="24" class="menuic" />交易记录</h2>
                    </div>
                    <div class="user_content">
                        <ul class="user_list">
                            <li id="mnu_myorder" class="curr"><a href="<%=request.getContextPath()%>/order">我的订单</a></li>
                            <li id="mnu_mycart"><a href="<%=request.getContextPath()%>/mycart">我的购物车</a></li>
                            <li id="mnu_mycare" class="last"><a href="<%=request.getContextPath()%>/mycare">我的关注</a></li>
                        </ul>
                    </div>
                    <div class="uesr_title">
                        <h2><i class="userico02"></i><img src="<%=request.getContextPath()%>/market/main/images/menuic02.gif" width="24" height="24" class="menuic" />账户管理</h2>
                    </div>
                    <div class="user_content">
                        <ul class="user_list">
                            <li id="mnu_myaccount"><a href="<%=request.getContextPath()%>/setting/account">账户信息</a></li>
                            <li id="mnu_security"><a href="#">安全设置</a></li>
                            <li id="mnu_myaddress"><a href="<%=request.getContextPath()%>/setting/address">我的收货地址</a></li>
                            <li id="mnu_mymessage" class="last"><a href="#">我的消息</a></li>
                        </ul>
                    </div>
                    <%--<div class="uesr_title">
                        <h2><i class="userico02"></i><img src="<%=request.getContextPath()%>/market/main/images/menuic03.gif" width="24" height="24" class="menuic" />客户服务</h2>
                    </div>--%>
                    <%--<div class="user_content">
                        <ul class="user_list">
                            <li id="mnu_mycomplaint"><a href="#">我的投诉</a></li>
                            <li id="mnu_myquestion" class="last"><a href="#">我的咨询</a></li>
                        </ul>
                    </div>--%>
                </div>
            </div>
        </div>