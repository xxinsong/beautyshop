$(function(){
    loadAvailableGoodsInst();

    $("#btn_submit").click(function(){submitActivity()});
    $("#btn_cancel").click(function(){cancelActivity()});

    $("#actName").on('blur',function(){
        if($.trim($(this).val())==''){
            $("#actName_hint").html('');
            $("#actName_hint").append("<i class='wrongico'></i>营销名称不能为空！");
        }else{
            $("#actName_hint").html('');
            $("#actName_hint").append("<i class='rightico'></i>");
        }
    });

    $("#smsContent").on('blur',function(){
        var smsContent = $.trim($(this).val());
        if(smsContent==''){
            $("#smsContent_hint").html('');
            $("#smsContent_hint").append("<i class='wrongico'></i>营销内容不能为空！");
            return false;
        }else{
            Ajax.getAsy().remoteCall("SensitiveWordFilterController", "filterContent", [smsContent], function(reply){
                if(reply.getResult()){
                    $("#smsContent_hint").html('');
                    $("#smsContent_hint").append("<i class='rightico'></i>");
                }else{
                    $("#smsContent_hint").html('');
                    $("#smsContent_hint").append("<i class='wrongico'></i>营销内容含有敏感词汇，请重新编辑！");
                }
            });
        }
    });
});

function loadAvailableGoodsInst(){
    var instId = $("#h_instid").val();
    var callback = function(reply){
        var list = reply.getResult();
        var $goodsInstList = $("#goodsInstList")
        var $tmpl = $("li[template]");
        if(!list||list.length==0){
            var $cloneRow = $tmpl.clone().attr('name','row');
            $cloneRow.removeAttr("template").appendTo($goodsInstList);
            $cloneRow.text("你还没有可用的商品，赶紧去购买吧！");
            $cloneRow.show();
        }else{
            for(var i in list){
                var $cloneRow = $tmpl.clone().attr('name','row');
                $cloneRow.removeAttr("template").appendTo($goodsInstList);
                var $instItem = $("input[name='goodsInstId']", $cloneRow);
                $instItem.val(list[i].instId).attr("goodsName",list[i].goodsName).after(list[i].goodsName);
                if(instId==list[i].instId){
                    $instItem.attr("checked",true);
                }
                $instItem.on('click',function(){
                    $("#goodsInstList_hint").html('');
                    $("#goodsInstList_hint").append("<i class='rightico'></i>");
                });
                $cloneRow.show();
            }
        }
        initData();
    }
    Ajax.getAsy().remoteCall("DmGoodsInstController", "queryAvailableGoodsInst", [instId], callback);
}

function submitActivity(){
    var params = commonJs.getData($("#activityForm"));
    params.goodsName = $("input[name='goodsInstId']:checked").attr("goodsName");
    if (!commonJs.validate($("#activityForm"))) {
        return;
    }

    if(!params.goodsInstId||params.goodsInstId==''){
        $("#goodsInstList_hint").html('');
        $("#goodsInstList_hint").append("<i class='wrongico'></i>请选择一个营销商品！");
        return;
    }

    Ajax.getAsy().remoteCall("SensitiveWordFilterController", "filterContent", [params.smsContent], function(reply){
        if(reply.getResult()){
            $("#smsContent_hint").html('');
            var callback = function(reply2){
                var result = eval("("+reply2.getResult()+")");
                if(result.success){
                    alert("保存成功！");
                    window.location.href = commonJs.getWebPath()+"/market/activity/myactivities";
                }else{
                    $("#sendTime_hint").html('');
                    $("#sendTime_hint").append("<i class='wrongico'></i>"+result.reason);
                }
            }
            Ajax.getAsy().remoteCall("DmMerchantActivityController", "saveActivity", [params], callback);
        }else{
            $("#smsContent_hint").html('');
            $("#smsContent_hint").append("<i class='wrongico'></i>营销内容含有敏感词汇，请重新编辑！");
            $("#smsContent").focus();
        }
    });
}

function cancelActivity(){
    window.location.href = commonJs.getWebPath()+"/market/activity/myactivities";
}

function initData(){
    var sendMethod = $("#h_sendmethod").val();
    if(sendMethod == "MMS"){
        $("input[name='sendMethod'][value='MMS']").attr("checked",true);
    }else{
        $("input[name='sendMethod'][value='SMS']").attr("checked",true);
    }

}