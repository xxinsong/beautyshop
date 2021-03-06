var noticeGrid;
var selectedNotice = "";
var noticesButtonTools = new ButtonTools();
var ajaxAsy = Ajax.getAsy();

function dateFormate(data) {
	if (data.publishTime) {// 生效时间
		if ($.type(data.publishTime) == "date") {
			data.publishTime = $.formatDate(data.publishTime, "yyyy-MM-dd hh:mm:ss");
		}
	}
	return data;
}

function toDate(data) {
	var regEx = new RegExp("\\-", "gi");
	if (data.publishTime) {
		if ($.type(data.publishTime) == "string") {
			data.publishTime = new Date(data.publishTime.replace(regEx, "/"));
		}
	}
	return data;
}

$(function() {
	noticeGrid = new TableGrid( {
		$table : $(".grid").find("table"),
		service : "NewsController",
		method : "queryNewsListByKind",
		pageIndex : 1,
		pageSize : 8,
		onClickRow : function(data) {
			selectedNotice = this.getSelected();
			commonJs.setData($("#noticesEditorForm"), dateFormate(selectedNotice));
		},
		onClickCell : function(field, value) {
		},
		onDblClickRow : function(data) {
		},
		renderColumn : function(field, value) {
			if ("publishTime" == field) {
				return $.format.date(value,'yyyy-MM-dd HH:mm:ss');
			}
			if("content" == field && value!="" && value!=null) {
				return value.substr(0,30) + "...";
			}
			return value;
		},
		afterLoadData : function() {
			selectedNotice = this.getSelected();
			if (selectedNotice != null) {
				commonJs.setData($("#noticesEditorForm"), dateFormate(selectedNotice));
			} else {
				commonJs.clear($("#noticesEditorForm"));
			}
			commonJs.disabled($("#noticesEditorForm"));
			noticesButtonTools.setCurrentAction("");
		}
	});
	
	queryData();
	
	$("#add").click(function() {
		if (noticesButtonTools.confirmAction(this)) {
			commonJs.clear($("#noticesEditorForm"));
			commonJs.enable($("#noticesEditorForm"));
			commonJs.setData($("#noticesEditorForm"), {
//				state : "00A",
				publishTime : new Date()
			});
		}
	});
	
	// 修改页面数据按钮
	$("#update").click(function() {
		selectedNotice = noticeGrid.getSelected();
		if (!selectedNotice) {
			messager.alert("提示", "请选择记录");
			return;
		}

		if (noticesButtonTools.confirmAction(this)) {
			commonJs.enable($("#noticesEditorForm"));
		}
	});
	// 删除页面数据按钮
	$("#delete").click(function() {
		selectedNotice = noticeGrid.getSelected();
		if (!selectedNotice) {
			messager.alert("提示", "请选择记录");
			return;
		}
        messager.confirm("提示","你确定要删除这条新闻吗？",function(reply){
            if(reply){
                var param = new Object();
                param = toDate(commonJs.getData($("#noticesEditorForm")));
                ajaxAsy.remoteCall("NewsController", "deleteAction", [ param ], function(replay) {
                    afterLoading();
                    var result = replay.getResult();
                    if (result.success) {
                        queryData();
                    }
                    messager.alert("提示", result.msg);
                });
            }else{
                return;
            }

        })

	});

	$("#sure").click(function() {
		if (noticesButtonTools.confirmAction(this)) {
			if (commonJs.validate($("#noticesEditorForm"))) {
                beforeLoading();
                var param = new Object();
                param = toDate(commonJs.getData($("#noticesEditorForm")));
                ajaxAsy.remoteCall("NewsController", noticesButtonTools.currentAction, [ param ], function(replay) {
                    afterLoading();
                    var result = replay.getResult();
                    if (result.success) {
                        queryData();
                    }
                    messager.alert("提示", result.msg);
                });
			}
		}
	});
	
	// 取消按钮
	$("#cancel").click(function() {
		if (noticesButtonTools.confirmAction(this)) {
			// 这里不用转换date，因为renderColumn函数已经转换了，类型是string类型
			selectedNotice = noticeGrid.getSelected();
			if (selectedNotice)
				commonJs.setData($("#noticesEditorForm"), dateFormate(selectedNotice));
			commonJs.disabled($("#noticesEditorForm"));
		}
	});
});

function queryData() {
	var params = new Object();
	params.newsTitle = $('#qryTitle').val();
	params.kind = $('#qryKind').val();
	noticeGrid.params = params;
	noticeGrid.loadData();
}

function afterLoading() {
	$("#loading").hide();
	closeOverlay();
}

function beforeLoading() {
	overlay();
	$("#loading").show();
}

