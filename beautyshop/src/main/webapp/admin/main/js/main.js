$(function() {
	
	//加载登录信息
	Ajax.getAsy().remoteCall("LoginController", "getLoginInfo", [], function(reply) {
		var data = reply.getResult();
		$("span.user").text(data.staffName);
		$("div.top_right_msg").fadeIn(500);
	});
	
	$(".logout > i").click(function() {
		Ajax.getAsy().remoteCall("LoginController", "logout", [], function(reply) {
			window.close();
		});
	});
})