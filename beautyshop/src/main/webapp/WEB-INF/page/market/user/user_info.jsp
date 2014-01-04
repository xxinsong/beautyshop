<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="library" content="market"/>
    <title>数据超市</title>
    <script type="text/javascript" src="<%=path%>/public/core/EasyuiZX.js"></script>
    <script type="text/javascript" src="<%=path%>/public/ajax/ajaxfileupload.js"></script>
    <script type="text/javascript" src="<%=path%>/market/user/js/user_info.js"></script>
</head>

<body>
<jsp:include page="../main/header.jsp" flush="true"></jsp:include>
<jsp:include page="../main/leftmenu.jsp" flush="true"></jsp:include>

<div class="detailR">
    <div class="pers_cen_div mt">
        <div class="pers_cen_title">
            <h3>个人信息</h3>
        </div>
        <div class="pers_cen_con">
            <div class="my_order_tab_con">
                <ul class="my_order_tab">
                    <li class="curr">
                        <a href="javascript: void(0)"><span>基本信息</span>
                        </a>
                    </li>
                    <li style="display: none;">
                        <a href="javascript: void(0)"><span>更多信息</span>
                        </a>
                    </li>
                    <div class="clear"></div>
                </ul>
            </div>
            <div class="user_msg_con">
                <div class="userImg">
                    <p class="p_img"><img id="headImage" src="<%=path%>/market/main/images/userimg.jpg" width="160"
                                          height="160"/></p>

                    <p>

                    <div>
                        <a href="javascript: void(0)" class="upload_a">
                            上传头像
                            <form id="formAddPic" method="post" enctype="multipart/form-data"
                                  action="<%=path%>/UploadUserPic">
                                <input class="input_f" name="fileAddPic" onchange="uploadPic(this)" type="file"/>
                            </form>
                        </a>
                    </div>
                    </p>
                </div>
                <div id="userInfoDiv">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="user_msg_table">
                        <input type="hidden" id="userId" name="userId"></input>
                        <tr>
                            <th>昵称：</th>
                            <td><input type="text" name="userName" value="" class="ui_ipt bold" max_length="40"
                                       nullable="false"/></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th>真实姓名：</th>
                            <td><input type="text" name="merchantName" value="" class="ui_ipt bold" max_length="40"/>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <th>性别：</th>
                            <td>
                                <form id="form1" name="form1" method="post" action="">
                                    <label>
                                        <input type="radio" name="gender" value="0" id="gender_0"/>
                                        保密
                                    </label>
                                    <label>
                                        <input name="gender" type="radio" id="gender_1" value="1" checked="checked"/>
                                        男
                                    </label>
                                    <label>
                                        <input type="radio" name="gender" value="2" id="gender_2"/>
                                        女
                                    </label>
                                </form>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <th>手机号码：</th>
                            <td><span class="bold" name="logonName"></span><a href="javascript: void(0)" class="blue"
                                                                              id="modify_logon_name_btn">修改</a><span
                                    style="display: none;">已验证</span></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th>邮箱：</th>
                            <td><span class="bold" name="email"></span><a href="javascript: void(0)" class="blue"
                                                                          id="modify_email_btn">修改</a><span
                                    style="display: none;">已验证</span></td>
                            <td></td>
                        </tr>
                        <%--<tr>
                          <th>联系人姓名：</th>
                          <td><input type="text" name="contactName" value="" class="ui_ipt bold" max_length="40"/></td>
                          <td></td>
                        </tr>--%>
                        <tr>
                            <th>所在地：</th>
                            <td>
                                <select name="provinceCode" class="ui_select bold" attr_code="MERCHANT_PROVINCE">
                                </select>
                                <select name="cityCode" class="ui_select bold" attr_code="MERCHANT_CITY">
                                </select>
                                <select name="districtCode" class="ui_select bold" attr_code="MERCHANT_DISTRICT">
                                </select>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <th>&nbsp;</th>
                            <td><input type="text" name="address" value="请输入详细地址"
                                       onFocus="if(value=='请输入详细地址') {value='';}"
                                       onBlur="if (value=='') {value='请输入详细地址';}" class="ui_ipt" style="width:300px;"
                                       max_length="400"/></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center;">
                                <a href="javascript: void(0)" class="orangebtn_m" id="submit_btn"><span>提&nbsp;交</span></a>
                            </td>
                        </tr>
                    </table>


                </div>
            </div>
        </div>
    </div>
</div>
<div class="clear"></div>
</div>
</div>
<div class="trans_div" style="display: none;"></div>
<div class="login_pop" style="width:508px;display: none;" id="modifyLogonNameDiv">
    <h2>修改手机号码<a href="javascript: void(0)" class="pop_close">关闭</a></h2>

    <div class="login_pop_table">
        <table width="60%" border="0" cellspacing="0" cellpadding="0" class="form_table" style="margin: 0px auto;">
            <tr>
                <th style="width: 80px;">新手机号码：</th>
                <td><input type="text" name="logonName" value="" class="ui_ipt bold" style="width: 150px;"
                           nullable="false" max_length="40"/></td>
            </tr>
            <tr>
                <th style="width: 80px;">用户密码：</th>
                <td><input type="password" name="passwd" value="" class="ui_ipt bold" style="width: 150px;"
                           nullable="false"/></td>
            </tr>
            <tr>
                <td colspan="2">
                    <span>
                        注意：手机号码修改后，请使用新手机号码登录！
                    </span>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;"><a href="javascript: void(0)"
                                                               class="orangebtn_m"><span>提交</span></a></td>
            </tr>
        </table>
    </div>
</div>
<div class="login_pop" style="width:508px;display: none;" id="modifyEmailDiv">
    <h2>修改邮箱<a href="javascript: void(0)" class="pop_close">关闭</a></h2>

    <div class="login_pop_table">
        <table width="60%" border="0" cellspacing="0" cellpadding="0" class="form_table" style="margin: 0px auto;">
            <tr>
                <th style="width: 80px;">新邮箱：</th>
                <td><input type="text" name="email" value="" class="ui_ipt bold" style="width: 150px;" nullable="false"
                           max_length="100"/></td>
            </tr>
            <tr>
                <th style="width: 80px;">用户密码：</th>
                <td><input type="password" name="passwd" value="" class="ui_ipt bold" style="width: 150px;"
                           nullable="false"/></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;"><a href="javascript: void(0)"
                                                               class="orangebtn_m"><span>提交</span></a></td>
            </tr>
        </table>
    </div>
</div>
<jsp:include page="../main/footer.jsp" flush="true"></jsp:include>
</body>
</html>
