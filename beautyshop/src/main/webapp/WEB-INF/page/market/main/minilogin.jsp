<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/market/main/js/minilogin.js"></script>

<div class="trans_div" style="display: none;" id="login_trans"></div>
<div class="login_pop" style="display: none;" id="login_dialog">
    <h2>用户登录<a href="javascript: void(0)" class="pop_close">关闭</a></h2>
    <form id="form_login" method="post" enctype='multipart/form-data' action="<%=request.getContextPath()%>/login/doLogin">
	<div class="login_pop_table">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td colspan="2">
          	<div class="login_ipt focus">
                <input type="text" name="logon_name" id="logon_name" value="请输入登录名" onFocus="if(value=='请输入登录名') {value='';}" onBlur="if (value=='') {value='请输入登录名';}" nullable="false"/>
                <span class="login_user"></span>
           </div>
          </td>
        </tr>
        <tr>
          <td colspan="2">
          	<div class="login_ipt">
                <input type="password" name="passwd" id="passwd" value="" nullable="false"/>
                <span class="login_psw"></span>
           </div>
          </td>
        </tr>
        <tr>
          <td style="display: none;"><input name="" type="checkbox" id="" checked="checked" />下次自动登录</td>
          <td style="text-align:right;"><a href="javascript: void(0)" class="blue">忘记密码？</a></td>
        </tr>
        <tr>
          <td colspan="2"><a href="javascript: void(0)" class="registerBtn" id="btn_user_login"><span style="width:80px;">登录</span></a></td>
        </tr>
        <tr>
          <td colspan="2" style="text-align:right;"><a href="javascript: void(0)" class="blue" id="registerRnBtn">立即注册</a></td>
        </tr>
      </table>
    </div>
    </form>
	<div class="you_can">
        <p>可以使用以下方式登录</p>
        <ul class="acount_list">
            <li><a href="javascript: void(0)" class="qqico"></a></li>
            <li><a href="javascript: void(0)" class="sinaico"></a></li>
            <li><a href="javascript: void(0)" class="yixinico"></a></li>
            <div class="clear"></div>
        </ul>
    </div>
</div>