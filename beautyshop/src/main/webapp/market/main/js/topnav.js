$(function() {
	$(".top_ul").children("a").each(function() {
		var t;
		$(this).hover(function() {
			$(this).siblings("a").removeClass("selected");
			if ($(this).find("i.arrow").size() > 0) {
				$(this).addClass("selected");
			}
			$("#" + $(this).attr("rel_div")).slideDown(200);
		}, function() {
			var me = this;
			t = setTimeout(function() {
				$(me).removeClass("selected");
				$("#" + $(me).attr("rel_div")).slideUp(200);
			}, 200);
		});
		$("#" + $(this).attr("rel_div")).hover(function() {
			clearTimeout(t);
		}, function() {
			$("#" + $(this).attr("rel_a")).removeClass("selected");
			$(this).slideUp(200);
		});
	});
	
	$("#loginBtn,[name='btn_user_login']").click(function() {
		openLoginDialog();
	});
	$("#registerBtn,[name='btn_user_register']").click(function() {
		location = commonJs.getWebPath() + "/register";
	});
	$("#logoutBtn,[name='btn_logout']").click(function() {
		logout();

	});
	
	initLogin();
})

function initLogin() {
	Ajax.getAsy().remoteCall("UserLoginController", "getLoginInfo", [], function(reply) {
		var loginInfo = reply.getResult();
		if (loginInfo) {
			$("#loginBtn").hide();
			$("#registerBtn").hide();
			$("#logoutBtn").show();
			$("#welcome_msg").html("您好，" + (/*loginInfo.userName || */loginInfo.logonName) + "！");
			
			$("[name='userName']", "#quick_user_div").html(/*loginInfo.userName || */loginInfo.logonName);
			$("#quick_user_div").children().hide().eq(1).show();
		}
	});
}

function logout() {
    location = commonJs.getWebPath()+"/logout"
	/*Ajax.getAsy().remoteCall("UserLoginController", "logout", [], function(reply) {
		var loginInfo = reply.getResult();
		if (loginInfo) {
			$("#loginBtn").show();
			$("#registerBtn").show();
			$("#logoutBtn").hide();
			$("#welcome_msg").html("您好，欢迎光临！");
		}
        location = path_prefix + "market/main/main.jsp";
	});*/
}