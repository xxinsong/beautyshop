<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="library" content="market"/>
    <title>韩塑美-您的美容专柜</title>
    <%--<link rel="stylesheet" href="css/reset.css" type="text/css" />--%>
    <%--<link rel="stylesheet" href="css/style.css" type="text/css" />--%>
    <script type="text/javascript" src="<%=path%>/public/core/EasyuiZX.js"></script>
    <script type="text/javascript" src="<%=path%>/market/main/js/header.js"></script>
    <script type="text/javascript" src="<%=path%>/market/main/js/register.js"></script>
</head>

<body>
<div class="header">
    <jsp:include page="topnav.jsp" flush="true"/>
    <div class="wrap" style="z-index:1000;">
        <div class="cart_logo1"></div>
        <div class="clear"></div>
    </div>
    <div class="register_bar">
    </div>
</div>
<div class="contaiter">
    <div class="register_div mt">
        <div class="register_l">
            <h3>注册</h3>

            <div class="register_table">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <th>手机号码：</th>
                        <td style="width:310px;">
                            <div class="register_ipt">
                                <input type="text" name="logon_name" value="手机号" onFocus="if(value=='手机号') {value='';}"
                                       onBlur="if (value=='') {value='手机号';}"/>
                                <span class="register_user"></span>
                            </div>
                        </td>
                        <td></td>
                    </tr>
                    <%--<tr>
                        <th>昵称：</th>
                        <td style="width:310px;">
                            <div class="register_ipt">
                                <input type="text" name="user_name" value="昵称" onFocus="if(value=='昵称') {value='';}"
                                       onBlur="if (value=='') {value='昵称';}"  max_length="20"/>
                                <span class="register_user"></span>
                            </div>
                        </td>
                        <td></td>
                    </tr>--%>
                    <tr>
                        <th>请设置密码：</th>
                        <td>
                            <div class="register_ipt">
                                <input type="password" name="passwd" value=""/>
                                <span class="register_psw"></span>
                            </div>
                        </td>
                        <td><span class="explain">数字、字母或符号的组合，至少6位</span></td>
                    </tr>
                    <tr>
                        <th>请确认密码：</th>
                        <td>
                            <div class="register_ipt">
                                <input type="password" name="passwdRepeat" value=""/>
                                <span class="register_psw"></span>
                            </div>
                        </td>
                        <td><span class="explain" style="display: none;"><i class="wrongico"></i></span></td>
                    </tr>
                    <tr>
                        <th>推荐人手机号码：</th>
                        <td nowrap="nowrap">
                            <input type="text" name="referrerMobileNo" class="reIpt" value=""/>
                        </td>
                        <td></td>
                    </tr>
                    <%--<tr>
                        <th>验证码：</th>
                        <td nowrap="nowrap">
                            <input type="text" name="verificCode" class="reIpt" value=""/>
                            <a href="javascript: void(0);" class="yamBtn" id="yanzBtn">点击发送验证码</a>
                            <a href="javascript: void(0);" class="yamBtn" style="display: none;"
                               id="yanzrBtn">重新发送验证码</a>
                        </td>
                        <td></td>
                    </tr>--%>
                    <tr>
                        <th>&nbsp;</th>
                        <td>
                            <input type="checkbox" name="readme" checked="checked"/>
                            我已阅读并同意<a href="<%=path%>/help/agreement" class="blue">《用户注册协议》</a>

                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>&nbsp;</th>
                        <td><a id="btn_register_submit" href="javascript: void(0);"
                                           class="registerBtn"><span>立即注册</span></a></td>
                        <td>已有帐号，请<a href="javascript: void(0);" class="blue"
                                     onclick="gotoLoginPage()"><span>登录</span></a></td>
                    </tr>
                </table>
            </div>
        </div>
        <%--<div class="register_r">
        	<div class="has_acount">已有帐号，请<a href="javascript: void(0);" onclick="openLoginDialog()">登录</a></div>
            &lt;%&ndash;<div class="you_can">
            	<p>可以使用以下方式登录</p>
                <ul class="acount_list">
                	<li><a href="#" class="qqico"></a></li>
                	<li><a href="#" class="sinaico"></a></li>
                	<li><a href="#" class="yixinico"></a></li>
                    <div class="clear"></div>
                </ul>
            </div>&ndash;%&gt;
        </div>--%>
        <div class="clear"></div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
<jsp:include page="minilogin.jsp" flush="true"></jsp:include>
</body>
</html>
