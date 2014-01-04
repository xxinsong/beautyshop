var testgrid;

$(function() {
	testgrid = new TableGrid( {
		$table : $(".grid").find("table"),
		service : "DmMerchantController",
		method : "queryPage",
		pageIndex : 1,
		pageSize : 10,
		onClickRow : function(data) {
		},
		onClickCell : function(field, value) {
		},
		onDblClickRow : function(data) {
		},
		renderColumn : function(field, value) {
			if (field == "target_name") {
                return "<a>" + value + "</a>";
			}else if(field == "createDate"){
                return $.format.date(value,'yyyy-MM-dd HH:mm:ss');
            }else if(field == "stateDate"){
                return $.format.date(value,'yyyy-MM-dd HH:mm:ss');
            }
            return value;
		}
	});
	
	queryData();
	
	$('#queryForm').keydown(function(e){
		if(e.keyCode==13){
			queryData(); // 某个事件
		}

	})
	

});

function queryData() {
	var params = new Object();
	params.merchantName = $('#qryMerchantName').val();
	testgrid.params = params;
	testgrid.loadData();
}

function lock() {
    if (!testgrid.getSelected()) {
    	messager.alert('请先选择记录！');
		return;
    }
    var state = testgrid.getSelected().state;
    if("00L" == state) {
    	messager.alert("提示","该商户已经锁定！");
    	return;
    }
	var params = new Object();
	params.merchantId = testgrid.getSelected().merchantId;
	params.state = "00L";
	Ajax.getAsy().remoteCall("DmMerchantController", "updateAction", [ params ], function(reply) {
		if (reply.getResult().success == true) {
			messager.alert("提示", "商户锁定，操作成功！");
			queryData();
		} else {
			messager.alert("提示", "操作失败！");
		}
	});
}

function unlock() {
    if (!testgrid.getSelected()) {
    	messager.alert('请先选择记录！');
		return;
    }
    var state = testgrid.getSelected().state;
    if("00A" == state) {
    	messager.alert("提示", "该商户已经解锁！");
    	return;
    }
	var params = new Object();
	params.merchantId = testgrid.getSelected().merchantId;
	params.state = "00A";
	Ajax.getAsy().remoteCall("DmMerchantController", "updateAction", [ params ], function(reply) {
		if (reply.getResult().success == true) {
			messager.alert("提示", "商户解锁，操作成功！");
			queryData();
		} else {
			messager.alert("提示", "操作失败！");
		}
	});
}

function cancel() {
    if (!testgrid.getSelected()) {
    	messager.alert('请先选择记录！');
		return;
    }
    var state = testgrid.getSelected().state;
    if("00X" == state) {
    	messager.alert("提示","该商户已经注销！");
    	return;
    }
	var params = new Object();
	params.merchantId = testgrid.getSelected().merchantId;
	params.state = "00X";
	Ajax.getAsy().remoteCall("DmMerchantController", "updateAction", [ params ], function(reply) {
		if (reply.getResult().success == true) {
			messager.alert("提示", "商户注销，操作成功！");
			queryData();
		} else {
			messager.alert("提示", "操作失败！");
		}
	});
}

