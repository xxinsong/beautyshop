$(function() {
	var search_params = commonJs.getUrlParams(location.href);
	/*if ($.isEmptyObject(search_params) || !search_params.cata || !$.isNumeric(search_params.cata)) {
		location = "/welcome";
	} else {*/
		initPage(search_params);
		queryCurrPos(search_params);
		queryGoodsTags(search_params);
		queryGoods();
//	}
})

function initPage(search_params) {
    $("#searchField").val(wq||"输入搜索关键字");
	if (search_params.order) {
		$("dl.order").find("dd").removeClass("curr");
		$("dl.order").find("dd[query_type='" + search_params.order + "']").addClass("curr");
	}
	$("dl.order").find("dd").click(function() {
		var $jq = $(this);
		if ($jq.hasClass("curr")) {
			return;
		}
		$jq.addClass("curr").siblings("dd").removeClass("curr");
		searchGoodsByQueryType();
	});

    $("#goodsearch").click(function(){
        var goodsName = "";
        if($.trim($("#searchField").val())){
            if("输入搜索关键字"!=$("#searchField").val()){
                goodsName = $("#searchField").val();
            }
        }
        if(goodsName){
            location = commonJs.getWebPath() + "/search?wq="+encodeURI(encodeURI(goodsName));
        }else{
            location = commonJs.getWebPath() + "/search";
        }
    });
}

function queryCurrPos(search_params) {
	Ajax.getAsy().remoteCall("DmGoodsCatalogController", "queryFullCataName", [ search_params.cata ], function(reply) {
		var result = reply.getResult();
		var html = [];
		var arr = result.split(">");
		for ( var i = 0; i < arr.length; i++) {
			html.push("<a href='javascript: void(0)'>" + arr[i] + "</a>");
			html.push(" <span>></span> ");
		}
		if (html.length > 0) {
			html.pop();
		}
		$("#curr_pos").html(html.join(""));
	});
}

function queryGoodsTags(search_params) {
	var s_tags = [];
	if (search_params.prop) {
		var props = search_params.prop.split(";");
		for ( var i = 0; i < props.length; i++) {
			var arr1 = props[i].split(":");
			if (arr1.length != 2) {
				continue;
			}
			var obj = {};
			obj.tag_id = arr1[0];
			obj.item = [];
			var arr2 = arr1[1].split(",");
			for ( var j = 0; j < arr2.length; j++) {
				if (arr2[j] == "") {
					continue;
				}
				obj.item.push(arr2[j]);
			}
			s_tags.push(obj);
		}
	}
	Ajax.getAsy().remoteCall("GoodsController", "searchGoodsTags", [ search_params ], function(reply) {
		var tags = reply.getResult();
		if (tags.length > 0) {
			var html = [];
			if (s_tags.length > 0) {
				html.push("<div class='brandAttrCurr'>");
				html.push("  	 <div class='currTitle'>您已选择：</div>");
				html.push("      <div class='attrValues'>");
				html.push("          <div class='selection'>");
				html.push("              <ul class='clearfix' style='margin-left:10px;'>");
				for ( var i = 0; i < s_tags.length; i++) {
					for ( var j = 0; j < tags.length; j++) {
						if (s_tags[i].tag_id == tags[j].tag_id) {
							var temp1 = [];
							var temp2 = [];
							for ( var k = 0; k < s_tags[i].item.length; k++) {
								for ( var ii = 0; ii < tags[j].tags_item.length; ii++) {
									if (s_tags[i].item[k] == tags[j].tags_item[ii].item_id) {
										temp1.push(tags[j].tags_item[ii].item_id);
										temp2.push(tags[j].tags_item[ii].item_desc);
									}
								}
							}
							if (temp2.length > 0) {
								var key = tags[j].tag_id + ":" + temp1.join(",");
								var strs = tags[j].tag_name + "：" + temp2.join("、");
								html.push("<li class='av_selected' key='" + key + "'>");
								html.push("    <a title='" + strs + "' href='javascript: void(0)'>");
								if (len(strs) > 10) {
									strs = strs.substring(0, 7) + "...";
								}
								html.push("        <span>" + strs + "</span>");
								html.push("        <i></i>");
								html.push("    </a>");
								html.push("</li>");
							}
						}
					}
				}
				html.push("              </ul>");
				html.push("          </div>");
				html.push("      </div>");
				html.push("</div>");
			}
			var $html = $(html.join(""));
			$html.find("li").each(function() {
				$(this).find("i").click(function() {
					$(this).closest("li").remove();
					searchGoodsByTags();
				});
			});
			$("#goodTags").html($html);
			$html.height($html.find("div.attrValues").height());
			
			html.splice(0, html.length);
			for ( var i = 0; i < tags.length; i++) {
				if (tags[i].tags_item.length == 0) {
					continue;
				}
				
				var s_tag = null;
				for ( var j = 0; j < s_tags.length; j++) {
					if (s_tags[j].tag_id == tags[i].tag_id) {
						s_tag = s_tags[j];
						break;
					}
				}
				if (s_tag != null) {
					continue;
				}
				
				html.push("<div class='j_brand attr' key='" +  tags[i].tag_id + "'>");
				html.push("    <div class='attrKey'>" + tags[i].tag_name + "：</div>");
				html.push("    <div class='attrValues'>");
				html.push("        <span class='all'>");
				html.push("            <a class='cur' href='javascript: void(0)' style='display: none;'>不限</a>");
				html.push("        </span>");
				html.push("        <div class='av_options' style='display: ;' op='0'><a href='javascript: void(0)' class='select_more'><i></i>多选</a></div>");
				html.push("        <div class='selection'>");
				html.push("            <ul class='clearfix'>");
				
				var items = tags[i].tags_item;
				for ( var j = 0; j < items.length; j++) {
					var s_flag = false;
					if (s_tag) {
						for ( var k = 0; k < s_tag.item.length; k++) {
							if (s_tag.item[k] == items[j].item_id) {
								s_flag = true;
							}
						}
					}
					html.push("            <li class='" + (s_flag ? "av_selected" : "") + "' key='" + items[j].item_id + "'>");
					html.push("                <a title='" + items[j].item_desc + "' href='javascript: void(0)'>");
					html.push("                   <span>" + items[j].item_desc + "</span>");
					html.push("                   <i></i>");
					html.push("                </a>");
					html.push("            </li>");
				}
				
				html.push("            </ul>");
				html.push("        </div>");
				html.push("        <div class='av_btns' style='display: none;'>");
				html.push("            <a href='javascript: void(0)' class='surebtn'>确定</a>");
				html.push("            <a href='javascript: void(0)' class='cancelbtn'>取消</a>");
				html.push("        </div>");
				html.push("    </div>");
				html.push("    <div class='clear'></div>");
				html.push("</div>");
			}
			
			$html = $(html.join(""));
			$.each($html, function(j) {
				var $div = $(this);
				var $all = $div.find("span.all > a"); //不限
				var $more = $div.find("div.av_options"); //多选
				$all.click(function() {
					var $jq = $(this);
					if (!$jq.hasClass("cur")) {
						$jq.addClass("cur");
						$jq.parent().siblings("div.selection").find("li").removeClass("av_selected");
						searchGoodsByTags();
					}
				});
				$more.click(function() {
					$(this).attr("op", "1").hide().siblings("div.av_btns").show();
				});
				//确定
				$div.find("div.av_btns > a.surebtn").click(function() {
					if ($(this).parent().siblings("div.selection").find("li.av_selected").size() > 0) {
						searchGoodsByTags();
					}
				});
				//取消
				$div.find("div.av_btns > a.cancelbtn").click(function() {
					$(this).parent().hide().siblings("div.av_options").attr("op", "0").show();
					$(this).parent().siblings("div.selection").find("li").removeClass("av_selected");
				});
				
				var size = $div.find("li.av_selected").size();
				if (size > 1) {
					$more.click();
					$all.removeClass("cur");
				} else if (size > 0) {
					$all.removeClass("cur");
				}
				$div.find("li").click(function(event) {
					var $jq = $(this);
					if (event.target.tagName != "I") {
						
						var op = $jq.closest("div.selection").siblings("div.av_options").attr("op");
						if (op == 0) {
							$jq.siblings().removeClass("av_selected");
						}
						//选择
						if (!$jq.hasClass("av_selected")) {
							$jq.addClass("av_selected")
							$jq.closest("div.selection").siblings("span.all").find("a").removeClass("cur");
							
							
							if (op == 0) {
								searchGoodsByTags();
							}
						}
					} else {
						var op = $jq.closest("div.selection").siblings("div.av_options").attr("op");
						
						//取消选择
						$jq.removeClass("av_selected");
						if ($jq.siblings("li.av_selected").size() == 0) {
							$jq.closest("div.selection").siblings("span.all").find("a").addClass("cur");
						}
						
						if (op == 0) {
							searchGoodsByTags();
						}
						
					}
				});
			});
			$("#goodTags").append($html);
		}
	});
}

function searchGoodsByTags() {
	var prop = [];
	$("#goodTags").find("div.brandAttrCurr").each(function() {
		$(this).find("li.av_selected").each(function() {
			prop.push($(this).attr("key"));
		});
	});
	$("#goodTags").find("div.j_brand").each(function() {
		var item = [];
		$(this).find("li.av_selected").each(function() {
			item.push($(this).attr("key"));
		});
		if (item.length > 0) {
			prop.push($(this).attr("key") + ":" + item.join(","));
		}
	});
	var search_params = commonJs.getUrlParams(location.href);
	search_params.prop = prop.join(";");
	var search_url = location.href;
	if (location.href.indexOf("?") > 0) {
		search_url = location.href.substring(0, location.href.indexOf("?"));
	}
	location = search_url + "?" + commonJs.param(search_params);
}

function searchGoodsByQueryType() {
	var search_params = commonJs.getUrlParams(location.href);
	search_params.order = $("dl.order").find("dd.curr").attr("query_type");
	var search_url = location.href;
	if (location.href.indexOf("?") > 0) {
		search_url = location.href.substring(0, location.href.indexOf("?"));
	}
	location = search_url + "?" + commonJs.param(search_params);
}

var goodsPager = null;
function queryGoods() {
    $("div.pagin").find("a[name='prev']").click(function() {
        if(!$(this).hasClass("prev_disabled")) {
            goodsPager.getPager().find("a.page_prev").click();
        }
    });
    $("div.pagin").find("a[name='next']").click(function() {
        if(!$(this).hasClass("next_disabled")) {
            goodsPager.getPager().find("a.page_next").click();
        }
    });
    if (goodsPager == null) {
        goodsPager = new QryPager( {
            $tpl_scope : $("#goods_list"),
            $tpl_ele : $("#goods_tpl"),
            $pager : $("#goods_pager"),
            service : "GoodsController",
            method : "searchGoodsPage",
            pageIndex : 1,
            pageSize : 5,
            record_event : function(data, context) {
                $("[name='goods_name']", context).html(data.goods_name || "").on('click', function() {
                    window.location.href = commonJs.getWebPath() + "/product?id=" + data.goods_id;
                });
                if(data.image_uri&&data.image_uri!=null){
                    $(".proImg", context).html("<img src='" + path_prefix.substring(0, path_prefix.lastIndexOf("/")) + data.image_uri + "' width='250' height='250' style='cursor: pointer;'/>");
                }
                $(".proImg > img", context).click(function() {
                    window.location.href = commonJs.getWebPath() + "/product?id=" + data.goods_id;
                });
                $("[name='goods_desc']", context).html(data.goods_desc || "");
                $("[name='base_price']", context).html("￥" + (data.plan_price || "未知"));
                $("[name='putaway_time']", context).html(data.putaway_time || "");
                $("[name='inst_num']", context).html("已售出（" + (data.inst_num || "0") + "）");
                $("[name='comment_num']", context).html("<span class='star five_star'></span>评论（" + (data.comment_num || "0") + "）");
                //加入购物车
                $("a[name='addCar']", context).click(function() {
                    putIntoCart(data.goods_id);
                });
                $("[name='goodsId']", context).val(data.goods_id);
            },
            afterLoadData : function(data) {
                $("div.total").find("strong").html(data.total || 0);
                if (this.getPager().find("a.page_prev").hasClass("page_disabled")) {
                    $("div.pagin").find("a[name='prev']").removeClass("prev").addClass("prev_disabled");
                } else {
                    $("div.pagin").find("a[name='prev']").removeClass("prev_disabled").addClass("prev");
                }
                if (this.getPager().find("a.page_next").hasClass("page_disabled")) {
                    $("div.pagin").find("a[name='next']").removeClass("next").addClass("next_disabled");
                } else {
                    $("div.pagin").find("a[name='next']").removeClass("next_disabled").addClass("next");
                }
            }
        });
    }
    var params = {};
    params.query_type = $("dl.order").find("dd.curr").attr("query_type");
    params.prop = [];
    var search_params = commonJs.getUrlParams(location.href);
    if (search_params.prop) {
        var props = search_params.prop.split(";");
        for ( var i = 0; i < props.length; i++) {
            var arr1 = props[i].split(":");
            if (arr1.length != 2) {
                continue;
            }
            var arr2 = arr1[1].split(",");
            for ( var j = 0; j < arr2.length; j++) {
                if (arr2[j] == "") {
                    continue;
                }
                params.prop.push(arr1[0] + ":" + arr2[j]);
            }
        }
    }
    if($.trim($("#searchField").val())){
        if("输入搜索关键字"!=$("#searchField").val()){
            params.goodsName = $("#searchField").val();
        }
    }

    if(!params.goodsName){
        params.goodsName = "";
    }
    params.catalog_id = search_params.cata;
    goodsPager.loadData(params);
}

function putIntoCart(goodsId){
    $.ajax({
        type:"PUT",
        url:commonJs.getWebPath()+"/mycart/add/"+goodsId,
        success:function(retval){
            initMiniCart();
            window.location.href = commonJs.getWebPath()+"/mycart/success";
        },
        error:function(){

        }
    });
}
/*
function addFavor(goodsId){
    $.ajax({
        type:"PUT",
        url:commonJs.getWebPath()+"/mycart/add/"+goodsId,
        success:function(retval){
            initMiniCart();
            window.location.href = commonJs.getWebPath()+"/mycart/success";
        },
        error:function(){

        }
    });
}*/
