var referrerList;
$(function(){
    switchMenu($("#mnu_myreferrer"));

    referrerList = new QryPager({
        $tpl_scope:$("#referrer_list"),
        $tpl_ele:$("#row_tpl"),
        $pager:$("#referrer_page"),
        service:"ReferrerInfoController",
        method:"queryMyReferrers",
        pageIndex:1,
        pageSize:5,
        record_event:function(data,context){referrerRowRender(data,context)}
    });

    loadAddressList();

    loadTotalGain();

});

function loadAddressList(params){
    if(!params){
        params = {}
    }
    referrerList.loadData(params);
}

function referrerRowRender(data,context){
    $("[name='presenteeName']",context).text(data.presenteeName);
    $("[name='createTime']",context).text($.format.date(data.createTime,'yyyy-MM-dd HH:mm:ss'));
}

function loadTotalGain(){
    $.ajax({
        method:'GET',
        url:commonJs.getWebPath()+"/setting/referrer/total",
        success:function(data){
            $("#totalReferrer").text("共有会员数："+data.total);
        }
    });
    $.ajax({
        method:'GET',
        url:commonJs.getWebPath()+"/setting/referrer/earnings",
        success:function(data){
            $("#totalGain").text("共获得余额：￥"+data.total);
            $("#gain").text("已支付余额：￥"+data.total - data.remainder);
            $("#blance").text("未支付余额：￥"+data.remainder);
        }
    });
}