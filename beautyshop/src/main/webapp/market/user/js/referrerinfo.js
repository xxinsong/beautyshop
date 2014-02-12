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
