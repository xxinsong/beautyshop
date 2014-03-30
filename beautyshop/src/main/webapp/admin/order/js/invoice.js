var testgrid;

$(function() {
	testgrid = new TableGrid( {
		$table : $(".grid").find("table"),
		service : "DmOrderInvoiceController",
		method : "selectPage",
		pageIndex : 1,
		pageSize : 10,
		onClickRow : function(data) {
		},
		onClickCell : function(field, value) {
		},
		onDblClickRow : function(data) {
		},
		renderColumn : function(field, value) {
			if ("drawupTime" == field) {
				return $.format.date(value,'yyyy-MM-dd HH:mm:ss');
			} 
			return value;
		}
	});
	
	queryData();
});

function queryData() {
	var params = new Object();
	params.orderId = $('#qryOrderId').val();
	params.merchantName = $('#qryMerchantName').val();
	params.receiver = $('#qryReceiver').val();
	params.isDrawup = $('#qryIsDrawup').val();
	testgrid.params = params;
	testgrid.loadData();
}

function issueInvoice() {
    if (!testgrid.getSelected()) {
    	messager.alert('请先选择记录！');
		return;
    }
	var params = new Object();
	params.id = testgrid.getSelected().id;
	var isDrawup = testgrid.getSelected().isDrawup;
	if("Y" == isDrawup) {
    	messager.alert("提示","该订单已经出具发票！");
    	return;
    }
	Ajax.getAsy().remoteCall("DmOrderInvoiceController", "updateInvoice", [params], function(reply) {
		if (reply.getResult().success == true) {
			messager.alert("提示", "出具发票成功！");
			queryData();
		} else {
			messager.alert("提示", "操作失败！");
		}
	});
}

function noIssue() {
    if (!testgrid.getSelected()) {
    	messager.alert('请先选择记录！');
		return;
    }
//	var params = new Object();
//	params.id = memberGrid.getSelected().id;
	var params = testgrid.getSelected();
	var isDrawup = testgrid.getSelected().isDrawup;
	if("N" == isDrawup) {
    	messager.alert("提示","该订单还没有出具发票！");
    	return;
    }
	Ajax.getAsy().remoteCall("DmOrderInvoiceController", "updateInvoiceNo", [params], function(reply) {
		if (reply.getResult().success == true) {
			messager.alert("提示", "取消出具发票成功！");
			queryData();
		} else {
			messager.alert("提示", "操作失败！");
		}
	});
}

