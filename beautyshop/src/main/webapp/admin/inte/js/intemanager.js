var interfaceGrid;
var selectedRow = "";
var paramRow = "";
var myButtonTools = new ButtonTools();
var ajaxAsy = Ajax.getAsy();
var paramAction = "";

function dateFormate(data) {
	if (data.createDate) {// 创建时间
		if ($.type(data.createDate) == "date") {
			data.createDate = $.formatDate(data.createDate, "yyyy-MM-dd hh:mm:ss");
		}
	}
	if (data.publishTime) {// 生效时间
		if ($.type(data.publishTime) == "date") {
			data.publishTime = $.formatDate(data.publishTime, "yyyy-MM-dd hh:mm:ss");
		}
	}
	return data;
}

function toDate(data) {
	var regEx = new RegExp("\\-", "gi");
	if (data.createDate) {
		if ($.type(data.createDate) == "string") {
			data.createDate = new Date(data.createDate.replace(regEx, "/"));
		}
	}
	if (data.publishTime) {
		if ($.type(data.publishTime) == "string") {
			data.publishTime = new Date(data.publishTime.replace(regEx, "/"));
		}
	}
	return data;
}

$(function() {
	interfaceGrid = new TableGrid( {
		$table : $("#intGrid").find("table"),
		service : "SystemInterfaceController",
		method : "searchAllByPage",
		pageIndex : 1,
		pageSize : 10,
		onClickRow : function(data) {
			selectedRow = this.getSelected();
			commonJs.setData($("#interfaceEditForm"), dateFormate(selectedRow));
			searchParamTags();
		},
		onClickCell : function(field, value) {
		},
		onDblClickRow : function(data) {
		},
		renderColumn : function(field, value) {
			return value;
		},
		afterLoadData : function() {
			selectedRow = this.getSelected();
			if (selectedRow != null) {
				commonJs.setData($("#interfaceEditForm"), dateFormate(selectedRow));
			} else {
				commonJs.clear($("#interfaceEditForm"));
			}
			commonJs.disabled($("#interfaceEditForm"));
			myButtonTools.setCurrentAction("");
			searchParamTags();
		}
	});
	
	paramGrid = new TableGrid( {
		$table : $("#paramList").find("table"),
		service : "InterfaceParamController",
		method : "searchAllByPage",
		pageIndex : 1,
		pageSize : 5,
		onClickRow : function(data) {
			paramRow = this.getSelected();
			commonJs.setData($("#paramEditForm"), paramRow);
		},
		onClickCell : function(field, value) {
		},
		onDblClickRow : function(data) {
		},
		renderColumn : function(field, value) {
			return value;
		},
		afterLoadData : function() {
			paramRow = this.getSelected();
			if (paramRow != null) {
				commonJs.setData($("#paramEditForm"), paramRow);
			} else {
				commonJs.clear($("#paramEditForm"));
			}
			commonJs.disabled($("#paramEditForm"));
		}
	});
	
	queryData();
	
	$("#add").click(function() {
		if (myButtonTools.confirmAction(this)) {
			commonJs.clear($("#interfaceEditForm"));
			commonJs.enable($("#interfaceEditForm"));
			commonJs.setData($("#interfaceEditForm"), {
				state : "00A"
			});
		}
	});
	
	// 修改页面数据按钮
	$("#update").click(function() {
		selectedRow = interfaceGrid.getSelected();
		if (!selectedRow) {
			messager.alert("提示", "请选择记录");
			return;
		}

		if (myButtonTools.confirmAction(this)) {
			commonJs.enable($("#interfaceEditForm"));
		}
	});
	
	$("#sure").click(function() {
		if (myButtonTools.confirmAction(this)) {
			if (commonJs.validate($("#interfaceEditForm"))) {
				messager.confirm("提示", "确认保存当前信息吗?", function(ok) {
					if (ok) {
						beforeLoading();
						var param = new Object();
						param = toDate(commonJs.getData($("#interfaceEditForm")));
						ajaxAsy.remoteCall("SystemInterfaceController", myButtonTools.currentAction, [ param ], function(replay) {
							afterLoading();
							var result = replay.getResult();
							if (result.success) {
								queryData();
							}
							messager.alert("提示", result.msg);
						});

					} else {
						return;
					}
				});
			}
		}
	});
	
	// 取消按钮
	$("#cancel").click(function() {
		if (myButtonTools.confirmAction(this)) {
			// 这里不用转换date，因为renderColumn函数已经转换了，类型是string类型
			selectedRow = interfaceGrid.getSelected();
			if (selectedRow)
				commonJs.setData($("#interfaceEditForm"), dateFormate(selectedRow));
			commonJs.disabled($("#interfaceEditForm"));
		}
	});
	
	$("#addParam").click(function() {
		if(paramAction) {
			messager.alert("提示", "当前数据状态不可操作！请先取消当前操作或对当前操作进行确定保存");
			return;
		}
		selectedRow = interfaceGrid.getSelected();
		var interfaceId = selectedRow.interfaceId;
		commonJs.clear($("#paramEditForm"));
		commonJs.enable($("#paramEditForm"));
		commonJs.setData($("#paramEditForm"), {
			"interfaceId" : interfaceId
		});
		paramAction = "addParam";
	});
	
	$("#updateParam").click(function() {
		if(paramAction) {
			messager.alert("提示", "当前数据状态不可操作！请先取消当前操作或对当前操作进行确定保存");
			return;
		}
		paramRow = paramGrid.getSelected();
		if (!paramRow) {
			messager.alert("提示", "请选择记录");
			return;
		}
		commonJs.enable($("#paramEditForm"));
		paramAction = "updateParam";
	});
	
	$("#deleteParam").click(function() {
		if(paramAction) {
			messager.alert("提示", "当前数据状态不可操作！请先取消当前操作或对当前操作进行确定保存");
			return;
		}
		paramRow = paramGrid.getSelected();
		if (paramRow) {
			messager.confirm("提示", "确认删除当前信息吗?", function(ok) {
				if (ok) {
					beforeLoading();
					ajaxAsy.remoteCall("InterfaceParamController", "deleteParam", [ paramRow ], function(replay) {
						afterLoading();
						var result = replay.getResult();
						if (result.success) {
							queryData();
						}
						messager.alert("提示", result.msg);
					});
	
				} else {
					return;
				}
			});
			return;
		}
	});
	
	$("#sureParam").click(function() {
		if(paramAction) {
			if (commonJs.validate($("#paramEditForm"))) {
				messager.confirm("提示", "确认保存当前信息吗?", function(ok) {
					if (ok) {
						beforeLoading();
						var param = new Object();
						param = commonJs.getData($("#paramEditForm"));
						ajaxAsy.remoteCall("InterfaceParamController", paramAction, [ param ], function(replay) {
							afterLoading();
							var result = replay.getResult();
							if (result.success) {
								queryData();
							}
							messager.alert("提示", result.msg);
							paramAction = "";
						});
		
					} else {
						return;
					}
				});
			}
		} else {
			messager.alert("提示", "请先选择操作");
		}
	});
	
	// 取消按钮
	$("#cancelParam").click(function() {
		paramRow = paramGrid.getSelected();
		if (paramRow)
			commonJs.setData($("#paramEditForm"), paramRow);
		commonJs.disabled($("#paramEditForm"));
		paramAction = "";
	});
	
});

function queryData() {
	var params = new Object();
	params.interfaceName = $('#qryName').val();
	interfaceGrid.params = params;
	interfaceGrid.loadData();
}

function afterLoading() {
	$("#loading").hide();
	closeOverlay();
}

function beforeLoading() {
	overlay();
	$("#loading").show();
}

function loadIntParams(me) {
	if (myButtonTools.currentAction == "") {
		$("#" + me.id + "Tab").show();
	}
}

/**
 * 根据选择的接口加载该接口参数
 */
function searchParamTags() {
	selectedRow = interfaceGrid.getSelected();
	if (selectedRow) {
		paramGrid.loadData({
			"interfaceId" : selectedRow.interfaceId
		});
	} else {
		paramGrid.clearRows();
	}
}

function interfaceTab_beforeClick() {
	if (paramAction != "") {
		messager.alert("提示", "请先保存或者取消当前操作");
		return false;
	} else {
		return true;
	}
}

function intParamsTab_beforeClick() {
	if (myButtonTools.currentAction  != "") {
		messager.alert("提示", "请先保存或者取消当前操作");
		return false;
	} else {
		return true;
	}
}

