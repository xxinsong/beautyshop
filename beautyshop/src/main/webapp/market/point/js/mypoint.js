var pointList;
$(function () {
    switchMenu($("#mnu_mypoint"));
    pointList = new QryPager({
        $tpl_scope:$("#point_list"),
        $tpl_ele:$("#point_tpl"),
        $pager:$("#point_page"),
        service:"DmPointController",
        method:"queryMyPoints",
        pageIndex:1,
        pageSize:5,
        record_event:function(data,context){pointRowRender(data,context)}
    });
    loadPointList();
//    getMyEffPoint();
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
    $("[name='totalPoints']",context).text(data.totalPoints);
    $("[name='remainderPoints']",context).text(data.remainderPoints);
    $("[name='lastExchangePoints']",context).text(data.lastExchangePoints);
    $("[name='lastExchangeTime']",context).text($.format.date(data.lastExchangeTime,'yyyy-MM-dd HH:mm:ss'));
    $("#myEffPoint").html("我的积分-有效积分:"+data.remainderPoints);
}

function getMyEffPoint(){
	Ajax.getAsy().remoteCall("DmUserController", "queryUserPoint",[], function(reply) {
		var myEffPoints = reply.getResult();
		$("#myEffPoint").html("我的积分-有效积分:"+myEffPoints);
	});
}
