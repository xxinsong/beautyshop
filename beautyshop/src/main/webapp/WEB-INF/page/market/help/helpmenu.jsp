<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/market/help/js/helpmenu.js"></script>
<div class="contaiter">
    <div class="positionDiv"><a href="javascript: void(0)">首页</a> <span>></span> <a href="javascript: void(0)" id="sec_mnu">帮助中心</a> <span>></span> <a href="javascript: void(0)" id="curr_mnu"></a>
    </div>
    <div class="wrap">
        <div class="detailL">
            <div class="user_left_side mt">
                <div class="user_div">
                    <div class="uesr_title">
                        <h2><%--<i class="userico02"></i><img src="<%=request.getContextPath()%>/market/main/images/menuic01.gif" width="24" height="24" class="menuic" />--%>使用帮助</h2>
                    </div>
                    <div class="user_content">
                        <ul class="user_list">
                            <li id="mnu_guide" class="curr"><a href="<%=request.getContextPath()%>/help/guide">新手指南</a></li>
                            <li id="mnu_problems"><a href="<%=request.getContextPath()%>/help/problems">常见问题</a></li>
                            <%--<li id="mnu_update"><a href="<%=request.getContextPath()%>/help/update">获取更新</a></li>--%>
                            <li id="mnu_agreement"><a href="<%=request.getContextPath()%>/help/agreement">用户协议</a></li>
                            <li id="mnu_mobile"><a href="<%=request.getContextPath()%>/ad?id=17">手机安装</a></li>
                        </ul>
                    </div>
                    <div class="uesr_title">
                        <h2><i class="userico02"></i><%--<img src="<%=request.getContextPath()%>/market/main/images/menuic01.gif" width="24" height="24" class="menuic" />--%>支付方式</h2>
                    </div>
                    <div class="user_content">
                        <ul class="user_list">
                            <li id="mnu_cod"><a href="<%=request.getContextPath()%>/help/cod">货到付款</a></li>
                            <li id="mnu_payonline"><a href="<%=request.getContextPath()%>/help/payonline">在线支付</a></li>
                            <li id="mnu_balance"><a href="<%=request.getContextPath()%>/help/balance">余额支付 </a></li>
                            <li id="mnu_cash"><a href="<%=request.getContextPath()%>/help/cash">现金支付</a></li>
                        </ul>
                    </div>
                    <div class="uesr_title">
                        <h2><i class="userico02"></i><%--<img src="<%=request.getContextPath()%>/market/main/images/menuic01.gif" width="24" height="24" class="menuic" />--%>配送相关</h2>
                    </div>
                    <div class="user_content">
                        <ul class="user_list">
                            <li id="mnu_post"><a href="<%=request.getContextPath()%>/help/post">买二包邮</a></li>
                            <li id="mnu_delivery"><a href="<%=request.getContextPath()%>/help/delivery">配送说明</a></li>
                            <li id="mnu_transfee"><a href="<%=request.getContextPath()%>/help/transfee">运费说明</a></li>
                            <li id="mnu_sign"><a href="<%=request.getContextPath()%>/help/sign">验货签收</a></li>
                        </ul>
                    </div>
                    <div class="uesr_title">
                        <h2><i class="userico02"></i><%--<img src="<%=request.getContextPath()%>/market/main/images/menuic01.gif" width="24" height="24" class="menuic" />--%>售后服务</h2>
                    </div>
                    <div class="user_content">
                        <ul class="user_list">
                            <li id="mnu_promise"><a href="<%=request.getContextPath()%>/help/promise">正品承诺</a></li>
                            <li id="mnu_consult"><a href="<%=request.getContextPath()%>/help/consult">售后咨询</a></li>
                            <li id="mnu_rtnpolicy"><a href="<%=request.getContextPath()%>/help/rtnpolicy">退货政策</a></li>
                            <li id="mnu_return"><a href="<%=request.getContextPath()%>/help/return">退货办理</a></li>
                        </ul>
                    </div>
                    <%--<div class="uesr_title">
                        <h2><i class="userico02"></i><img src="<%=request.getContextPath()%>/market/main/images/menuic01.gif" width="24" height="24" class="menuic" />服务保障</h2>
                    </div>
                    <div class="user_content">
                        <ul class="user_list">
                            <li id="mnu_alliance"><a href="<%=request.getContextPath()%>/ensure">正品保证</a></li>
                            &lt;%&ndash;<li id="mnu_100pct"><a href="<%=request.getContextPath()%>/help/100pct">100%正品保证</a></li>&ndash;%&gt;
                            &lt;%&ndash;<li id="mnu_30days"><a href="<%=request.getContextPath()%>/help/30days">30天无条件退货</a></li>&ndash;%&gt;
                            &lt;%&ndash;<li id="mnu_7x24"><a href="<%=request.getContextPath()%>/help/7x24">7x24小时客服服务</a></li>&ndash;%&gt;
                        </ul>
                    </div>--%>
                    <%--<div class="uesr_title">
                        <h2><i class="userico02"></i><img src="<%=request.getContextPath()%>/market/main/images/menuic01.gif" width="24" height="24" class="menuic" />账户相关</h2>
                    </div>
                    <div class="user_content">
                        <ul class="user_list">
                            <li id="mnu_invite"><a href="<%=request.getContextPath()%>/help/invite">邀请好友</a></li>
                            <li id="mnu_memlevel"><a href="<%=request.getContextPath()%>/help/memlevel">会员等级</a></li>
                            <li id="mnu_subscription"><a href="<%=request.getContextPath()%>/help/subscription">邮件订阅 </a></li>
                            <li id="mnu_sms"><a href="<%=request.getContextPath()%>/help/sms">短信订阅</a></li>
                        </ul>
                    </div>--%>
                    <div class="user_content">
                        <ul class="user_list">
                            <li><img src="<%=request.getContextPath()%>/market/main/images/contactus.jpg"></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
	</div>
