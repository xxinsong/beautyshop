$(function () {
    $("#pass_submit").click(function () {
        pass_submit();
    });
    $("[name='pass_old']").focusin(function () {
        register_tip($(this));
    }).focusout(function () {
            var $jq = $(this);
            var val = $jq.val();
            if (val == "") {
                return;
            } else {
                register_tip($jq, "", 3);
            }
        });
    $("[name='pass_new']").focusin(function () {
        register_tip($(this));
    }).focusout(function () {
            var $jq = $(this);
            var val = $jq.val();
            if (val == "") {
                return;
            }
            if (($.trim(val) != "" && $.trim(val).length < 6)) {
                register_tip($jq, "密码长度不能小于6位", 1);
            } else {
                register_tip($jq, "", 3);
            }
        });
    $("[name='pass_new_q']").focusin(function () {
        register_tip($(this));
    }).focusout(function () {
            var $jq = $(this);
            var val = $jq.val();
            if (val == "") {
                return;
            }
            if (($.trim(val) != "" && $.trim(val).length != $.trim($("[name='pass_new']").val()).length)) {
                register_tip($jq, "确认密码与密码不一致", 1);
            }
            if (($.trim(val) != $.trim($("[name='pass_new']").val()))) {
                register_tip($jq, "确认密码与密码不一致", 1);
            } else {
                register_tip($jq, "", 3);
            }
        });
});


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


//密码修改
function pass_submit() {

    if (!pass_register_validate()) {
        return;
    }
    var pass = commonJs.getData($("#user_password"));
//    pass.type = "pass_yz";
//    pass.oldPassword = orderList[0].passwd;
    Ajax.getAsy().remoteCall("StaffController", "modifyPassword", [ pass ], function (reply) {
        var result = reply.getResult();
        if (result.flag == 0) {
            alert("密码已修改，新密码将在下次登录系统时生效！");
            closeMesBox("user_password");
        } else {
            if (result.flag == 1) {
                register_tip($("[name='pass_yz']"), "验证码输入错误", 1);
            } else if (result.flag == 2) {
                register_tip($("[name='pass_sub']"), "系统异常，验证失败", 1);
            } else if (result.flag == 3) {
                register_tip($("[name='pass_old']"), "旧密码输入错误", 1);
            }
        }
    });
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


//关闭窗口
function closeMesBox(boxId) {
    window.close();
}

//空值判断
function isEmpty(vali) {
    if (vali != null) {
        return true;
    } else {
        return false;
    }
}