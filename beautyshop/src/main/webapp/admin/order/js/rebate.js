var testgrid;

$(function() {
	testgrid = new TableGrid( {
		$table : $(".grid").find("table"),
		service : "DmPointController",
		method : "queryAllPoints",
		pageIndex : 1,
		pageSize : 10,
		onClickRow : function(data) {
            var remainder = data.remainderPoints;
            if(remainder<=0){
                $("#rebate").hide();
            }else{
                $("#rebate").show();
            }
		},
		onClickCell : function(field, value) {
		},
		onDblClickRow : function(data) {
		},
		renderColumn : function(field, value) {
			if ("lastExchangeTime" == field) {
				return $.format.date(value,'yyyy-MM-dd HH:mm:ss');
			} 
			return value;
		}
	});
	
	queryData();
});

function queryData() {
	var params = new Object();
	testgrid.params = params;
	testgrid.loadData();
}

function doRebate(){
    var selected = testgrid.getSelected();
    if (!selected) {
        messager.alert('请先选择记录！');
        return;
    }
    messager.confirm("确认","你确认对用户【<font color='red'>"+selected.logonName+"</font>】返利吗？" +
        "<br>返利金额：<font color='red'>"+selected.remainderPoints+"</font> 积分 x 5元 = <font color='red' >"+selected.remainderPoints*5+"</font>元。",
        function(result){
            if(result) {
                var params = {};
                params.userId = selected.userId;
                params.points = selected.remainderPoints;
                Ajax.getAsy().remoteCall("DmPointController", "exchangePoints", [params], function(reply) {
                    if (reply.getResult()) {
                        messager.alert("提示", "返利成功！");
                        $("#rebate").hide();
                        queryData();
                    } else {
                        messager.alert("提示", "返利失败！");
                    }
                });
            }
        });

}

