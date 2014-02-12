var requestParmas = {};
var selectedMsg = "";// 选择特定商品对象
var msgGrid = "";// 商品列表对象
var ajaxAsy = Ajax.getAsy();
var msgButtonTools = new ButtonTools();

/*function selectReceiver() {
	var param = "";
	var selectUser = window.showModalDialog("../../system/selectioinmenu.jsp", param, "dialogHeight: 600px; dialogWidth: 1020px;");
	if (selectUser) {
		$("#receiverId").val(selectUser.userId);
		$("#receiverName").val(selectUser.userName);
	} else {
		$("#receiverId").val("-1");
		$("#receiverName").val("");
	}
}*/

function setSelectUser(typeValue) {
	if (typeValue == "A") {
		$('#receiverId').val("-1");
		$('#receiverName').val("全体用户");
	}else{
		selectedMsg = msgGrid.getSelected();
		$('#receiverId').val(selectedMsg.receiverId);
		$('#receiverName').val(selectedMsg.receiverName);
	}
}

function search_btn(msgGrid) {
	requestParmas["title"] = $('#searchMsgTitle').val();
	msgGrid.loadData(requestParmas);
}

function afterLoading() {
	$("#loading").hide();
	closeOverlay();
}
/**
 * 触发持久化数据的前应用，显示遮罩层 页面定义:<div id="loading" style="background: url(<%=path%>/public/v20/ui/images/loading.gif)
 * #ecf5ff no-repeat;width: 80px;height: 80px;position: absolute;top: 45%;left:
 * 45%;z-index: 3000;filter:alpha(opacity=80);opacity: 0.8;display: none;">
 * </div>
 */
function beforeLoading() {
	overlay();
	$("#loading").show();
}

function myAjaxExceptionHandler(msg, exc) {
	afterLoading();
	var random = "moreImg" + Math.round(Math.random() * 1000);
	var message = [];
	message.push("<div style='height: 100%;position: relative;'>");
	message.push("  <div style='height: 89%; overflow: auto;'>" + msg + "</div>");
	message.push("  <div style='text-align: right;position: absolute;bottom: -5px;right: 0px;'>");
	message.push("     <img id='" + random + "' src='" + path_prefix + "public/base/images/more.gif' style='vertical-align:middle;cursor:hand;'/>");
	message.push("  </div>");
	message.push("</div>");
	$.messager.show({
		title : "系统提示",
		msg : message.join(""),
		showType : "show",
		width : 350,
		height : 200
	});
	$("#" + random).bind("click", function() {
		ajaxAsy.showStackDialog(msg, exc.stackMessage || (exc.javaClassName + " : " + exc.message));
	});
}

$(function() {
	/** ********************************************************************* */
	msgGrid = new TableGrid({
		$table : $("#msgList").find("table"),
		service : "DmMessageController",
		method : "queryPage",
		pageIndex : 1,
		pageSize : 10,
		onClickRow : function(data) {
			selectedMsg = this.getSelected();
			commonJs.setData($("#msg_edit_form"), data);
			setSelectUser(data.receiverType);
		},
		onBeforeClickRow : function(data) {
			if (msgButtonTools.confirmAction()) {
				return true;
			} else {
				return false;
			}
		},
		onClickCell : function(field, value) {
		},
		onDblClickRow : function(data) {
			$("#sure").click();
		},
		renderColumn : function(field, value, row) {
			return value;
		},
		afterLoadData : function() {
			selectedMsg = this.getSelected();
			if (selectedMsg != null) {
				commonJs.setData($("#msg_edit_form"), selectedMsg);
				setSelectUser(selectedMsg.receiverType);
			} else {
				commonJs.clear($("#msg_edit_form"));
			}
			commonJs.disabled($("#msg_edit_form"));
			msgButtonTools.setCurrentAction("");
		}
	});

	search_btn(msgGrid);

	// 查询数据信息
	$("#search_btn").click(function() {
		search_btn(msgGrid);
	});

	$("#add").click(function() {
		if (msgButtonTools.confirmAction(this)) {
			commonJs.clear($("#msg_edit_form"));
			commonJs.enable($("#msg_edit_form"));
			commonJs.setData($("#msg_edit_form"), {
				receiverType : "A",
				msgType:"03"
			});
			setSelectUser("A");
			$("#msgType").attr("disabled",true);
			$("#receiverType").attr("disabled",true);
			$("#receiverName").attr("disabled",true);
		}
	});

	$("#sure").click(function() {
		if (msgButtonTools.confirmAction(this)) {
			if (commonJs.validate($("#msg_edit_form"))) {
				messager.confirm("提示", "确认要发布此消息吗?", function(ok) {
					if (ok) {
						beforeLoading();
						var param = commonJs.getData($("#msg_edit_form"));
						ajaxAsy.remoteCall("DmMessageController", msgButtonTools.currentAction, [ param ], function(replay) {
							afterLoading();
							var result = replay.getResult();
							if (result.success) {
								search_btn(msgGrid);
							}
							messager.alert("提示", result.msg);
						}, myAjaxExceptionHandler);

					} else {
						return;
					}
				});
			}
			// 允许确定后，要显示遮罩层禁止操作，进行ajaxt异步持久化数据，回调函数要把当前操作重置成空""search_btn(msgGrid);
		}
	});

	/**
	 * 删除按钮 1：持久化方法根据按钮的属性action决定
	 */
	$("#delete").click(function() {
		var $btn = $(this);
		selectedMsg = msgGrid.getSelected();
		if (!selectedMsg) {
			messager.alert("提示", "请选择记录");
			return;
		}else if(selectedMsg.receiverType!="A"){
			messager.alert("提示", "用户级别消息不能删除");
			return;
		}
		
		if (msgButtonTools.confirmAction(this)) {
			messager.confirm("提示", "确认删除当前信息吗?", function(ok) {
				if (ok) {
					beforeLoading();
					var param = commonJs.getData($("#msg_edit_form"));
					ajaxAsy.remoteCall("DmMessageController", $btn.attr("action"), [ param ], function(replay) {
						afterLoading();
						var result = replay.getResult();
						if (result.success) {
							search_btn(msgGrid);
						}
						messager.alert("提示", result.msg);
					}, myAjaxExceptionHandler);

				} else {
					return;
				}
			});
		}
	});

	// 取消按钮
	$("#cancel").click(function() {
		if (msgButtonTools.confirmAction(this)) {
			selectedMsg = msgGrid.getSelected();
			if (selectedMsg)
				commonJs.setData($("#msg_edit_form"), selectedMsg);
			commonJs.disabled($("#msg_edit_form"));
		}
	});
	
	/*$("#receiverType").change(function() {
		var selectedValue = $(this).children('option:selected').val();
		setSelectUser(selectedValue);
		if (selectedValue == "A") {
			$('#receiverId').val("-1");
			$('#receiverName').val("全体用户");
		}
	});

	$("#receiverIdTh").hide();
	$("#receiverIdTd").hide();*/
});