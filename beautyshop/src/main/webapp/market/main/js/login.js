$(function() {

    //登录
    $("#btn_user_login").click(function() {
        userLogin();
    });
    //立刻注册事件
    $("#registerRnBtn").click(function() {
        location = path_prefix + "/register";
    });
    //回车事件
    $("#form_login").keydown(function(event) {
        if (event.which == 13) {
            userLogin();
        }
    });
})

function userLogin() {
    var login = commonJs.getData($(".login_pop_table", ".login_pop"));
    if (login.logon_name == "请输入登录名") {
        $("#logon_name").val("");
    }
    if (!commonJs.validate($(".login_pop_table", ".login_pop"))) {
        return;
    }
    var callback = function(data) {
        if (data.success) {
            var returnUrl = commonJs.getUrlParam("returnUrl");
            if(returnUrl){
                location.href = decodeURIComponent(returnUrl);
            }else{
                location.href = commonJs.getWebPath() + "/welcome";
            }
        } else {
            alert(data.reason);
        }
    };
    $("#form_login").ajaxSubmit({
        success : function(reply) {
            callback(reply);
        }
    });
}