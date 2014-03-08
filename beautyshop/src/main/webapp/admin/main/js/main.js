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

//    $("#updUserPass").on('click',function(){updUserPas(); });

})



//修改密码显示
function modifyPassword() {
    window.showModalDialog("../security/staff/modifypassword.jsp",{},
        "dialogWidth=480px;dialogHeight=200px;status=no;scroll=no");

}
