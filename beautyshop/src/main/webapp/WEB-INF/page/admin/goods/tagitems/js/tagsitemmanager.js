var requestParmas = {};
var buttonTools = new ButtonTools();
var selected = "";
var tagitemgrid = "";
var ajaxAsy = Ajax.getAsy();
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

function search_btn(tagsitemgrid) {
	requestParmas["itemValue"] = $('#itemValue').val();
	if ($("#hasTag").val() == "1") {
		requestParmas["tagId"] = $('#itemtagId').val();
	} else {
		requestParmas["tagId"] = "-1";
	}
	tagsitemgrid.loadData(requestParmas);
	$("#cancel").click();
}

/** *******************标签树展示****************************************************************************** */
var zTree;
var selectTreeNode;
var setting = {
	async : {
		enable : true,
		url : "TagsController.query",
		autoParam : [ "tagId=parentTagId" ],
		otherParam : {},
		dataFilter : function(treeId, parentNode, childNodes) {
			return childNodes;
		}
	},
	callback : {
		beforeClick : function beforeClick() {
			if (buttonTools.confirmAction()) {
				return true;
			} else {
				return false;
			}
		},
		onClick : function(event, treeId, treeNode, clickFlag) {
			selectTreeNode = treeNode;
			// 设置当前查询标签id
			commonJs.setData($(".searchformDiv"), {
				"itemtagId" : treeNode.tagId
			});
			$("#hasTag").val("1");
			$("#search_btn").click();
		}
	},
	data : {
		keep : {
			parent : true
		},
		key : {
			name : "tagName",
			idKey : "tagId",
			pIdKey : "parentTagId",
			rootPId : "-1"
		}
	}
};

function loadTagTree() {
	Ajax.getAsy().remoteCall("TagsController", "query", [ {
		"parentTagId" : "-1"
	} ], function(reply) {
		var zNodes = reply.getResult();
		if (zNodes.length > 0) {
			zTree = $.fn.zTree.init($("#tagTree"), setting, zNodes);
		}
	});
}

function selectTag() {
	var param = "";
	var selecttag = window.showModalDialog("../tags/selectiontag.jsp", param, "dialogHeight: 600px; dialogWidth: 1020px;");
	if (selecttag) {
		$("#tagId").val(selecttag.tagId);
		$("#tagName").val(selecttag.tagName);
	} else {
		$("#tagId").val("-1");
		$("#tagName").val("");

	}
}

$(function() {
	loadTagTree();
	/** ********************************************************************* */

	tagitemgrid = new TableGrid({
		$table : $(".grid").find("table"),
		service : "TagsItemController",
		method : "queryPage",
		pageIndex : 1,
		pageSize : 10,
		onClickRow : function(data) {
			selected = this.getSelected();
			if (data.tagId != "-1" && selectTreeNode) {
				data.tagName = selectTreeNode.tagName;
			} else {
				data.tagName = "";
			}

			commonJs.setData($(".formgrid"), data);
		},
		onBeforeClickRow : function(data) {
			if (buttonTools.confirmAction()) {
				return true;
			} else {
				return false;
			}

		},
		onClickCell : function(field, value) {
		},
		onDblClickRow : function(data) {
		},
		renderColumn : function(field, value) {
			return value;
		},
		afterLoadData : function() {
			selected = this.getSelected();
			if (selected != null) {
				if (selected.tagId != "-1" && selectTreeNode) {
					selected.tagName = selectTreeNode.tagName;
				} else {
					selected.tagName = "";
				}
				commonJs.setData($(".formgrid"), selected);
			} else {
				commonJs.clear($(".formgrid"));
			}
			commonJs.disabled($(".formgrid"));
			buttonTools.setCurrentAction("");
		}
	});

	search_btn(tagitemgrid);

	// 查询数据信息
	$("#search_btn").click(function() {
		search_btn(tagitemgrid);
	});

	// 添加武器调用的事件
	$("#add").click(function() {
		selectTreeNode = zTree.getSelectedNodes()[0];

		var tagId = "";
		var tagName = "";
		if (!selectTreeNode) {
			tagId = -1;
		} else {
			tagId = selectTreeNode.tagId;
			tagName = selectTreeNode.tagName;
		}

		if (buttonTools.confirmAction(this)) {
			commonJs.clear($(".formgrid"));
			commonJs.enable($(".formgrid"));
			commonJs.setData($(".formgrid"), {
				"tagId" : tagId,
				"tagName" : tagName
			});
		}
	});

	// 修改页面数据按钮
	$("#update").click(function() {
		selected = tagitemgrid.getSelected();
		if (!selected) {
			messager.alert("提示", "请选择记录");
			return;
		}
		if (buttonTools.confirmAction(this)) {
			commonJs.enable($(".formgrid"));
		}
	});

	/**
	 * 确定按钮 1：统一在后台控制前台显示操作后的信息--约定返回json对象{success:true|false,msg:showWhat};
	 * 2：自定义错误处理-myAjaxExceptionHandler
	 * 3：持久化方法根据当前操作的currentAction决定buttonTools.currentAction
	 */
	$("#sure").click(function() {
		if (buttonTools.confirmAction(this)) {
			if (commonJs.validate($(".formgrid"))) {
				messager.confirm("提示", "确认保存当前信息吗?", function(ok) {
					if (ok) {
						beforeLoading();
						var param = new Object();
						param = commonJs.getData($(".formgrid"));
						ajaxAsy.remoteCall("TagsItemController", buttonTools.currentAction, [ param ], function(replay) {
							afterLoading();
							var result = replay.getResult();
							if (result.success) {
								search_btn(tagitemgrid);
							}
							messager.alert("提示", result.msg);
						}, myAjaxExceptionHandler);

					} else {
						return;
					}
				});
			}
			// 允许确定后，要显示遮罩层禁止操作，进行ajaxt异步持久化数据，回调函数要把当前操作重置成空""search_btn(tagitemgrid);
		}
	});

	/**
	 * 删除按钮 1：持久化方法根据按钮的属性action决定
	 */
	$("#delete").click(function() {
		var $btn = $(this);
		if (buttonTools.confirmAction(this)) {
			selected = tagitemgrid.getSelected();
			if (!selected) {
				messager.alert("提示", "请选择记录");
				return;
			}

			messager.confirm("提示", "确认删除当前信息吗?", function(ok) {
				if (ok) {
					beforeLoading();
					var param = new Object();
					param = commonJs.getData($(".formgrid"));
					ajaxAsy.remoteCall("TagsItemController", $btn.attr("action"), [ param ], function(replay) {
						afterLoading();
						var result = replay.getResult();
						if (result.success) {
							search_btn(tagitemgrid);
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
		if (buttonTools.confirmAction(this)) {
			// 这里不用转换date，因为renderColumn函数已经转换了，类型是string类型
			selected = tagitemgrid.getSelected();
			if (selected)
				commonJs.setData($(".formgrid"), selected);
			commonJs.disabled($(".formgrid"));
		}
	});

	$("#hasTag").change(function() {
		var selectedValue = $(this).children('option:selected').val();
		if (selectedValue == "0") {
			zTree.cancelSelectedNode();
			$('#itemtagId').val("-1");
		}
	});
});