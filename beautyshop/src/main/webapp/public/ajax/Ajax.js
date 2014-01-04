var Ajax = function(async) {
	if (typeof (async) == "undefined") {
		async = true;
	}
	this.async = async;
}

Ajax.prototype = {
	async : null,
	callback : null,
	stackMessage : null,
	msg : null,
	showStackDialog : function(msg, stackMessage) {
		if ($("#errorWindow").size() == 0) {
			var errorWindow = [];
			errorWindow.push("<div id='errorWindow' iconCls='icon-error' style='width:700px;height:383px;' title='堆栈信息'>");
			errorWindow.push("   <textarea id='errorWindowMsg' style='width:99%;height:340px;overflow:auto;' readOnly='readOnly'>");
			errorWindow.push(stackMessage);
			errorWindow.push("   </textarea>");
			errorWindow.push("</div>");
			$("body").append(errorWindow.join(""));
		} else {
			$("#errorWindowMsg").val(stackMessage);
		}
		$("#errorWindow").dialog( {
			modal : true
		});
	},
	exceptionHandler : function(msg, exc) {
		var self = this;
		var random = "moreImg" + Math.round(Math.random() * 1000);
		var message = [];
		message.push("<div style='height: 100%;position: relative;'>");
		message.push("  <div style='height: 89%; overflow: auto;'>" + msg + "</div>");
		message.push("  <div style='text-align: right;position: absolute;bottom: -5px;right: 0px;'>");
		message.push("     <img id='" + random + "' src='" + path_prefix + "public/base/images/more.gif' style='vertical-align:middle;cursor:hand;'/>")
		message.push("  </div>");
		message.push("</div>");
		$.messager.show( {
			title : "系统提示",
			msg : message.join(""),
			showType : "show",
			width : 350,
			height : 200
		});
		$("#" + random).bind("click", function() {
			self.showStackDialog(msg, exc.stackMessage || (exc.javaClassName + " : " + exc.message));
		});

	},
	_remoteCall : function(serviceName, methodName, params, callBackFunc, exceptionHandlerFunc) {
		params[params.length] = {
			async : this.async,
			callback : function(data) {
				if (callBackFunc != null) {
					var result = {};
					result.data = data;
					result.getResult = function() {
						return this.data;
					}
					callBackFunc(result);
				}
			},
			exceptionHandler : exceptionHandlerFunc
		}
		dwr.engine._execute(dwr.engine._pathToDwrServlet, serviceName, methodName, params);
	}
}

Ajax.prototype.remoteCall = function(serviceName, methodName, params, callBack, exceptionHandler) {
	this._remoteCall(serviceName, methodName, params, callBack, exceptionHandler);
}

Ajax.getAsy = function() {
	return new Ajax(true);
}

Ajax.getSy = function() {
	return new Ajax(false);
}