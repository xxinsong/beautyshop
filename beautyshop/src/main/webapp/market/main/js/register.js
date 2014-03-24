$(function() {
	$("#btn_register_submit", ".register_table").click(function() {
		register();
	});
	$("[name='logon_name']", ".register_table").focusin(function() {
		$(this).parent().addClass("focus");
		register_tip($(this));
	}).focusout(function() {
		var $jq = $(this);
		$jq.parent().removeClass("focus");
		var val = $jq.val();
		if (val == "") {
			return;
		}
		if (($.trim(val) != "" && !EasyuiZX.VTypes["mobile"](val)) || (len(val) > 0 && len(val) < 11)) {
			register_tip($jq, "请输入正确的手机号", 1);
		} else {
			register_tip($jq, "", 3);
		}
	});
	$("[name='passwd']", ".register_table").focusin(function() {
		$(this).parent().addClass("focus");
		register_tip($(this), "数字、字母或符号的组合，至少6位", 2);
	}).focusout(function() {
		var $jq = $(this);
		$jq.parent().removeClass("focus");
		var val = $jq.val();
		if (val == "") {
			return;
		}
		if (len(val) < 6) {
			register_tip($jq, "密码长度至少6位", 1);
		} else {
			register_tip($jq, "", 3);
		}
	});
	$("[name='passwdRepeat']", ".register_table").focusin(function() {
		$(this).parent().addClass("focus");
		register_tip($(this));
	}).focusout(function() {
		var $jq = $(this);
		$jq.parent().removeClass("focus");
		var val = $jq.val();
		if (val == "") {
			return;
		}
		if (len(val) < 6) {
			register_tip($jq, "密码长度至少6位", 1);
		} else if (val != $("[name='passwd']", ".register_table").val()) {
			register_tip($jq, "两次输入密码不一致", 1);
		} else {
			register_tip($jq, "", 3);
		}
	});
	/*$("[name='verificCode']", ".register_table").focusin(function() {
		register_tip($(this));
	});
	$("#yanzBtn").click(function() {
		getVerificCode();
	});
	$("#yanzrBtn").click(function() {
		getVerificCode();
	});*/
	$("[name='readme']", ".register_table").click(function() {
		if (this.checked) {
			register_tip($(this));
		}
	});
})

var reg_flag = false; //防止重复点击
function register() {
	if (reg_flag) {
		return;
	}
	if (!register_validate()) {
		return;
	}
	reg_flag = true;
	var user = commonJs.getData($(".register_table"));
	Ajax.getAsy().remoteCall("DmUserController", "insertUser", [ user ], function(reply) {
		var result = reply.getResult();
		if (result.flag == 0) {
			location = commonJs.getWebPath() + "/welcome";
		} else {
			reg_flag = false;
			if (result.flag == 1) {
				register_tip($("[name='logon_name']", ".register_table"), "登录名已存在", 1);
			} /*else if (result.flag == 2) {
				register_tip($("[name='verificCode']", ".register_table"), "验证码不正确", 1);
			}*/
            else if (result.flag == 3) {
                register_tip($("[name='referrerMobileNo']", ".register_table"), "推荐人号码不正确", 1);
            }else if (result.flag == 4) {
                register_tip($("[name='referrerMobileNo']", ".register_table"), "推荐人没有支付过订单，不符合推荐人资格！", 1);
            }
		}
	});
}

/*function getVerificCode() {
	Ajax.getAsy().remoteCall("DmUserController", "getVerificCode", [], function(reply) {
		alert("验证码：" + reply.getResult());
		$("#yanzBtn").hide();
		$("#yanzrBtn").show();
	});
}*/

function register_tip($jq, msg, type) {
	if (type == 1) {
		$jq.closest("td").next().html("<span class='explain' style='color: red;'><i class='wrongico'></i>" + msg + "</span>");
		$jq.data("wrong", true);
	} else if (type == 2) {
		$jq.closest("td").next().html("<span class='explain'>" + msg + "</span>");
		$jq.data("wrong", false);
	} else if (type == 3) {
		$jq.closest("td").next().html("<span class='explain'><i class='rightico'></i></span>");
		$jq.data("wrong", false);
	} else {
		$jq.closest("td").next().html("");
		$jq.data("wrong", false);
	}
}

function register_validate() {
	var flag = true;
	var $logon_name = $("[name='logon_name']", ".register_table");
	var $user_name = $("[name='user_name']", ".register_table");
	if ($logon_name.data("wrong")) {
		flag = false;
	}
	if ($.trim($logon_name.val()) == "" || $.trim($logon_name.val()) == "手机号") {
        register_tip($logon_name, "请输入登录名", 1);
        flag = false;
    }
    if ($.trim($user_name.val()) == "" || $.trim($user_name.val()) == "昵称") {
        register_tip($user_name, "请输入昵称", 1);
        flag = false;
    }
	var $passwd = $("[name='passwd']", ".register_table");
	if ($passwd.data("wrong")) {
		flag = false;
	}
	if ($.trim($passwd.val()) == "") {
		register_tip($passwd, "请输入密码", 1);
		flag = false;
	}
	var $passwdRepeat = $("[name='passwdRepeat']", ".register_table");
	if ($passwdRepeat.data("wrong")) {
		flag = false;
	}
	if ($.trim($passwdRepeat.val()) == "") {
		register_tip($passwdRepeat, "请输入密码", 1);
		flag = false;
	}
    var $referrerNo = $("[name='referrerMobileNo']",".register_table");
    if ($.trim($referrerNo.val()) == "") {
        register_tip($referrerNo, "请输入推荐人手机号码", 1);
        flag = false;
    }
	/*var $verificCode = $("[name='verificCode']", ".register_table");
	if ($.trim($verificCode.val()) == "") {
		register_tip($verificCode, "请输入验证码", 1);
		flag = false;
	}*/
	var $readme = $("[name='readme']", ".register_table");
	if (!$readme.get(0).checked) {
		register_tip($readme, "请接受服务条款", 1);
		flag = false;
	}
	return flag;
}

function gotoLoginPage(){
    window.location.href = commonJs.getWebPath()+"/login"
}