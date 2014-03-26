<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="library" content="easyui,internet,WdatePicker,zTree" />
    <title>深圳市韩塑美生物医学科技有限公司是一家化妆品面膜垂直电商为一体的分享平台互联网公司</title>
    <script type="text/javascript" src="<%=path%>/public/core/EasyuiZX.js"></script>
    <script type="text/javascript" src="js/modifypassword.js"></script>
</head>
<body>

<div id="staffTab" style="margin-top: 10px; width:450px;">
    <div class="formgrid" id="user_password">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <th style="width: 80px;">当前密码：</th>
                <td>
                    <input type="password" name="pass_old" value="" class="ui_ipt bold" style="width: 150px;"/>
                </td>
                <td width="180px"></td>
            </tr>
            <tr>
                <th style="width: 80px;">新 密 码：</th>
                <td>
                    <input type="password" name="pass_new" value="" class="ui_ipt bold" style="width: 150px;" nullable="false" />
                </td>
                <td width="180px"></td>
            </tr>
            <tr>
                <th style="width: 80px;">确认密码：</th>
                <td>
                    <input type="password" name="pass_new_q" value="" class="ui_ipt bold" style="width: 150px;" nullable="false" />
                </td>
                <td width="180px"></td>
            </tr>

        </table>
        <div class="btns">
            <a href="javascript: void(0)" class="resetbtn" id="pass_submit"><span>确定</span></a>
            <a href="javascript: void(0)" class="resetbtn" id="btn_cancel" onclick="javascript:window.close()"><span>取消</span></a>
        </div>

    </div>
</div>
<div id="loading" style="background: url(<%=path%>/public/v20/ui/images/loading.gif) #ecf5ff no-repeat;width: 80px;height: 80px;position: absolute;top: 45%;left: 45%;z-index: 3000;filter:alpha(opacity=80);opacity: 0.8;display: none;"></div>
</body>
</html>
