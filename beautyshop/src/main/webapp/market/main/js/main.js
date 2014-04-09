$(function() {
    searchAdGoods();
    searchHotGoods();
    queryTopNotices();
    queryUserMsg();

    $("#availableGoods").on('click',function(){
        window.location.href=commonJs.getWebPath()+"/order?state=processing";
    });
    $("#waitForPay").on('click',function(){
        window.location.href=commonJs.getWebPath()+"/order?state=processing";
    });
    /*$("#waitForComment").on('click',function(){
        window.location.href=commonJs.getWebPath()+"/order?state=done";
    });*/
});

var delay = {
	queue : [],
	add : function(func, duration) {
		var t = setTimeout(func, duration);
		this.queue.push(t);
	},
	clear : function() {
		clearTimeout(this.queue.pop());
	}
};
function searchAdGoods(){
    var mainParams = {"num":5,"adLevel":"1"};
    Ajax.getAsy().remoteCall("GoodsController", "searchAdGoods", [mainParams ], function(reply) {
        var adgoodsList = reply.getResult();
        var html = [];
        if (adgoodsList && adgoodsList.length > 0) {
            for ( var i = adgoodsList.length-1; i >= 0; i--) {
                var adgood = adgoodsList[i];
                html.push("<a href='"+commonJs.getWebPath() + "/ad?id=" + adgood.goods_id+"' target='_blank'><img src='"+commonJs.getWebPath()+adgood.adimageurl+"' alt='' width='1000' height='362' /></a>");
            }
            var $html = $(html.join(""));
            $("#KinSlideshow").append($html);
        }
        $("#KinSlideshow").KinSlideshow({
            moveStyle:"right",
            titleBar:{titleBar_height:30,titleBar_bgColor:"#6a6a6a",titleBar_alpha:0.1},
            titleFont:{TitleFont_size:12,TitleFont_color:"#FFFFFF",TitleFont_weight:"normal"},
            isHasBtn:true,
            btn:{btn_bgColor:"#FFFFFF",btn_bgHoverColor:"#ff72a0",btn_fontColor:"#000000",
                btn_fontHoverColor:"#FFFFFF",btn_borderColor:"#e21482",
                btn_borderHoverColor:"#1188c0",btn_borderWidth:1}
        });
    });

    /*var secondParams = {"num":5,"adLevel":"2"};
    Ajax.getAsy().remoteCall("GoodsController", "searchAdGoods", [secondParams ], function(reply) {
        var adgoodsList = reply.getResult();
        var secondeCount = 0;
        if (adgoodsList && adgoodsList.length > 0) {
            for ( var i = 0; i < adgoodsList.length; i++) {
                var adgood = adgoodsList[i];
                if(adgood.adorder=="1"){
                    var src=getMiniImage(adgood.adimageurl);
                    $("#right_info").append("<a target='_blank' id='secondFirstA' href='#' style='cursor: pointer;'><img id='secondFirst' src='"+src+"' width='218' height='90' /></a>");
                    $("#secondFirstA").attr("href",commonJs.getWebPath() + "/product?id=" + adgood.goods_id);
                }else{
                    var $clone = $("#templSecondeId").clone();
                    $clone.attr("id",adgood.goods_id);
                    $($clone).attr("href",commonJs.getWebPath() + "/product?id=" + adgood.goods_id);
                    $("img",$clone).attr("src",getMiniImage(adgood.adimageurl));
                    $("img",$clone).attr("alt",adgood.addesc);

                    $(".p_title",$clone).html(adgood.goods_name);
                    $(".price",$clone).html("折扣价:￥"+adgood.price);
                    $(".comment",$clone).html("评论("+adgood.comment_num+")");
                    $(".mini_promo").append($clone);
                    $clone.show();
                    secondeCount++;
                    if(secondeCount==3){
                        break;
                    }
                }

            }
        }
    });*/
}

function searchHotGoods() {
    Ajax.getAsy().remoteCall("GoodsController", "searchHotGoods", [ 10 ], function(reply) {
        var goodsList = reply.getResult();
        if (goodsList && goodsList.length > 0) {
            var html = [];
            html.push("<div class='tab_li_content none'>");
            html.push("    <ul class='clearfix'>");
            for ( var i = 0; i < goodsList.length; i++) {
                var goods = goodsList[i];
                html.push("<li>");
                html.push("    <a title='" + (goods.goods_name || "") + "' class='pro_img' href='javascript: void(0)'>");
                html.push("       <img src='" + path_prefix.substring(0, path_prefix.lastIndexOf("/")) + goods.image_uri + "' width='150' height='150' />");
                html.push("    </a>");
                html.push("    <a target='_blank' title='" + (goods.goods_name || "") + "' href='" + (commonJs.getWebPath() + "/product?id=" + goods.goods_id) + "' class='pro_name'>" + (goods.goods_name || "") + "</a>");
                html.push("    <p class='starCon'><span class='star fivestar'></span></p>");
                html.push("    <p class='tl'>价格：<strong>¥" + (goods.price || "未知") + "</strong>&nbsp;&nbsp;<span ><del>(￥"+goods.ori_price+")</del></span></p>");
                html.push("    <p class='buyOn'><span>售出（" + (goods.inst_num || "0") + "）</span><span>评论（" + (goods.comment_num || "0") + "）</span></p>");
                html.push("</li>");
            }
            html.push("    </ul>");
            html.push("</div>");
            $("#hot_goods_div").find(".div_loading").remove();
            var $html = $(html.join(""));
            $html.find("li").each(function(i) {
                $(this).data("data", goodsList[i]).find("img").click(function() {
                    window.open(commonJs.getWebPath() + "/product?id=" + $(this).closest("li").data("data").goods_id);
                });
            });
            $("#hot_goods_div").append($html);
        }
    });
}

function queryTopNotices() {
    Ajax.getAsy().remoteCall("DmNoticeController", "queryTopNotice",[3], function(reply) {
        var noticesList = reply.getResult();
        if(noticesList && noticesList.length > 0) {
            var html = [];
            html.push("<ul class='news_list'>");
            for(var i = 0; i < noticesList.length; i++) {
                var notice = noticesList[i];
                if(i == noticesList.length -1) {
                    html.push(" <li><a class='last' href='javascript: void(0)'>·"+ notice.noticeTitle +"</a></li>");
                    break;
                }
                html.push(" <li><a href='javascript: void(0)'>·"+ notice.noticeTitle +"</a></li>");
            }
            html.push("</ul>");
            var $html = $(html.join(""));
            $html.find("li").each(function(i) {
                $(this).data("data", noticesList[i]).click(function() {
                    window.open(commonJs.getWebPath() + "/notice?id=" + $(this).closest("li").data("data").noticeId);
                });
            });
            $("#top_notices").append($html);
        }
    });
}

function queryUserMsg(){
    Ajax.getAsy().remoteCall("DmUserController", "queryUserPoint",[], function(reply) {
        var myPoints = reply.getResult();
        $("[name='userPoint']", "#quick_user_div").html(myPoints);
    });
    /*Ajax.getAsy().remoteCall("DmUserController", "queryUserActivity",[], function(reply) {
        var myActivity = reply.data;
        $("[name='userActivity']").html(myActivity);
    });*/
    Ajax.getAsy().remoteCall("DmUserController", "queryUserBePaid",[], function(reply) {
        var userBePaid = reply.data;
        $("[name='userBePaid']").html(userBePaid);
    });
	Ajax.getAsy().remoteCall("DmUserController","queryDeliver",[],function(reply){
		var deliver = reply.data;
		$("[name='deliver']").html(deliver);
	});
}

function getMiniImage(uri){
    if(uri&&uri!=''){
        var filePath = uri.substring(0,uri.lastIndexOf("."));
        var subfix = uri.substring(uri.lastIndexOf("."));
        return commonJs.getWebPath()+filePath+"_mini"+subfix;
    }
}


