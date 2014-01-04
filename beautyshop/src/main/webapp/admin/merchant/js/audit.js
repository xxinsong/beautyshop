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
			if (field != "target_name") {
				return value;
			}
			return "<a>" + value + "</a>";
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
	params.state = '00X';
	testgrid.params = params;
	testgrid.loadData();
}

function auditYes() {
    if (!testgrid.getSelected()) {
    	messager.alert('请先选择记录！');
		return;
    }
	var params = new Object();
	params.merchantId = testgrid.getSelected().merchantId;
	Ajax.getAsy().remoteCall("DmMerchantController", "auditYes", [ params ], function(reply) {
		if (reply.getResult().success == true) {
			messager.alert("提示", "审核通过，操作成功！");
			queryData();
		} else {
			messager.alert("提示", "操作失败！");
		}
	});
}

function auditNo() {
    if (!testgrid.getSelected()) {
    	messager.alert('请先选择记录！');
		return;
    }
	var params = new Object();
	params.merchantId = testgrid.getSelected().merchantId;;
	Ajax.getAsy().remoteCall("DmMerchantController", "auditNo", [ params ], function(reply) {
		if (reply.getResult().success == true) {
			messager.alert("提示", "审核不通过，操作成功！");
			queryData();
		} else {
			messager.alert("提示", "操作失败！");
		}
	});
}

