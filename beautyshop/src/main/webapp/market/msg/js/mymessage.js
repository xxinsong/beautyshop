var showState;
var orderList;
$(function () {
    switchMenu($("#mnu_mymessage"));
    initPage();
});
function initPage(){
	orderList = new QryPager({
        $tpl_scope:$("#message_list"),
        $tpl_ele:$("#row_tpl"),
        $pager:$("#order_page"),
        service:"DmMessageController",
        method:"selectMyMessageList",
        pageIndex:1,
        pageSize:10,
        record_event:function(data,context){orderRowRender(data,context)}
    });
    var state = commonJs.getUrlParam("state");
    if(state&&state=='processing'){
        loadProcessing();
    }else if(state&&state=='done'){
        loadDone();
    }else{
        loadOrderList();
    }
}

function loadProcessing(){
    var tab = $("#showprocessing").parent();
    switchTab(tab);
    var params={'state':'10E'};
    showState='10E';
    loadOrderList(params);
}

function loadDone(){
    var tab = $("#showdone").parent();
    switchTab(tab);
    var params={'state':'10D'};
    showState='10D';
    loadOrderList(params);
}

function loadOrderList(params){
    if(!params){
        params = {};
    }
    orderList.loadData(params);
}

function switchTab($tab) {
    $(".my_order_tab .curr").removeClass();
    $tab.addClass("curr");
    $("#cond").val('');
    $("#time_filter").val('ALL');
}

function orderRowRender(data,context){
	var msgType = data.msgType;
	if("01"==msgType){
		msgType = "系统消息";
		$("[name='operation']",context).show();
	}else if("02"==msgType){
		msgType = "用户消息";
		$("[name='operation']",context).show();
	}else{
		msgType = "管理员消息";
		$("[name='nooper']",context).show();
	}
	$("[name='msg_type']",context).text(msgType);
	$("[name='msg_content']",context).text(data.content);
	$("[name='send_time']",context).text($.format.date(data.sendTime, 'yyyy-MM-dd HH:mm:ss'));
	$("[name='operation']",context).on('click',function(){
		msg_operation(data.msgId,data.receiverId);
    });
}

function msg_operation(msgId,receiverId){
	var param={};
	param.msgId=msgId;
	param.receiverId=receiverId;
	Ajax.getAsy().remoteCall("DmMessageController","delMsgReceiverById",[param],function(reply){
		initPage();
    });
}