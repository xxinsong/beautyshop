<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="library" content="easyui" />
    <title>韩塑美-管理员入口</title>
    <script type="text/javascript" src="<%=path%>/public/core/EasyuiZX.js"></script>
    <link type="text/css" rel="stylesheet" href="<%=path%>/public/v20/ui/css/common.css"></link>
    <link type="text/css" rel="stylesheet" href="<%=path%>/public/admin/css/login.css"></link>
    <link type="text/css" rel="stylesheet" href="<%=path%>/public/admin/css/reset.css"></link>
    <script type="text/javascript" src="<%=path%>/public/v20/ui/js/common.js"></script>
    <script type="text/javascript">
        $(function() {
            $("#login_btn").bind("click", function() {
                submitData();
            });
            $(document).keydown(function(event) {
                if (event.keyCode == 13) {
                    submitData();
                }
            });
        })

        var logging = false;
        function submitData() {
            if (logging) {
                return;//如果正在登陆,则不在执行登陆请求.
            }
            logging = true ;//正在登陆
            if (!commonJs.validate($("#loginForm"))) {
                return;
            }
            $("#form_loginInfo").ajaxSubmit({
                success : function(reply) {
                    var data = eval("(" + reply + ")");
                    callback(data);
                    logging = false;
                }
            });
        }

        function callback(data) {
            if (data.success == "1") {
                newWin();
                window.opener = 'xxx';
                window.close();
            } else {
                alert(data.reason);
            }
        }

        function newWin() {
            var width = screen.availWidth - 3;
            var height = screen.availHeight - 20;
            var left = -4;
            var top = -4;
            var loginMainWin = window.open("admin/main/main.html", "", "toolbar=no,status=no,location=no,scrollbars=no,resizable=yes,width=" + width + ",height=" + height + ",top=0,left=0");
            loginMainWin.moveTo(left, top);
            loginMainWin.focus();
            self.blur();
        }
    </script>
</head>
<body>
<div class="topbg">
    <%--<div class="toplogo"></div>--%>
</div>
<div class="contaiter">
    <div class="conbg">
        <div class="loginCon">
            <div class="loginConDiv">
                <form id='form_loginInfo' method="post" enctype='multipart/form-data' action="LoginServlet">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="loginTable">
                        <tr>
                            <th >工号：</th>
                            <td  colspan="2"><input type="text"  name="staffCode"  class="loginipt" nullable="false"/><img src="<%=path%>/public/admin/images/user.png" /></td>
                        </tr>
                        <tr>
                            <th >密码：</th>
                            <td colspan="2" ><input type="password"  name="password" class="loginipt"  nullable="false"/><img src="<%=path%>/public/admin/images/lock.png" /></td>
                        </tr>
                        <tr>
                            <td  colspan="2" style="padding-top:20px; padding-left:90px;"><div class="loginbtn"><a href="javascript: void(0);"  id="login_btn" >登 &nbsp; &nbsp;陆</a></div></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="loginfooter">© 2014-2018 </div>
</body>
</html>