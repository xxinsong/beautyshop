var win = function() {
	this.$menuTab = $(".menu_tab");
	this.$winDiv = $("#winDiv");
	this.winlist = [];
	this.init();
}

win.prototype.init = function() {
	var me = this;
	$("a.reflash", "div.tabrightbtn").click(function() {
		me.refresh();
	});
	$("a.sclose", "div.tabrightbtn").click(function() {
		me.closeAllWin();
	});
	$(window).resize(function() {
		me.$winDiv.find("iframe").height(document.body.clientHeight - 82);
	});
}

win.prototype.addWin = function (menu) {
	var me = this;

	if (this.contains(menu.menu_id)) {
		return;
	}
	if (this.winlist.length >= 8) {
		messager.alert("提示", "最多打开8个页面"); 
		return;
	}
	
	this.winlist.push(menu.menu_id);
	this.hideWin();
	
	var html = [];
	html.push("<li id='winTab_" + menu.menu_id + "'>");
	html.push("	<a href='javascript: void(0);' class='menuCon'><span>" + menu.menu_name + "</span></a>");
	html.push("	<a href='javascript: void(0);' class='tab_close'>关闭</a>");
	html.push("</li>");
	var liJq = $(html.join(""));
	liJq.data("menu_id", menu.menu_id);
	liJq.click(function() {
		me.activeWin($(this));
	});
	liJq.find("a.tab_close").click(function(event) {
		me.closeWin($(this));
		event.stopPropagation();
	});
	this.$menuTab.find("div").before(liJq);
	this.activeWin(liJq);
	
	html.splice(0, html.length);
	html.push("<div id='win_" + menu.menu_id + "' class='wapper' style='height: 100%;'>");
	html.push("	<iframe frameborder='0' scrolling='auto' style='width: 100%; height: 100%;' src='" + menu.url +"'></iframe>");
	html.push("</div>");
	var divJq = $(html.join(""));
	this.$winDiv.append(html.join(""));
	this.adjustWin();
}

win.prototype.activeWin = function($jq) {
	if ($jq.hasClass("curr")) {
		return;
	}

	$jq.siblings("li").removeClass("curr");
	$jq.addClass("curr");
	this.hideWin();
	this.$winDiv.find("#win_" + $jq.data("menu_id")).show();
}

win.prototype.contains = function(menu_id) {
	for ( var i = 0; i < this.winlist.length; i++) {
		if (this.winlist[i] == menu_id) {
			this.activeWin(this.$menuTab.find("#winTab_" + menu_id));
			return true;
		}
	}
	return false;
}

win.prototype.hideWin = function() {
	this.$winDiv.find("div.wapper").hide();
}

win.prototype.closeWin = function($jq) {
	var menu_id = $jq.closest("li").data("menu_id");
	for ( var i = 0; i < this.winlist.length; i++) {
		if (this.winlist[i] == menu_id) {
			this.winlist.splice(i, 1);
			break;
		}
	}
	this.$winDiv.find("#win_" + menu_id).remove();
	$jq.closest("li").remove();
	if (this.$menuTab.find("li").size() > 0) {
		this.activeWin(this.$menuTab.find("li:last"));
	}
}

win.prototype.adjustWin = function() {
	var $currWin = this.$winDiv.find("#win_" + this.$menuTab.find("li.curr").data("menu_id"));
	$currWin.find("iframe").height(document.body.clientHeight - 82);
}

win.prototype.refresh = function() {
	var $currWin = this.$winDiv.find("#win_" + this.$menuTab.find("li.curr").data("menu_id"));
	$currWin.find("iframe").contents().get(0).location.reload();
}

win.prototype.closeAllWin = function() {
	this.winlist.splice(0, this.winlist.length);
	this.$menuTab.find("li").remove();
	this.$winDiv.find("div.wapper").remove();
}

var myWin;

$(function() {

	myWin = new win();
	myWin.addWin( {
		menu_id : -1,
		menu_name : "首页",
		url : "/admin/main/content_new.html"
	});
})
