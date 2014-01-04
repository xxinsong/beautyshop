var Tab = function() {
	this.tablist = $("div.graph_tab");
	this.init = function() {
		var me = this;
		for ( var i = 0; i < this.tablist.length; i++) {
			var $jq = $(this.tablist[i]);
			var $firstLi = $jq.find("li:first");
			this.toggleTab($firstLi);
			this.toggleContent($firstLi.get(0));
			$jq.find("li").click(function() {
				if ($(this).hasClass("selected")) {
					return;
				}
				try {
					var beforeClickFunc = eval(this.id + "Tab_beforeClick");
					if (typeof(beforeClickFunc) == "function" && !beforeClickFunc.call(window)) {
						return;
					}
				} catch (e) {
				}
				me.toggleTab($(this));
				me.toggleContent(this);
			});
		}
	};
	this.toggleTab = function($jq) {
		$jq.siblings("li").removeClass("selected");
		$jq.addClass("selected");
	};
	this.toggleContent = function(ele) {
		var $content = $("#" + ele.id + "Tab");
		$content.siblings("div").hide();
		$content.show();
	};
	this.init();
};

$(function() {
	Tab();
});