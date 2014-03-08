var pointList;
$(function () {
    switchMenu($("#mnu_mypoint"));
    pointList = new QryPager({
        $tpl_scope:$("#point_list"),
        $tpl_ele:$("#point_tpl"),
        $pager:$("#point_page"),
        service:"DmPointController",
        method:"selectCustPointList",
        pageIndex:1,
        pageSize:5,
        record_event:function(data,context){pointRowRender(data,context)}
    });
    loadPointList();
    getMyEffPoint();
});



function searchOrder(event){
    var cond = $.trim($("#cond").val());
    var params={};
    if(cond){
        params.orderNo=cond;
    }
    switchTab($("#showall").parent());
    loadPointList(params);
}

function loadPointList(params){
    if(!params){
        params = {};
    }
    pointList.loadData(params);
}

function pointRowRender(data,context){
    $("[name='orderNo']",context).text(data.orderNo).on('click',function(){
        window.location.href = commonJs.getWebPath()+"/order/edit?id="+data.orderId;
    });
    $("[name='point']",context).text(data.point);
    var state = data.state;
    if("00A"==state){
    	state = "有效";
    }else if("00D"==state){
    	state = "已消费";
    }else if("00E"==state){
    	state = "已过期";
    }else{
    	state = "未知";
    }
    $("[name='state']",context).text(state);
    $("[name='gainTime']",context).text($.format.date(data.gainTime,'yyyy-MM-dd HH:mm:ss'));
}

function getMyEffPoint(){
	Ajax.getAsy().remoteCall("DmUserController", "queryUserPoint",[], function(reply) {
		var myEffPoints = reply.getResult();
		$("#myEffPoint").html("我的积分-有效积分:"+myEffPoints);
	});
}
