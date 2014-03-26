<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>深圳市韩塑美生物医学科技有限公司是一家化妆品面膜垂直电商为一体的分享平台互联网公司</title>
    <meta http-equiv="library" content="market"/>
    <link rel="stylesheet" href="<%=path%>/market/main/css/login.css" type="text/css"/>
    <script type="text/javascript" src="<%=path%>/public/core/EasyuiZX.js"></script>
    <script type="text/javascript" src="<%=path%>/market/main/js/login.js"></script>
</head>

<body>
<div class="login_bar">
    <div class="wrap">
        <div class="login_logo" style="cursor: pointer;" onclick="javascript:goHome();"></div>
    </div>
</div>
<div class="contaiter">
    <div class="login_left"></div>
    <div class="login_div">
        <div class="login_top"></div>
        <div class="login_center">
            <form id="form_login" method="post" enctype='multipart/form-data'
                  action="<%=request.getContextPath()%>/login/doLogin">
                <div class="login_table_con">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td colspan="2">
                                <div class="login_ipt focus">
                                    <input type="text" name="logon_name" id="logon_name" value="请输入登录名"
                                           onFocus="if(value=='请输入登录名') {value='';}"
                                           onBlur="if (value=='') {value='请输入登录名';}" nullable="false"/>
                                    <span class="new_user"></span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="login_ipt">
                                    <input type="password" name="passwd" id="passwd" value="" nullable="false"/>
                                    <span class="new_psw"></span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td><input name="checkbox" type="checkbox" id="checkbox" checked="checked"/>下次自动登录</td>
                            <td style="text-align:right;"><a href="#" class="blue">忘记密码？</a></td>
                        </tr>
                        <tr>
                            <td colspan="2"><a id="btn_user_login" href="javascript:void(0);" class="registerBtn"><span style="width:80px;">登录</span></a></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align:right;"><a id="registerRnBtn" href="javascript:void(0);" class="blue">立即注册</a></td>
                        </tr>
                    </table>
                </div>
            </form>
            <%--<div class="you_can">
                <p>可以使用以下方式登录</p>
                <ul class="acount_list">
                    <li><a href="#" class="qqico"></a></li>
                    <li><a href="#" class="sinaico"></a></li>
                    <li><a href="#" class="yixinico"></a></li>
                    <div class="clear"></div>
                </ul>
            </div>--%>
        </div>
        <div class="login_bottom"></div>
    </div>
    <div class="clear"></div>
</div>
<div class="bottom_service_link clearfix clear">
    <div class="footer_link">
        <a target="_blank" href="#">关于我们</a>|<a target="_blank" href="#">联系我们</a>|<a target="_blank"
                                                                                     href="#">诚聘英才</a>|<a
            target="_blank" href="#">友情链接</a>|<a target="_blank" href="#">法律声明</a>|<a target="_blank"
                                                                                      href="#">用户体验提升计划</a>
    </div>
</div>
<div class="footer">
    <p class="copyright">
        Copyright© 2013 ，版权所有 粤ICP备10207551号 粤B2-20100316 出版物经营许可证新出发粤批字第A-243号
    </p>

    <p class="kexin"><img src="<%=path%>/market/main/images/kexinimg01.jpg" width="112" height="35"/><img src="<%=path%>/market/main/images/kexinimg02.jpg"
                                                                                    width="112" height="35"/><img
            src="<%=path%>/market/main/images/kexinimg03.jpg" width="112" height="35"/></p>
</div>
</body>
</html>
