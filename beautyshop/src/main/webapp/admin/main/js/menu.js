$(function() {
	var t;
	$("a.quickMenuLink").hover(function() {
		$(this).addClass("curr");
		$("#quick_menu").slideDown(200);
	}, function() {
		t = setTimeout(function() {
			$("a.quickMenuLink").removeClass("curr");
			$("#quick_menu").slideUp(200);
		}, 1000);
	});
	$("#quick_menu").hover(function() {
		clearTimeout(t);
	}, function() {
		$("a.quickMenuLink").removeClass("curr");
		$(this).slideUp(200);
	});
	

	
	Ajax.getAsy().remoteCall("MenuController", "searchAllMenus", [ { parentMenu : -1 } ], function(reply) {
		var menuList = reply.getResult();
		$("#quick_menu").html(createMenus(menuList));
		bindMenuEvent();
		$("#quick_menu").children().show();
		
		$("#indexBg").html(indexShow(menuList));
		indexbindMenuEvent();
		$("#indexBg").children().show();
	});
})

function createMenus(menuList) {
	var html = [];
	if (!menuList || menuList.length == 0) {
		return "";
	}
	html.push("<div class='quickMenu_div' style='display: none;'>");
	html.push("	<div class='color_white' style='position: relative;'>");
	html.push("		<div class='content' style='background-color: transparent;'>");
	html.push("			<ul class='wp_list'>");
	for ( var i = 0; i < menuList.length; i++) {
		var title = "title='" + menuList[i].menuName + "'";
		var dataStr = "";
		if (menuList[i].isLeaf == "1") {
			dataStr = "menu_id='" + menuList[i].menuId + "' menu_name='" + menuList[i].menuName + "' url='" + menuList[i].url + "'";
		}
		if (i == menuList.length - 1) {
			html.push("			<li style='border-bottom-width: 0px;' " + title + " " + dataStr + ">");

		} else {
			html.push("			<li " + title + " " + dataStr + ">");
		}
		html.push("                 <a href='javascript: void(0)'>");
		html.push("                     <span class='mn'>" + menuList[i].menuName + "</span>");
		if (menuList[i].isLeaf == "0") {
			html.push("                 <span class='cata'>&gt;</span>");
		}
		html.push("                 </a>");
		html.push(createMenus(menuList[i].children));
		html.push("				</li>");
	}
	html.push("			</ul>");
	html.push("		</div>");
	html.push("     <div class='' style='filter: alpha(opacity = 80); opacity: 0.8; position: absolute; left: 0px; right: 0px; top: 0px; bottom: 0px; background-color: #fff; z-index: -1;'></div>");
	html.push("	</div>");
	html.push("</div>");
	return html.join("");
}

function indexShow(menuList){
	var html = [];
	html.push("<div class='content1'><ul>");
	for ( var i = 0; i < menuList.length; i++) {
		html.push(tabShow(menuList[i].children));
	}
	html.push("</ul></div>");
	return html.join("");
}

function tabShow(menuList){
	var html = [];
	if (!menuList || menuList.length == 0) {
		return "";
	}
	for ( var i = 0; i < menuList.length; i++) {
		if( menuList[i].menuName=="返利管理"/*||menuList[i].menuName=="标签管理"*/||menuList[i].menuName=="商品管理"||menuList[i].menuName=="商户管理"||menuList[i].menuName=="广告管理"|| menuList[i].menuName=="发货管理"||menuList[i].menuName=="消息管理"){
			var img="";
			if( menuList[i].menuName=="返利管理"){
				img="icon06.png";
			}
			/*if( menuList[i].menuName=="标签管理"){
				img="icon02.png";
			}*/
			if( menuList[i].menuName=="商品管理"){
				img="icon03.png";
			}
			if( menuList[i].menuName=="商户管理"){
				img="icon04.png";
			}
			if( menuList[i].menuName=="广告管理"){
				img="icon05.png";
			}
			/*if( menuList[i].menuName=="商品定价管理"){
				img="icon06.png";
			}*/
			if( menuList[i].menuName=="发货管理"){
				img="icon07.png";
			}
			if( menuList[i].menuName=="消息管理"){
				img="icon08.png";
			}
			var title = "title='" + menuList[i].menuName + "'";
			var dataStr = "";
			if (menuList[i].isLeaf == "1") {
				dataStr = "menu_id='" + menuList[i].menuId + "' menu_name='" + menuList[i].menuName + "' url='" + menuList[i].url + "'";
			}
			html.push("			<li " + title + " " + dataStr + ">");
			html.push("                 <a href='javascript: void(0)'>");
			html.push("                     <p><img src=\"images/"+img+"\" width=\"60\" height=\"45\" /></p><p>" + menuList[i].menuName + "</p>");
			html.push("                 </a>");
			html.push("				</li>");
		}
	}
	return html.join("");
}

function bindMenuEvent() {
	$("li", $("#quick_menu")).each(function() {
		$(this).hover(function() {
			var $jq = $(this);
			var $div = $jq.children("div");
			var position = $jq.position();
			var top = position.top;
			var left = position.left + $jq.width();
			var wHeight = document.body.clientHeight - $jq.offset().top;
			if (wHeight < $div.outerHeight()) {
				top -= $div.outerHeight() - wHeight;
			}
			$jq.children("a").addClass("cur");
			$jq.children("div").css( {
				"top" : top,
				"left" : left
			}).show();
		}, function() {
			$(this).children("a").removeClass("cur");
			$(this).children("div").hide();
		}).click(function() {
			var menu = {};
			menu.menu_id = $(this).attr("menu_id");
			menu.menu_name = $(this).attr("menu_name");
			menu.url = $(this).attr("url");
			if (menu.url == "null" || $.trim(menu.url) == "") {
				return;
			}
			myWin.addWin(menu);
		});
	});
	
	$(".quickMenu_div", $("#quick_menu")).hover(function() {
	}, function(event) {
		if ($(event.relatedTarget).closest(".quickMenu_div").size() == 0) {
			$("#quick_menu").hide();
		}
	});
}

function indexbindMenuEvent() {
	$("li", $("#indexBg")).click(function() {
		var menu = {};
		menu.menu_id = $(this).attr("menu_id");
		menu.menu_name = $(this).attr("menu_name");
		menu.url = $(this).attr("url");
		if (menu.url == "null" || $.trim(menu.url) == "") {
			return;
		}
		window.parent.myWin.addWin(menu);
	});
}