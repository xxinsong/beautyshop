$(function() {
	//登录窗拖动
	$(".login_pop").draggable( {
		handle : "h2"
	});
	//登录窗关闭
    $(".pop_close", "#login_dialog").click(function() {
        closeLoginDialog();
    });
	//登录
	$("#btn_user_login").click(function() {
		userLogin();
	});
	//立刻注册事件
	$("#registerRnBtn").click(function() {
		location = commonJs.getWebPath() + "/register";
	});
	//回车事件
	$("#form_login").keydown(function(event) {
		if (event.which == 13) {
			userLogin();
		}
	});
})

function openLoginDialog() {
	$("#login_trans").show();
	$("#login_dialog").show();
}

function closeLoginDialog() {
	$("#login_dialog").hide();
	$("#login_trans").hide();
}

function userLogin() {
	var login = commonJs.getData($(".login_pop_table", ".login_pop"));
	if (login.logon_name == "请输入登录名") {
		$("#logon_name").val("");
	}
	if (!commonJs.validate($("#form_login"))) {
		return;
	}
	var callback = function(data) {
		if (data.success) {
			closeLoginDialog();
            var fromUrl = data.from;
            if(fromUrl){
                location = fromUrl;
            }else{
			    location = commonJs.getWebPath() + "/welcome";
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