var miniCartPage;
$(function() {
    miniCartPage = new QryPager({
        $tpl_scope:$("#tab_minicart"),
        $tpl_ele:$("#minicart_row_tpl"),
        $pager:$("#minicart_page"),
        service:"DmShoppingCartController",
        method:"getCartGoodsList",
        pageIndex:1,
        pageSize:4,
        record_event:function(data,context){goodsInstRowRender(data,context)}
    });

    $("#btn_pay").on('click',function(){
        window.location.href = commonJs.getWebPath()+"/mycart";
    });

    $(".mini_cart").hover(function() {
        $(this).addClass("opened");
        $(this).find("div.minicart_list").eq(0).show();
    }, function() {
        $(this).removeClass("opened");
        $(this).find("div.minicart_list").eq(0).hide();
    });
    
    $(".header_logo").click(function() {
    	location = commonJs.getWebPath() + "/welcome";
	});

    $("#goodsearch").click(function(){
        if (typeof(queryGoods) == "function") {
            queryGoods();
        }else{
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

        }
    });
    //初始化商品目录
//    initGoodsCataLog();
    //初始化mini购物车
//    initMiniCart();
})

function initGoodsCataLog() {
	if (typeof(from_page) == "undefined" || from_page != "main") {
		//如果不是在首页，加隐藏下拉效果
		$("#allCategoryHeader").hide();
		$("h2.all_sort_link", ".menubar").hover(function() {
			$("#allCategoryHeader").slideDown(200);
		}, function(event) {
			if ($(event.relatedTarget).closest("#allCategoryHeader").size() == 0) {
				$("#allCategoryHeader").slideUp(200);
			}
		});
		$("#allCategoryHeader").hover(function() {
		}, function(event) {
			if ($(event.relatedTarget).closest("h2.all_sort_link").size() == 0) {
				$("#allCategoryHeader").slideUp(200);
			}
		});
	}
	Ajax.getAsy().remoteCall("DmGoodsCatalogController", "searchAllDmGoodsCatalogs", [ { up_catalog_id : -1 } ], function(reply) {
		var catas = reply.getResult();
		if (catas && catas.length > 0) {
			var html = [];
			for ( var i = 0; i < catas.length; i++) {
				html.push("<li>");
				html.push("   <h3>");
				html.push("       <a href='javascript: void(0)' title='" + catas[i].catalog_name + "'>·" + catas[i].catalog_name + "</a>");
				html.push("   </h3>");
				if (catas[i].children.length > 0) {
					html.push("<div style='display: none;'>");
					html.push("	   <div class='show_sort' style='display:block; min-height: 200px; height: 200px;'>");
					html.push("        <div class='show_sort_l fl'>");
					for ( var j = 0; j < catas[i].children.length; j++) {
						html.push("        <dl>");
						html.push("            <dt><a href='javascript: void(0)' catalog_id='" + catas[i].children[j].catalog_id + "'>" + catas[i].children[j].catalog_name + "</a></dt>");
						if (catas[i].children[j].children.length > 0) {
							for ( var k = 0; k < catas[i].children[j].children.length; k++) {
								html.push("    <dd><a href='javascript: void(0)' catalog_id='" + catas[i].children[j].children[k].catalog_id + "'>" + catas[i].children[j].children[k].catalog_name + "</a></dd>");
							}
						}
						html.push("        </dl>");
					}
					html.push("        </div>");
					html.push("    </div>");
					html.push("</div>");
				}
				html.push("</li>");
			}
			
			var $html = $(html.join(""));
			$.each($html, function(i) {
				$(this).find("h3 > a").data("data", catas[i]).click(function() {
					gotoSearch($(this).data("data").catalog_id);
				});
				$(this).find("dl").each(function(j) {
					$(this).find("dt > a").data("data", catas[i].children[j]).click(function() {
						gotoSearch($(this).data("data").catalog_id);
					});
					$(this).find("dd > a").each(function(k) {
						$(this).data("data", catas[i].children[j].children[k]).click(function() {
							gotoSearch($(this).data("data").catalog_id);
						});
					});
				});
			});
			
			var $jq = $("ul.allsort", ".menubar");
			$jq.hide().html($html);
			$jq.children().each(function() {
				$(this).hover(function() {
					$(this).addClass("cur");
					$(this).children("div").show();
				}, function() {
					$(this).removeClass("cur");
					$(this).children("div").hide();
				});
			})
			$jq.slideDown(500);
		}
	});
}

function gotoSearch(catalog_id) {
	window.location = commonJs.getWebPath() + "/search?cata=" + catalog_id;
}


function initMiniCart() {
    m_total=0;
    m_totalPrice = 0.0;
    miniCartPage.loadData({});
}
var m_total=0;
var m_totalPrice=0.0;
function goodsInstRowRender(data,context){
    $("[name='goodsName']",context).text(data.goodsName+"  * "+data.itemNo).on('click',function(){
        window.location.href = commonJs.getWebPath()+"/product?id="+data.goodsId;
    });
    $("[name='price']",context).text("￥"+data.amount);
    $("[name='btn_del']",context).on('click',function(){
        Ajax.getAsy().remoteCall("DmShoppingCartController", "removeGoodsFromCart", [[data.goodsId]], function(){
            initMiniCart();
        });
    });
    m_totalPrice = accAdd(m_totalPrice,data.amount);
    $("#m_totalPrice").text("￥"+m_totalPrice);
    $("#m_total").text(++m_total);
    $("#noneTips").hide();
}

function contactUs(){

    window.location.href = commonJs.getWebPath()+"/help/contact";
}

function switchMainMenu(item){
    $(".headerNavMain .cur").removeClass('cur');
    item.addClass('cur');
}

function AddFavorite() {
    var title ="韩塑美";
    var url = location.href;
    try {
        window.external.addFavorite(url, title);
    }
    catch (e) {
        try {
            window.sidebar.addPanel(title, url, "");
        }
        catch (e) {
            alert("抱歉，您所使用的浏览器无法完成此操作。\n\n加入收藏失败，请使用Ctrl+D进行添加");
        }
    }
}