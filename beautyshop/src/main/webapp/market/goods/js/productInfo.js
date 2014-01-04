$(function () {
    var goodsId = commonJs.getUrlParam("id");
//    var orderId = commonJs.getUrlParam("cmt");
    $("#goodsId").val(goodsId);
    loadGoodsInfo(goodsId);
    findGoodsTag(goodsId);
    $(".proBuyBtn .tocart").bind("click", sumitGoods);
    $("#mapTag").on("mouseenter", showMapSelect);
    initTab("rel_tab", "curr", $(".pro_info_tab"));
//    $("#commentsTab").click();
});

//查找商品
function loadGoodsInfo(goodsId) {

    var callback = function (reply) {
        var goods = reply.getResult();

        $("#goodsName").html(goods.goodsName);

        $("#basePrice").append(goods.planPrice || "未知");
        //$("#preBasePrice").html(goods.basePrice);
        $("#goodsDesc").html(goods.goodsDesc);
//        alert(goods.putawayTime);
        var putawayTime = $.format.date(goods.putawayTime, 'yyyy-MM-dd HH:mm:ss');

        $("#putawayTime").html(putawayTime);

        if(goods.imageUri&&goods.imageUri!=null){
            $("#goods_img").html("<img src='" + commonJs.getWebPath() + goods.imageUri + "' width='358' height='358' />");
        }
        $("#inst_num").html("已售出（" + (goods.inst_num || "0") + "）");
		$("#comment_num").html("<span class='star five_star'></span>评论（" + (goods.comment_num || "0") + "）");
		
		$("[name='goodsName']", "#goods_detail").html(goods.goodsName);
		$("[name='putawayTime']", "#goods_detail").html($.format.date(goods.putawayTime, 'yyyy-MM-dd HH:mm:ss'));
		$("[name='goodsNo']", "#goods_detail").html(goods.goodsNo);
		$("[name='type']", "#goods_detail").html(goods.type);
		$("[name='goodsProps']", "#goods_detail").html(goods.goodsProps);
		$("[name='hints']", "#goods_detail").html(goods.hints);

    }
    Ajax.getAsy().remoteCall("DmGoodsController", "getGoodsById", [
        {"goodsId": goodsId}
    ], callback);

}
//动态显示商品标签
function findGoodsTag(goodsId) {

    var callback = function (reply) {
        var goods = reply.getResult();

        var tags = {};
        var tagItem = {};
        for (var i = 0; goods && ( i < goods.length ); i++) {
            var temgood = goods[i];
            if (!tagItem[temgood.TAG_ID]) {
                tagItem[temgood.TAG_ID] = {};
                //这里记录分类标签
                tags[temgood.TAG_ID] = { "TAG_NAME": temgood.TAG_NAME, "TAG_ID": temgood.TAG_ID };
            }
            //一个标签下面有很多条目，目前暂定只有二级标签
            tagItem[temgood.TAG_ID][temgood.ITEM_ID] = {"ITEM_ID": temgood.ITEM_ID, "ITEM_VALUE": temgood.ITEM_VALUE, "ITEM_DESC": temgood.ITEM_DESC, "TAG_ID": temgood.TAG_ID }

        }

        for (var pro in tags) {

            var tag_id = tags[pro]["TAG_ID"];
            var items = tagItem[tag_id];
            var itemHtml = [];
            itemHtml.push("<ul style='display:none;'  id='items_id_" + tag_id + "' rel_a='tag_id_" + tag_id + "'   >");
            for (var it in items) {
                itemHtml.push("<li><a href='#'><input type='checkbox' name='checkbox'  item_id= '" + items[it].ITEM_ID + "'  tag_id= '" + items[it].TAG_ID + "'  /> " + items[it].ITEM_DESC + "  </a></li>");
            }
            itemHtml.push("<div class='clear'></div></ul> ");
            //把一个标签加进去
            $("#goodsTag").append(" <a href='#'  rel_div='items_id_" + tag_id + "'   id='tag_id_" + tag_id + "'    >" + tags[pro]["TAG_NAME"] + "</a>");
            //添加多选
            $("div .filer_list").append(itemHtml.join(""));
        }

        $("#goodsTag").children("a").each(function () {

            $(this).bind("mouseenter", function () {
                    $(this).siblings("a").removeClass("selected");
                    $(this).addClass("selected");
                    //把所有可见的ul  先隐藏
                    var show = false;
                    $(".filer_list > ul:visible").hide("fast", function () {
                        show = true;
                        $("#" + $(this).attr("rel_div")).show("slow");
                    });

                    if (!show) {
                        $("#" + $(this).attr("rel_div")).show("slow");
                    }
                }
            )
        })

        $("#goodsTag > a:first").trigger("mouseenter");

    }

    Ajax.getAsy().remoteCall("TagsItemController", "findGoodsTag", [
        {"goodsId": goodsId}
    ], callback);

}


function sumitGoods() {
    var goodsId = $("#goodsId").val();
    var tags = [];
    $("input:checked", ".filer_list").each(function () {
        var item_id = $(this).attr("item_id");
        var tag_id = $(this).attr("tag_id");
        var item_desc = $(this).parent().text();
        tags.push({"item_id": item_id, "tag_id": tag_id, "item_desc": item_desc });

    })
    
    if(tags.length == 0 ){
    	  alert("请选择标签!");
    	  return;
    }

     var circle_id = $("#circle_id").val( );
    if(!circle_id){
    	  alert("请选择营销区域!");
    	    $("#mapTag").trigger("mouseenter" );
    	    return;
    }
    var callback = function (reply) {
        var result = reply.getResult();
        if (result) {
            alert("加入成功");
            initMiniCart();
        }
    }
    Ajax.getAsy().remoteCall("DmGoodsInstController", "sumitCartGoods", [
        {"goodsId": goodsId, "tags": tags,"circle_id":circle_id}
    ], callback);

}

//显示地图选择
function showMapSelect() {


    $("div[name='positionTriggerInfo']").css({
        "top": "3%",
        "right": "1%"
    });
    var html = $("div[name='map_region']", "div[name='positionTriggerInfo']").html();
    if (!html||html.trim()=="") {
        $("div[name='map_region']", "div[name='positionTriggerInfo']").html("<iframe src='mapSelectSmall.jsp' frameborder='0' scrolling='auto' width='100%' height='1000px'></iframe>");
    }
    //位置触发界面确定事件
    $("a[name='confirmBtn']", "div[name='positionTriggerInfo']").unbind("click").click(function () {
        $("div[name='positionTriggerInfo']").hide();
 
    });

    $("div[name='positionTriggerInfo']").show();

}

function addCircleId(circle_id) {
    $("#circle_id").val(circle_id);
}

function isHaveCircle(){
	return $("#circle_id").val( );
}

function clearCircle(){
	return $("#circle_id").val("" );
}

