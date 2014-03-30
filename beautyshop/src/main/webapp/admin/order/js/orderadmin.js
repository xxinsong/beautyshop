var testgrid;
var detailgrid;

$(function() {
	testgrid = new TableGrid( {
		$table : $("#orderList"),
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
            if(data.state!="10C" && data.state!="10A"){
                $("#btnDel").hide();
            }else{
                $("#btnDel").show();
            }
            if(data.state!="10E"){
                $("#receiveMoney").hide();
            }else{
                $("#receiveMoney").show();
            }
            loadOrderDetail(data);
		},
		onClickCell : function(field, value) {
		},
		onDblClickRow : function(data) {
		},
		renderColumn : function(field, value) {
            /*if ("orderNo" == field) {
                return "<a onclick='javascript:showOrderDetail("+value+")'>"+value+"</a>";
            }*/
			if ("createTime" == field) {
				return $.format.date(value,'yyyy-MM-dd HH:mm:ss');
			}
            if ("operDate" == field) {
                return $.format.date(value,'yyyy-MM-dd HH:mm:ss');
            }
			return value;
		}
	});

    detailgrid = new TableGrid( {
        $table : $("#detailList"),
        service : "DmCustOrderController",
        method : "querySubOrder",
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

function confirmReceiveMoney(){
    if (!testgrid.getSelected()) {
        messager.alert('请先选择记录！');
        return;
    }
    messager.confirm("确认","确定已经收到该订单的款项了吗？",function(result){
        if(result){
            var orderId = testgrid.getSelected().orderId;
            Ajax.getAsy().remoteCall("DmCustOrderController", "confirmReceiveMoney", [orderId], function(reply) {
                if (reply.getResult()) {
//                    messager.alert("提示", "发货成功！");
                    $("#receiveMoney").hide();
                    queryData();
                } else {
                    messager.alert("提示", "操作失败！");
                }
            });
        }
    })
}

function deleteOrder(){
    if (!testgrid.getSelected()) {
        messager.alert('请先选择记录！');
        return;
    }
    messager.confirm("确认","确定要删除该订单吗？",function(result){
        if(result){
            var orderId = testgrid.getSelected().orderId;
            Ajax.getAsy().remoteCall("DmCustOrderController", "deleteOrder", [orderId], function(reply) {
                if (reply.getResult()) {
                    messager.alert("提示", "删除成功！");
                    $("#btnDel").hide();
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

function loadOrderDetail(row){
    $("[name='order_no']").text(row.orderNo);
    $("[name='amount']").text("￥"+row.amount);
    $("[name='rel_man']").text(row.relaMan);
    $("[name='rel_phone']").text(row.relaTel);
    $("[name='rel_address']").text(row.fullAddress);
    $("[name='rel_zipcode']").text(row.zipCode);
    $("[name='create_time']").text($.format.date(row.createTime,'yyyy-MM-dd HH:mm:ss'));

    var params = {}
    params.orderId = row.orderId;
    detailgrid.params = params;
    detailgrid.loadData();
}



