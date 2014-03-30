var memberGrid;

$(function() {
    memberGrid = new TableGrid( {
        $table : $("#member"),
        service : "DmUserController",
        method : "queryAllUsers",
        pageIndex : 1,
        pageSize : 10,
        onClickRow : function(data) {
            var level = data.level;
            if(level>1){
                $("#btnEdit").show();
            }else{
                $("#btnEdit").hide();
            }

            loadNextLevel(data.user_id);
            fillFormField(data);
        },
        onClickCell : function(field, value) {
        },
        onDblClickRow : function(data) {
        },
        renderColumn : function(field, value) {
            return value;
        }
    });

    presenteeGrid = new TableGrid( {
        $table : $("#presentee"),
        service : "DmUserController",
        method : "queryUsersByReferrer",
        pageIndex : 1,
        pageSize : 10,
        onClickRow : function(data) {
        },
        onClickCell : function(field, value) {
        },
        onDblClickRow : function(data) {
        },
        renderColumn : function(field, value) {
            return value;
        }
    });

    queryData();
});

function loadNextLevel(parentId){
    var params = {};
    params.referrer_id = parentId;
    presenteeGrid.params = params;
    presenteeGrid.loadData();
}

function queryData() {
    var params = new Object();
    params.logon_name=$("#qryLogonName").val();
    params.level=$("#qryLevel").val();
    memberGrid.params = params;
    memberGrid.loadData();
}

function mdfyReferrer(){
    var selected = memberGrid.getSelected();
    if (!selected) {
        messager.alert('请先选择记录！');
        return;
    }

    var referrerNo = $("#referrer_no").val();
    /*if(referrerNo.trim().length==0){
        messager.alert("提示","推荐人号码不能为空！");
        $("#referrer_no").focus();
        return;
    }*/
    if (!commonJs.validate($("#member_edit_form"))) {
        return;
    }
    var params = {};
    params.userId = $("#userId").val();
    params.referrerNo = $("#referrer_no").val();
    Ajax.getAsy().remoteCall("ReferrerInfoController", "modifyReferrer", [params], function(reply) {
        var result = reply.getResult();
        if (result.success) {
            messager.alert("提示", "修改成功！");
            queryData();
        } else {
            messager.alert("提示", result.reason);
        }
    });

}

function fillFormField(data){
    $("#userId").val(data.user_id);
    $("#logonName").val(data.logon_name);
    $("#level").val(data.level);
    $("#referrer_no").val(data.referrer);
    $("#state").val(data.state);

}
