$(function() {
	searchHotGoods();

    $("#availableGoods").on('click',function(){
//        window.location.href=commonJs.getWebPath()+"/"
    });
    $("#waitForPay").on('click',function(){
        window.location.href=commonJs.getWebPath()+"/myorder?state=processing";
    });
    $("#waitForComment").on('click',function(){
        window.location.href=commonJs.getWebPath()+"/myorder?state=done";
    });
})

var delay = {
	queue : [],
	add : function(func, duration) {
		var t = setTimeout(func, duration);
		this.queue.push(t);
	},
	clear : function() {
		clearTimeout(this.queue.pop());
	}
}

function searchHotGoods() {
	Ajax.getAsy().remoteCall("GoodsController", "searchHotGoods", [ 5 ], function(reply) {
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
				html.push("    <p class='tl'>价格：<strong>¥" + (goods.plan_price || "未知") + "</strong></p>");
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

