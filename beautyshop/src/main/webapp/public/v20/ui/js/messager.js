var messager = {
	alert : function(title, msg, fn) {
		var html = [];
		html.push("<div id='cautionDialog' class='ui_dialog' style='z-index: 9999;width: 400px;display: none;top: 20%;left: 30%;'>");
		html.push("	<div class='ui_dialog_fore'>");
		html.push("		<div class='ui_dialog_title'>");
		html.push("			<div class='buttons'>");
		html.push("				<a href='javascript: void(0);' onclick='messager.close(this);' class='close_btn'></a>");
		html.push("			</div>");
		html.push("			<span>" + title + "</span>");
		html.push("		</div>");
		html.push("		<div class='ui_dialog_body'>");
		html.push("			<div class='ui_dialog_content'>");
		html.push("				<div style='text-align: center;'>");
		html.push(msg);
		html.push("				</div>");
		html.push("			</div>");
		html.push("			<div class='ui_dialog_btns'>");
		html.push("			    <a name='confirmBtn' href='javascript: void(0);' style='width: 100%;'>确定</a>");
		html.push("			</div>");
		html.push("		</div>");
		html.push("	</div>");
		html.push("</div>");
		
		$("body").append(html.join(""));
		
		//按钮事件
		$("a[name='confirmBtn']", "#cautionDialog").click(function() {
			messager.close(this);
			fn && fn(true);
		});
		
		this.open($("#cautionDialog").draggable( {
			handle : ".ui_dialog_title"
		}));
	},
	confirm : function(title, msg, fn) {
		var html = [];
		html.push("<div id='confirmDialog' class='ui_dialog' style='z-index: 9999;width: 400px;display: none;top: 20%;left: 30%;'>");
		html.push("	<div class='ui_dialog_fore'>");
		html.push("		<div class='ui_dialog_title'>");
		html.push("			<div class='buttons'>");
		html.push("				<a href='javascript: void(0);' onclick='messager.close(this);' class='close_btn'></a>");
		html.push("			</div>");
		html.push("			<span>" + title + "</span>");
		html.push("		</div>");
		html.push("		<div class='ui_dialog_body'>");
		html.push("			<div class='ui_dialog_content' style='position: relative;'>");
		html.push("				<div style='text-align: center;'>");
		html.push(msg);
		html.push("				</div>");
		html.push("			</div>");
		html.push("			<div class='ui_dialog_btns' style='bottom: 0px;'>");
		html.push("			    <a name='confirmBtn' href='javascript: void(0);' class='s_right' style='width: 50%;left: 0px;'>确定</a>");
		html.push("			    <a name='cancelBtn' href='javascript: void(0);' style='width: 50%;right: 0px;'>取消</a>");
		html.push("			</div>");
		html.push("		</div>");
		html.push("	</div>");
		html.push("</div>");
		
		$("body").append(html.join(""));
		
		//按钮事件
		$("a[name='confirmBtn']", "#confirmDialog").click(function() {
			messager.close(this);
			fn && fn(true);
		});
		$("a[name='cancelBtn']", "#confirmDialog").click(function() {
			messager.close(this);
			fn && fn(false);
		});
		
		this.open($("#confirmDialog").draggable( {
			handle : ".ui_dialog_title"
		}));
	},
	toast : function(title, msg) {
		var html = [];
		html.push("<div id='toastDialog' class='ui_dialog' style='width: 400px;display: none;top: 25%;left: 30%;'>");
		html.push("	<div class='ui_dialog_fore'>");
		html.push("		<div class='ui_dialog_title'>");
		html.push("			<span>" + title + "</span>");
		html.push("		</div>");
		html.push("		<div class='ui_dialog_body'>");
		html.push("			<div class='ui_dialog_content'>");
		html.push("				<div style='text-align: center;'>");
		html.push(msg);
		html.push("				</div>");
		html.push("			</div>");
		html.push("		</div>");
		html.push("	</div>");
		html.push("</div>");
		
		$("body").append(html.join(""));
		$("#toastDialog").fadeIn(200);
		setTimeout(function() {
			$("#toastDialog").fadeOut(500).remove();
		}, 1000);
	},
	pop : function($jq, msg) {
		var html = [];
		html.push("<div id='popDialog' class='ui_pop_dialog' style='display: none;'>");
		html.push("	<div class='sharp color1' style='position: relative;'>");
		html.push("		<b class='b1'></b><b class='b2'></b><b class='b3'></b><b class='b4'></b>");
		html.push("		<div class='ui_arrow ui_arrow_position_top' style='display: none;'>");
		html.push("			<em class='s_line1'>◆</em>");
		html.push("			<span class='s_bg1'>◆</span>");
		html.push("		</div>");
		html.push("		<div class='content'>");
		html.push(msg);
		html.push("		</div>");
		html.push("		<div class='ui_arrow ui_arrow_position_bottom'>");
		html.push("			<em class='s_line1'>◆</em>");
		html.push("			<span class='s_bg1'>◆</span>");
		html.push("		</div>");
		html.push("		<b class='b5'></b><b class='b6'></b><b class='b7'></b><b class='b8'></b>");
		html.push("	</div>");
		html.push("</div>");
		
		$("body").append(html.join(""));
		
		var offset = $jq.offset();
		var top = offset.top;
		var left = offset.left;
		var bottom = document.documentElement.clientHeight - top + 8;
		$("#popDialog").css( {
			"left" : left,
			"bottom" : bottom
		}).slideDown(200);
		setTimeout(function() {
			$("#popDialog").slideUp(200, function() {
				$(this).remove();
			});
		}, 2000);
	},
	open : function($jq) {
		this.overlay();
		$jq.show();
	},
	close : function(ele) {
		$(ele).closest(".ui_dialog").remove();
		this.closeOverlay();
	},
	overlay : function() {
		$("body").append("<div id='dialogOverlayer' style='background-color: #333;opacity: 0.18;position: fixed;z-index: 9998;top: 0px;left:0px;width: 100%;height: 100%;filter:alpha(opacity=18);display: none;'></div>");
		$("#dialogOverlayer").show();
	},
	closeOverlay : function() {
		$("#dialogOverlayer").remove();
	}
}