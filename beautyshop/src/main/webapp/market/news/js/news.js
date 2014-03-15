var newsList;
$(function() {
    loadNewsCatg();

    newsList = new QryPager({
        $tpl_scope:$("#news_list"),
        $tpl_ele:$("#row_tpl"),
        $pager:$("#news_page"),
        service:"NewsController",
        method:"queryNewsListByKind",
        pageIndex:1,
        pageSize:20,
        record_event:function(data,context){newsRowRender(data,context)}
    });

    showNewsList(1,"公司新闻");
});

function newsRowRender(data,context){
    $("[name='news_title']",context).text(data.newsTitle).on('click',function(){
        $.ajax({
            method:'GET',
            url:commonJs.getWebPath()+"/news/"+data.newsId,
            data:null,
            success:function(result){
                renderNewsDetail(result);
            }
        });
    });
    $("[name='publish_time']",context).text("["+$.format.date(data.publishTime, 'yyyy-MM-dd')+"]");
}

function loadNewsCatg(){
    $.ajax({
        method:'GET',
        url:commonJs.getWebPath()+"/news/kind",
        data:null,
        success:function(result){
            renderNewsCatg(result);
        }
    });
}

function renderNewsCatg(result){
    var html = [];
    for(var i=0;i<result.length;i++) {
        if(i==0){
            html.push("<li class='curr' id='kind"+result[i].attrValue+"'><a href='javascript:void(0)' onclick='showNewsList("+result[i].attrValue+",\""+result[i].attrValueDesc+"\")'>"+result[i].attrValueDesc+"</a></li>");
        }else{
            html.push("<li id='kind"+result[i].attrValue+"'><a href='javascript:void(0)' onclick='showNewsList("+result[i].attrValue+",\""+result[i].attrValueDesc+"\")'>"+result[i].attrValueDesc+"</a></li>");
        }
    }
    $("#newsCatg").html(html.join(""));

}

function showNewsList(catgId,catgName) {
    switchNewsMenu($("#kind"+catgId));
    $("#catg_name").text(catgName);
    var params = {"kind":catgId};
    newsList.loadData(params);
    $("#newsListDiv").show();
    $("#newsDetailDiv").hide();
}

function switchNewsMenu(item){
    $(".user_list .curr").removeClass('curr');
    item.addClass('curr');
}

function renderNewsDetail(detail) {
    $("#newsListDiv").hide();
    $("#newsDetailDiv").show();
    $("#news_title").text(detail.newsTitle);
    $("#publisher").text("作者："+detail.publisher);
    $("#publish_time").text("发布时间："+$.format.date(detail.publishTime, 'yyyy-MM-dd HH:mm:ss'));
    var p = detail.content.split("\n");
    var html = p.join("<br>")
    $("#news_context").html(html);
}