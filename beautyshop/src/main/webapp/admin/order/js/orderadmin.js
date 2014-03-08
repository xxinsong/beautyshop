var testgrid;

$(function() {
	testgrid = new TableGrid( {
		$table : $(".grid").find("table"),
		service : "DmCustOrderController",
		method : "queryAllOrder",
		pageIndex : 1,
		pageSize : 10,
		onClickRow : function(data) {
            if(data.state!="10B"){
                $("#deliver").hide();
            }else{
                $("#deliver").show();
            }
		},
		onClickCell : function(field, value) {
		},
		onDblClickRow : function(data) {
		},
		renderColumn : function(field, value) {
			if ("createTime" == field) {
				return $.format.date(value,'yyyy-MM-dd HH:mm:ss');
			}
            if ("operDate" == field) {
                return $.format.date(value,'yyyy-MM-dd HH:mm:ss');
            }
			return value;
		}
	});
//    $('#qryOrderState').val("10B");
	queryData();
});

function queryData() {
	var params = new Object();
    if($('#qryOrderNo').val()!=''){
	    params.orderNo = $('#qryOrderNo').val();
    }
    if($('#qryLogonName').val()!=''){
	    params.logonName = $('#qryLogonName').val();
    }
    if($('#qryOrderState').val()!=''){
	    params.state = $('#qryOrderState').val();
    }
	testgrid.params = params;
	testgrid.loadData();
}
function deliverGoods(){
    if (!testgrid.getSelected()) {
        messager.alert('请先选择记录！');
        return;
    }
    /*var state = testgrid.getSelected().state;
    if(state == "10D"){
        messager.alter("提示","该订单已经发货！");
        return;
    }else if(state == "10A"){
        messager.alter("提示","该订单已经发货！");
        return;
    }*/
    messager.confirm("确认","确定要对该订单发货吗？",function(result){
        if(result){
            var orderId = testgrid.getSelected().orderId;
            Ajax.getAsy().remoteCall("DmCustOrderController", "deliverGoods", [orderId], function(reply) {
                if (reply.getResult()) {
                    messager.alert("提示", "发货成功！");
                    $("#deliver").hide();
                    queryData();
                } else {
                    messager.alert("提示", "操作失败！");
                }
            });
        }
    })


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


