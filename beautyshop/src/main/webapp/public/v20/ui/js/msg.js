var msg = {
    alert : function(title,content,fn){
        var html = [];
        html.push("<div id='cautionDialog' class='dialog' style='z-index: 9999;width:300px; height:130px; left:50%; margin-left:-150px; top:50%; margin-top:-65px;'>");
        html.push("	 <div class='alert_tit'>");
        html.push("		<h2>" + title + "</h2>");
        html.push("			<a href='javascript: void(0);' onclick='msg.close(this);' class='alert_close'></a>");
        html.push("	 </div>");
        html.push("	 <div class='alert_content'>");
        html.push(    content);
        html.push("	 </div>");
        html.push("  <div class='btns'>");
        html.push("		<a name='confirmBtn' href='javascript: void(0);' class='alert_blue' style='margin-right:10px;'>确定</a>");
        html.push("  </div>");
        html.push("</div>");

        $("body").append(html.join(""));

        //按钮事件
        $("a[name='confirmBtn']", "#cautionDialog").click(function() {
            msg.close(this);
            fn && fn(true);
        });

        this.open($("#cautionDialog").draggable( {
            handle : ".alert_tit"
        }));
    },
    confirm : function(title, content, fn) {
        var html = [];
        var pos = getMousePos(event);
        html.push("<div id='cart-delete-dialog' style='display: block; top: "+pos.y+"px; left: "+pos.x+"px; z-index: 9999;' class='dialog'>");
        html.push("	 <div class='dialog_outer'>");
        html.push("		<span class='dialog_bg dialog_bg_n'></span>");
        html.push("		<span class='dialog_bg dialog_bg_ne'></span>");
        html.push("		<span class='dialog_bg dialog_bg_e'></span>");
        html.push("		<span class='dialog_bg dialog_bg_se'></span>");
        html.push("		<span class='dialog_bg dialog_bg_s'></span>");
        html.push("		<span class='dialog_bg dialog_bg_sw'></span>");
        html.push("		<span class='dialog_bg dialog_bg_w'></span>");
        html.push("		<span class='dialog_bg dialog_bg_nw'></span>");
        html.push("		<div class='dialog_inner'>");
        html.push("			<div class='dialog_toolbar clearfix'>");
        html.push("			    <a name='closeBtn' title='关闭' href='javascript:void(0);' class='dialog_close'>关闭</a>");
        html.push("			    <h3 class='dialog_title'>");
        html.push(                  title);
        html.push("             </h3>");
        html.push("         </div>");
        html.push("         <div class='dialog_content'>");
        html.push("             <div class='cart_delete'>");
        html.push(                  content);
        html.push("             </div>");
        html.push("             <div class='btns clearfix'>");
        html.push("                 <a name='confirmBtn' class='btn btn_ok' href='javascript:void(0);'><span class='btn_text'>确定</span></a>");
        html.push("                 <a name='cancelBtn' class='btn btn_cancel' href='javascript:void(0);'><span class='btn_text'>取消</span></a>");
        html.push("                 <div class='clear'></div>");
        html.push("             </div>");
        html.push("         </div>");
        html.push("     </div>");
        html.push("  </div>");
        html.push("</div>");
        $("body").append(html.join(""));

        //按钮事件
        $("a[name='closeBtn']", "#cart-delete-dialog").click(function() {
            msg.close(this);
            fn && fn(false);
        });
        $("a[name='confirmBtn']", "#cart-delete-dialog").click(function() {
            msg.close(this);
            fn && fn(true);
        });
        $("a[name='cancelBtn']", "#cart-delete-dialog").click(function() {
            msg.close(this);
            fn && fn(false);
        });

        this.open($("#cart-delete-dialog").draggable( {
            handle : ".dialog_toolbar"
        }));
    },
    open : function($jq) {
        this.overlay();
        $jq.show();
    },
    close : function(ele) {
        $(ele).closest(".dialog").remove();
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

function getMousePos(event) {
    var e = event || window.event;
    if(e.pageX|| e.pageY){
        return{'x':e.pageX,'y': e.pageY};
    }
    return {'x':e.clientX,'y': e.clientY}
}