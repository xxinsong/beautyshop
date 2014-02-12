var requestParmas = {};
var selectedConsul = "";// 选择特定商品对象
var consulGrid = "";// 商品列表对象
var ajaxAsy = Ajax.getAsy();
var consulButtonTools = new ButtonTools();

function search_btn(consulGrid) {
	requestParmas["goodName"] = $('#searchGoodsName').val();
	requestParmas["merchantName"] = $('#searchMerchantName').val();
	consulGrid.loadData(requestParmas);
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

function consulDateFormate(data) {
	if (data.commitTime) {// 创建时间
		if ($.type(data.commitTime) == "date") {
			data.commitTime = $.formatDate(data.commitTime, "yyyy-MM-dd HH:mm:ss");
		}
	}
	if (data.replyTime) {// 生效时间
		if ($.type(data.replyTime) == "date") {
			data.replyTime = $.formatDate(data.replyTime, "yyyy-MM-dd HH:mm:ss");
		}
	}
	return data;
}

/**
 * 把data json对象中的字符串转成date类型
 * 
 * @param data
 * @returns
 */
function consulToDate(data) {
	var regEx = new RegExp("\\-", "gi");
	if (data.commitTime) {
		if ($.type(data.commitTime) == "string") {
			data.commitTime = new Date(data.commitTime.replace(regEx, "/"));
		}
	}
	if (data.replyTime) {
		if ($.type(data.replyTime) == "string") {
			data.replyTime = new Date(data.replyTime.replace(regEx, "/"));
		}
	}
	return data;
}

$(function() {
	/** ********************************************************************* */
	consulGrid = new TableGrid({
		$table : $("#consulList").find("table"),
		service : "DmMyConsultController",
		method : "queryPage",
		pageIndex : 1,
		pageSize : 10,
		onClickRow : function(data) {
			selectedConsul = this.getSelected();
			commonJs.setData($("#consulEditorForm"), consulDateFormate(data));
		},
		onBeforeClickRow : function(data) {
			if (consulButtonTools.confirmAction()) {
				return true;
			} 
			return false;
		},
		onClickCell : function(field, value) {
		},
		onDblClickRow : function(data) {
			$("#sure").click();
		},
		renderColumn : function(field, value, row) {
			if ("commitTime" == field || "replyTime" == field) {
				if (value)
					return $.formatDate(value, "yyyy-MM-dd HH:mm:ss");
			}
			return value;
		},
		afterLoadData : function() {
			selectedConsul = this.getSelected();
			
			if (selectedConsul != null) {
				commonJs.setData($("#consulEditorForm"), consulDateFormate(selectedConsul));
			} else {
				commonJs.clear($("#consulEditorForm"));
			}
			commonJs.disabled($("#consulEditorForm"));
			consulButtonTools.setCurrentAction("");
		}
	});

	search_btn(consulGrid);

	// 查询数据信息
	$("#search_btn").click(function() {
		search_btn(consulGrid);
	});

	// 编辑回复
	$("#update").click(function() {
		selectedConsul = consulGrid.getSelected();
		if (!selectedConsul) {
			messager.alert("提示", "请选择记录");
			return;
		}else if(selectedConsul.replyContent){
			messager.alert("提示", "当前咨询已回复");
			return;
		}
		if (consulButtonTools.confirmAction(this)) {
			$("#replyContent").removeAttr("disabled");
		}
	});

	$("#sure").click(function() {
		if (consulButtonTools.confirmAction(this)) {
			if (commonJs.validate($("#consulEditorForm"))) {
				messager.confirm("提示", "确认保存当前回复信息吗?", function(ok) {
					if (ok) {
						beforeLoading();
						var param = new Object();
						param = consulToDate(commonJs.getData($("#consulEditorForm")));
						ajaxAsy.remoteCall("DmMyConsultController", consulButtonTools.currentAction, [ param ], function(replay) {
							afterLoading();
							var result = replay.getResult();
							if (result.success) {
								search_btn(consulGrid);
							}
							messager.alert("提示", result.msg);
						}, myAjaxExceptionHandler);

					} else {
						return;
					}
				});
			}
			// 允许确定后，要显示遮罩层禁止操作，进行ajaxt异步持久化数据，回调函数要把当前操作重置成空""search_btn(goodsGrid);
		}
	});
	
	
	// 取消按钮
	$("#cancel").click(function() {
		if (consulButtonTools.confirmAction(this)) {
			selectedConsul = consulGrid.getSelected();
			if (selectedConsul)
				commonJs.setData($("#consulEditorForm"), consulDateFormate(selectedConsul));
			commonJs.disabled($("#consulEditorForm"));
		}
	});

});