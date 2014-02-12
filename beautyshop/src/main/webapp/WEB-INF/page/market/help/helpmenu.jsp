<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/market/help/js/helpmenu.js"></script>
<div class="contaiter">
    <div class="positionDiv"><a href="javascript: void(0)">首页</a> <span>></span> <a href="javascript: void(0)">帮助中心</a> <span>></span> <a href="javascript: void(0)" id="curr_mnu"></a>
    </div>
    <div class="wrap">
        <div class="detailL">
            <div class="user_left_side mt">
                <div class="user_div">
                    <div class="uesr_title">
                        <h2><i class="userico02"></i><img src="<%=request.getContextPath()%>/market/main/images/menuic01.gif" width="24" height="24" class="menuic" />帮助中心</h2>
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
                </div>
            </div>
        </div>
	</div>
