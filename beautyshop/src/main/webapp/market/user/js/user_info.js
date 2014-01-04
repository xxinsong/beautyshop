$(function() {
	switchMenu($("#mnu_myaccount"));
	initPage();
	$("#submit_btn").click(function() {
		modifyUserInfo();
	});
	$("#modify_logon_name_btn").click(function() {
		openModifyLogonNameDialog();
	});
	$(".pop_close", "#modifyLogonNameDiv").click(function() {
		closeModifyLogonNameDialog();
	});
	$(".orangebtn_m", "#modifyLogonNameDiv").click(function() {
		if (!commonJs.validate($("#modifyLogonNameDiv"))) {
			return;
		}
		var params = commonJs.getData($("#modifyLogonNameDiv"));
		var $jq = $("[name='logonName']", "#modifyLogonNameDiv");
		if (($.trim(params.logonName) != "" && !EasyuiZX.VTypes["mobile"](params.logonName)) || (len(params.logonName) > 0 && len(params.logonName) < 11)) {
			showRed($jq);
			messager.pop($jq, "请输入正确的手机号");
			return;
		}
		Ajax.getAsy().remoteCall("DmUserController", "modifyLogonName", [params], function(reply) {
			var result = reply.getResult();
			if (result && result.flag == "0") {
				alert("修改成功");
				closeModifyLogonNameDialog();
				location.reload();
			} else {
				alert(result.reason || "修改失败");
			}
		});
	});
	$("#modify_email_btn").click(function() {
		openModifyEmailDialog();
	});
	$(".pop_close", "#modifyEmailDiv").click(function() {
		closeModifyEmailDialog();
	});
	$(".orangebtn_m", "#modifyEmailDiv").click(function() {
		if (!commonJs.validate($("#modifyEmailDiv"))) {
			return;
		}
		var params = commonJs.getData($("#modifyEmailDiv"));
		var $jq = $("[name='email']", "#modifyEmailDiv");
		if ($.trim(params.email) != "" && !EasyuiZX.VTypes["email"](params.email)) {
			showRed($jq);
			messager.pop($jq, "请输入正确的邮箱");
			return;
		}
		Ajax.getAsy().remoteCall("DmUserController", "modifyEmail", [params], function(reply) {
			var result = reply.getResult();
			if (result && result.flag == "0") {
				alert("修改成功");
				closeModifyEmailDialog();
				location.reload();
			} else {
				alert(result.reason || "修改失败");
			}
		});
	});
})

function initPage() {
	Ajax.getAsy().remoteCall("UserLoginController", "getLoginInfo", [], function(reply) {
		var loginInfo = reply.getResult();
		if (loginInfo) {
			commonJs.setData("#userInfoDiv", loginInfo);
			$("[name='kind']", "#userInfoDiv").html(loginInfo.kind);
			$("[name='logonName']", "#userInfoDiv").html(loginInfo.logonName);
			$("[name='email']", "#userInfoDiv").html(loginInfo.email);
            if(loginInfo.headImage&&loginInfo.headImage!=null){
			    $("#headImage").attr("src", path_prefix.substring(0, path_prefix.lastIndexOf("/")) + loginInfo.headImage);
            }
		}
	});
}

function modifyUserInfo() {
	if (!commonJs.validate("#userInfoDiv")) {
		return;
	}
	var params = commonJs.getData("#userInfoDiv");
	Ajax.getAsy().remoteCall("DmUserController", "modifyBaseInfo", [ params ], function(reply) {
		var result = reply.getResult();
		if (result) {
			alert("修改成功");
		} else {
			alert("修改失败");
		}
	});
}

function checkPicExtension(o) {
	var suffix = o.substring(o.lastIndexOf(".")).toLowerCase();
	if (suffix != ".png" && suffix != ".jpg" && suffix != ".jpeg" && suffix != ".gif") {
		return false;
	} else {
		return true;
	}
}

function uploadPic(ele) {
	if (!checkPicExtension(ele.value)) {
		$("#formAddPic").html("<input class='input_f' name='fileAddPic' onchange='uploadPic(this)' type='file' />");
	}
	$("#formAddPic").ajaxSubmit( {
		resetForm: true,
		success : function(reply) {
			var data = eval("(" + reply + ")");		
			if (data.result) {
				$("#headImage").attr("src", path_prefix.substring(0, path_prefix.lastIndexOf("/")) + data.img_url)
			}
		}
	});
}

function merchartImageUpload(){
		var uploadImage = $("#textfieldUrl").val();
		if (!uploadImage) {
			alert("请选择需要上传的图片");
			return;
		} else {
			var strArray = uploadImage.split(".");
			if (strArray.length < 2) {
				alert("图片文件格式不正确,请选择jpg,gif格式图片");
				return;
			} else {
				var suffix = strArray[strArray.length - 1];
				if (suffix != "jpg" && suffix != "gif") {
					alert("图片文件格式不正确,请选择jpg,gif格式图片");
					return;
				}
			}
		}
		$("#imageUrlTd input[type='button']").attr("disabled", true);
		$("#viewButtion").val("正在上传..");
		$.ajaxFileUpload({
			url : path_prefix+"/image/mfupload",
			secureuri : false,
			fileElementId : 'mffile',
			dataType : "json",
			data : {
				"userId" : $("#userId").val()
			},
			success : function(retData) {
				$("#textfieldUrl").val("");
				alert(retData.msg);
			},
			error : function(fileName) {
				alert("上传失败");
			},
			complete : function() {
				$("#imageUrlTd input[type='button']").removeAttr("disabled");
				$("#viewButtion").val("浏览...");
			}
		});
	
}

function openOverlay() {
	if ($(".trans_div").size() == 0) {
		$("body").append("<div class='trans_div' style='display: none;'></div>");
	}
	$(".trans_div").show();
}

function closeOverlay() {
	$(".trans_div").hide();
}

function openModifyLogonNameDialog() {
	openOverlay();
	var top = document.documentElement.clientHeight - $("#modifyLogonNameDiv").height();
	$("#modifyLogonNameDiv").css( { 
		"top" :  top / 2 + document.documentElement.scrollTop
	}).show();
}

function closeModifyLogonNameDialog() {
	$("#modifyLogonNameDiv").hide();
	closeOverlay();
	commonJs.clear($("#modifyLogonNameDiv"));
}

function openModifyEmailDialog() {
	openOverlay();
	var top = document.documentElement.clientHeight - $("#modifyEmailDiv").height();
	$("#modifyEmailDiv").css( { 
		"top" :  top / 2 + document.documentElement.scrollTop
	}).show();
}

function closeModifyEmailDialog() {
	$("#modifyEmailDiv").hide();
	closeOverlay();
	commonJs.clear($("#modifyEmailDiv"));
}
