var showState;
var activityPage;
$(function () {
    switchMenu($("#mnu_myactivity"));

    activityPage = new QryPager({
        $tpl_scope:$("#tab_activity"),
        $tpl_ele:$("#row_tpl"),
        $pager:$("#activity_page"),
        service:"DmMerchantActivityController",
        method:"selectMerchantActivityList",
        pageIndex:1,
        pageSize:5,
        record_event:function(data,context){activityRowRender(data,context)}
    });

    loadActivityList();

    $("#showall").bind("click",function(event){loadAll(event)});
    $("#showready").bind("click",function(event){loadReady(event)});
    $("#showprocessing").bind("click",function(event){loadProcessing(event)});
    $("#showdone").bind("click",function(event){loadDone(event)});
    $("#search").bind("click",function(event){searchActivity(event)});
    $("#cond").bind("keydown", function (event) { if (event.keyCode == 13) { $("#search").click(); return false; }});
    $("#create").bind("click", function (event) {createActivity(event)});
});


function switchTab(event) {
    $(".my_order_tab .curr").removeClass();
    $(event.target).parent().parent().addClass("curr");
    $("#cond").val('');
}

function searchActivity(event){
    var cond = $("#cond").val().trim();
    var params={};
    if(cond){
        params.actName='%'+cond+'%';
    }
    if(showState&&showState!=''){
        params.state=showState;
    }
    loadActivityList(params);
}
function loadAll(event){
    switchTab(event);
    showState='';
    loadActivityList();
}
function loadReady(event){
    switchTab(event);
    var params={'state':'0'};
    showState='0';
    loadActivityList(params);
}
function loadProcessing(event){
    switchTab(event);
    var params={'state':'1'};
    showState='1';
    loadActivityList(params);
}

function loadDone(event){
    switchTab(event);
    var params={'state':'2'};
    showState='2';
    loadActivityList(params);
}
function activityRowRender(data,context){
    $("td[name='activity_name']",context).text(data.actName);
    $("a[name='goods_name']",context).text(data.goodsName);
    $("span[name='begin_time']",context).text($.format.date(data.beginTime, "yyyy-MM-dd"));
    $("span[name='end_time']",context).text($.format.date(data.endTime, "yyyy-MM-dd"));
    var state = data.state;
    var $state = $("a[name='state']",context);
    if(state=='0'){
        $state.text('未开始');
    }else if(state=='1'){
        $state.text('进行中');
        $state.attr("class", 'green_font');
    }if(state=='2'){
        $state.text('已完成');
        $state.attr("class", 'gray_font');
    }
    var $btnDel = $("a[name='btn_del']", context).attr("actId",data.actId);
    var $btnMod = $("a[name='btn_mod']", context).attr("actId",data.actId);
    if(state=='0'){
        $btnDel.show();
        $btnDel.bind("click",function(event){delActivity(event)});
        $btnMod.show();
        $btnMod.bind("click",function(event){modActivity(event)});
    }else{
        $btnDel.hide();
        $btnMod.hide();
    }
}
function loadActivityList(params){
    if(!params){
        params = {}
    }
    activityPage.loadData(params);
//    Ajax.getAsy().remoteCall("DmMerchantActivityController", "selectMerchantActivityList", [ params,1,10], callback);
}

function createActivity(event){
    window.location.href=commonJs.getWebPath()+"/market/activity/create";
}

function delActivity(event){
    var $btnDel = $(event.target);
    var actId = $btnDel.attr("actId");
    msg.confirm("提示", "确定要取消该营销活动吗？", function(flag) {
        if(flag) {
            Ajax.getAsy().remoteCall("DmMerchantActivityController", "deleteMerchantActivity", [ actId], function(reply){
                if(reply.getResult()){
                    searchActivity();
                }
            });
        }
    });
}

function modActivity(event){
    var $btnMod = $(event.target);
    var actId = $btnMod.attr("actId");
    $("#actId").val(actId);
    $("#editform").submit();
}