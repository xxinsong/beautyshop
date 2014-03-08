var orderList;
var temp=0;
var reg_flag = false; //防止重复点击
var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
$(function () {
    switchMenu($("#mnu_security"));
    initPage();
    $("#updUserPass").on('click',function(){updUserPas(); });
    $("#email_oper").on('click',function(){updUserEmail();});
    $("#pasQues_oper").on('click',function(){updUserQues();});
    $("#email_yanzBtn").click(function() {getVerificCode("email");});
	$("#email_yanzrBtn").click(function() {getVerificCode("email");});
    $("#pass_yanzBtn").click(function() {getVerificCode("pass");});
    $("#pass_yanzrBtn").click(function() {getVerificCode("pass");});
    $("#email_submit").click(function(){email_submit();});
    $("#pass_submit").click(function(){pass_submit();});
    $("#pass_quse_submit").click(function(){pass_quse_submit();});
    
    $("[name='pass_old']").focusin(function() {
		register_tip($(this));
	}).focusout(function() {
		var $jq = $(this);
		var val = $jq.val();
		if (val == "") {
			return;
		}else {
			register_tip($jq, "", 3);
		}
	});
    $("[name='pass_new']").focusin(function() {
		register_tip($(this));
	}).focusout(function() {
		var $jq = $(this);
		var val = $jq.val();
		if (val == "") {
			return;
		}
		if (($.trim(val) != "" && $.trim(val).length<6)) {
			register_tip($jq, "密码长度不能小于6位", 1);
		} else {
			register_tip($jq, "", 3);
		}
	});
    $("[name='pass_new_q']").focusin(function() {
		register_tip($(this));
	}).focusout(function() {
		var $jq = $(this);
		var val = $jq.val();
		if (val == "") {
			return;
		}
		if (($.trim(val) != "" && $.trim(val).length!=$.trim($("[name='pass_new']").val()).length)) {
			register_tip($jq, "确认密码与密码不一致", 1);
		} 
		if(($.trim(val)!=$.trim($("[name='pass_new']").val()))){
			register_tip($jq, "确认密码与密码不一致", 1);
		}else {
			register_tip($jq, "", 3);
		}
	});
    /*$("[name='pass_yz']").focusin(function() {
		register_tip($(this));
	}).focusout(function() {
		var $jq = $(this);
		var val = $jq.val();
		if (val == "") {
			return;
		}
		if (($.trim(val) != "" && $.trim(val).length!=6)) {
			register_tip($jq, "请输入正确的验证码", 1);
		}else {
			register_tip($jq, "", 3);
		}
	});*/
    
    $("[name='email_old']").focusin(function() {
		register_tip($(this));
	}).focusout(function() {
		var $jq = $(this);
		var val = $jq.val();
		if (val == "") {
			return;
		}
		if (($.trim(val) != "" && !reg.test($.trim(val) ))) {
			register_tip($jq, "邮箱输入错误", 1);
		} else {
			register_tip($jq, "", 3);
		}
	});
    $("[name='email_new']").focusin(function() {
		register_tip($(this));
	}).focusout(function() {
		var $jq = $(this);
		var val = $jq.val();
		if (val == "") {
			return;
		}
		if (($.trim(val) != "" && !reg.test($.trim(val) ))) {
			register_tip($jq, "邮箱输入错误", 1);
		}else {
			register_tip($jq, "", 3);
		}
	});
    $("[name='email_yz']").focusin(function() {
		register_tip($(this));
	}).focusout(function() {
		var $jq = $(this);
		var val = $jq.val();
		if (val == "") {
			return;
		}
		if (($.trim(val) != "" && $.trim(val).length!=6)) {
			register_tip($jq, "请输入正确的验证码", 1);
		}else {
			register_tip($jq, "", 3);
		}
	});
    
    $("[name='pass_ques_old']").focusin(function(){
    	register_tip($(this));
    }).focusout(function(){
    	var $jq = $(this);
		var val = $jq.val();
		if (($.trim(val)=="")) {
			return;
		}else {
			register_tip($jq, "", 3);
		}
    });
    $("[name='pass_answ_old']").focusin(function(){
    	register_tip($(this));
    }).focusout(function(){
    	var $jq = $(this);
		var val = $jq.val();
		if (($.trim(val)=="")) {
			return;
		}else {
			register_tip($jq, "", 3);
		}
    });
    $("[name='pass_ques_new']").focusin(function(){
    	register_tip($(this));
    }).focusout(function(){
    	var $jq = $(this);
		var val = $jq.val();
		if (($.trim(val)=="")) {
			return;
		}else {
			register_tip($jq, "", 3);
		}
    });
    $("[name='pass_answ_new']").focusin(function(){
    	register_tip($(this));
    }).focusout(function(){
    	var $jq = $(this);
		var val = $jq.val();
		if (($.trim(val)=="")) {
			return;
		}else {
			register_tip($jq, "", 3);
		}
    });
});


//页面加载
function initPage(){
	Ajax.getAsy().remoteCall("DmUserController","getUserSecurity",[],function(reply){
		 var result = reply.getResult();
		 if(result){
			 orderList=result;
			 mySecurity(result);
		 }
    });
}

//显示校验
function mySecurity(result){
	var userPhone=result[0].logonName;
	 var email=result[0].email;
	 var pass=result[0].passwd;
	 var pasQues=result[0].passwdQuestion;
	 if(isEmpty(userPhone)){
		 temp+=1;
	 }
	 if(isEmpty(pass)){
		 temp+=1;
	 }
	 if(isEmpty(email)){
		 var param=email.split("@");
		 var email_show=param[0].substring("0","1")+"******"+param[0].substring(param[0].length-1,param[0].length)+"@"+param[1];
		 $("#email_ioc").attr("class","saveico-1");
		 $("#email_msg").html("<span style='color:#2AB33B;'>您当前绑定的邮箱为：<strong>"+email_show+"</strong><!--，点击修改可更换绑定邮箱-->。</span>");
		 $("#email_oper").text("");
		 temp+=1;
	 }
	 if(isEmpty(pasQues)){
		 $("#pasQues_ioc").attr("class","saveico-1");
		 $("#pasQues_msg").html("<span style='color:#2AB33B;'>您当前以验证密保问题，点击修改可对您当前的密保问题进行修改。</span>");
		 $("#pasQues_oper").text("修改");
		 temp+=1;
	 }
	 if(temp==1){
		 $("#levelIco").attr("class","saveLevelCon levelWeak");
		 $("#level").text("弱");
	 }
	 if(temp==2){
		 $("#levelIco").attr("class","saveLevelCon levelWeaker");
		 $("#level").text("较弱");
	 }
	 if(temp==3){
		 $("#levelIco").attr("class","saveLevelCon levelStronger");
		 $("#level").text("强");
	 }
	 if(temp==4){
		 $("#levelIco").attr("class","saveLevelCon levelStrong");
		 $("#level").text("较强");
	 }
}

//验证码
function getVerificCode(type) {
	Ajax.getAsy().remoteCall("DmUserController", "getVerificCode", [], function(reply) {
		alert("验证码：" + reply.getResult());
		if(type=="email"){
			$("#email_yanzBtn").hide();
			$("#email_yanzrBtn").show();
		}
		if(type=="pass"){
			$("#pass_yanzBtn").hide();
			$("#pass_yanzrBtn").show();
		}
	});
}

//密码修改
function pass_submit(){
	if (reg_flag) {
		return;
	}
	if (!pass_register_validate()) {
		return;
	}
	reg_flag = true;
	var pass = commonJs.getData($("#user_password"));
	pass.type="pass_yz";
	pass.oldPassword=orderList[0].passwd;
	Ajax.getAsy().remoteCall("DmUserController", "updateUserReg", [ pass ], function(reply) {
		var result = reply.getResult();
		if (result.flag == 0) {
			location = commonJs.getWebPath() + "/setting/security";
			alert("密码以修改，新密码将在下次登录系统时生效！");
			closeMesBox("user_password");
			reg_flag = false;
		} else {
			reg_flag = false;
			if (result.flag == 1) {
				register_tip($("[name='pass_yz']"), "验证码输入错误", 1);
			} else if (result.flag == 2) {
				register_tip($("[name='pass_sub']"), "系统异常，验证失败", 1);
			}else if(result.flag==3){
				register_tip($("[name='pass_old']"), "旧密码输入错误", 1);
			}
		}
	});
}

//邮箱提交
function email_submit(){
	if (reg_flag) {
		return;
	}
	if (!email_register_validate()) {
		return;
	}
	reg_flag = true;
	var email = commonJs.getData($("#user_email"));
	email.type="email_yz";
	Ajax.getAsy().remoteCall("DmUserController", "updateUserReg", [ email ], function(reply) {
		var result = reply.getResult();
		if (result.flag == 0) {
			location = commonJs.getWebPath() + "/setting/security";
			alert("邮箱绑定成功，请牢记您的绑定邮箱！");
			closeMesBox("user_email");
			reg_flag = false;
		} else {
			reg_flag = false;
			if (result.flag == 1) {
				register_tip($("[name='email_yz']"), "验证码输入错误", 1);
			} else if (result.flag == 2) {
				register_tip($("[name='email_sub']"), "系统异常，验证失败", 1);
			}
		}
	});
}

//密保问题验证
function pass_quse_submit(){
	if (reg_flag) {
		return;
	}
	if (!passques_register_validate()) {
		return;
	}
	reg_flag = true;
	var user_ques=commonJs.getData($("#user_pasQues"));
	user_ques.type="ques_yz";
	Ajax.getAsy().remoteCall("DmUserController", "updateUserReg", [ user_ques ], function(reply) {
		var result = reply.getResult();
		if (result.flag == 0) {
			location = commonJs.getWebPath() + "/setting/security";
			alert("密保问题以验证，请您牢记问题和答案！");
			closeMesBox("user_email");
			reg_flag = false;
		} else {
			reg_flag = false;
			register_tip($("[name='email_sub']"), "系统异常，验证失败", 1);
		}
	});
	closeMesBox("user_pasQues");
	reg_flag = false;
}

//邮箱验证
function email_register_validate(){
	var flag = true;
	if(isEmpty(orderList[0].email)){
		var $email_old = $("[name='email_old']");
		if ($.trim($email_old.val()) == "") {
				register_tip($email_old, "旧邮箱不能为空", 1);
				flag = false;
		}else{
			if($.trim($email_old.val()) !=orderList[0].email ){
				register_tip($email_old, "旧邮箱输入错误", 1);
				flag = false;
			}
		}
	}
	var $email_new = $("[name='email_new']");
	if ($.trim($email_new.val()) == "") {
		register_tip($email_new, "新邮箱不能为空", 1);
		flag = false;
	}
	var $email_yz=$("[name='email_yz']");
	if($.trim($email_yz.val()) == "") {
		register_tip($email_yz, "验证码不能为空", 1);
		flag = false;
	}
	return flag;
}

//密码验证
function pass_register_validate(){
	var flag = true;
	var $pass_old = $("[name='pass_old']");
	if ($.trim($pass_old.val()) == "") {
			register_tip($pass_old, "旧密码不能为空", 1);
			flag = false;
	}
	var $pass_new = $("[name='pass_new']");
	if ($.trim($pass_new.val()) == "") {
		register_tip($pass_new, "新密码不能为空", 1);
		flag = false;
	}
	var $pass_new_q= $("[name='pass_new_q']");
	if ($.trim($pass_new_q.val()) == "") {
		register_tip($pass_new_q, "确认密码不能为空", 1);
		flag = false;
	}
	/*var $pass_yz=$("[name='pass_yz']");
	if($.trim($pass_yz.val()) == "") {
		register_tip($pass_yz, "验证码不能为空", 1);
		flag = false;
	}*/
	return flag;
}

//密保问题验证
function passques_register_validate(){
	var flag = true;
	if(isEmpty(orderList[0].passwdQuestion)){
		var $pass_ques_old = $("[name='pass_ques_old']");
		if ($.trim($pass_ques_old.val()) == "") {
				register_tip($pass_ques_old, "旧密保问题不能为空", 1);
				flag = false;
		}else{
			if($.trim($pass_ques_old.val()) !=orderList[0].passwdQuestion ){
				register_tip($pass_ques_old, "旧密保问题输入错误", 1);
				flag = false;
			}
		}
		var $pass_answ_old = $("[name='pass_answ_old']");
		if ($.trim($pass_answ_old.val()) == "") {
			register_tip($pass_answ_old, "旧密保答案不能为空", 1);
			flag = false;
		}else{
			if($.trim($pass_answ_old.val()) !=orderList[0].passwdAnswer ){
				register_tip($pass_answ_old, "旧密保答案输入错误", 1);
				flag = false;
			}
		}
	}
	var $pass_ques_new= $("[name='pass_ques_new']");
	if ($.trim($pass_ques_new.val()) == "") {
		register_tip($pass_ques_new, "密保问题不能为空", 1);
		flag = false;
	}
	var $pass_answ_new=$("[name='pass_answ_new']");
	if($.trim($pass_answ_new.val()) == "") {
		register_tip($pass_answ_new, "新密保答案不能为空", 1);
		flag = false;
	}
	return flag;
}

//表单提交验证
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

//修改密码显示
function updUserPas(){
	$("#userSecurity_bg").show();
	$("#user_password").show();
	$("[name='pass_old']").val("");
	$("[name='pass_new']").val("");
	$("[name='pass_new_q']").val("");
//	$("[name='pass_yz']").val("");
	register_tip($("[name='pass_old']"));
	register_tip($("[name='pass_new']"));
	register_tip($("[name='pass_new_q']"));
//	register_tip($("[name='pass_yz']"));
}

//修改邮箱显示
function updUserEmail(){
	$("#userSecurity_bg").show();
	$("#user_email").show();
	if(isEmpty(orderList[0].email)){
		$("#old_email").show();
		$("#email_new").text("新 邮 箱：");
	}else{
		$("#email_new").text("绑定邮箱：");
	}
	$("[name='email_old']").val("");
	$("[name='email_new']").val("");
	$("[name='email_yz']").val("");
	register_tip($("[name='email_old']"));
	register_tip($("[name='email_new']"));
	register_tip($("[name='email_yz']"));
}

//修改密保问题显示
function updUserQues(){
	$("#userSecurity_bg").show();
	$("#user_pasQues").show();
	if(isEmpty(orderList[0].passwdQuestion)){
		$("#ques_old").show();
		$("#answ_old").show();
		$("#ques_new").text("新 问 题：");
	}else{
		$("#ques_new").text("密保问题：");
	}
	$("[name='pass_ques_old']").val("");
	$("[name='pass_answ_old']").val("");
	$("[name='pass_ques_new']").val("");
	$("[name='pass_answ_new']").val("");
	register_tip($("[name='pass_ques_old']"));
	register_tip($("[name='pass_answ_old']"));
	register_tip($("[name='pass_ques_new']"));
	register_tip($("[name='pass_answ_new']"));
}

//关闭窗口
function closeMesBox(boxId){
	$("#userSecurity_bg").hide();
	$("#"+boxId).hide();
}

//空值判断
function isEmpty(vali){
	if(vali!=null){
		return true;
	}else{
		return false;
	}
}