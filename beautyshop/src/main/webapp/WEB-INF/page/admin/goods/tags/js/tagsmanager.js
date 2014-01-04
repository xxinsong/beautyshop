function tagDateFormate(data) {
	if (data.createDate) {
		if ($.type(data.createDate) == "date") {
			data.createDate = $.formatDate(data.createDate, "yyyy-MM-dd hh:mm:ss");
		}
	}
	return data;
}

/**
 * 把data json对象中的字符串转成date类型
 * @param data
 * @returns
 */
function toTagDataDate(data) {
	var regEx = new RegExp("\\-", "gi");
	if (data.createDate) {
		if ($.type(data.createDate) == "string") {
			data.createDate = new Date(data.createDate.replace(regEx, "/"));
		}
	}
	return data;
}

function afterLoading() {
	$("#loading").hide();
	closeOverlay();
}
/**
 * 触发持久化数据的前应用，显示遮罩层
 * 页面定义:<div id="loading" style="background: url(<%=path%>/public/v20/ui/images/loading.gif) #ecf5ff no-repeat;width: 80px;height: 80px;position: absolute;top: 45%;left: 45%;z-index: 3000;filter:alpha(opacity=80);opacity: 0.8;display: none;">
 </div>
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
	message.push("     <img id='" + random + "' src='" + path_prefix + "public/base/images/more.gif' style='vertical-align:middle;cursor:hand;'/>")
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

function beforeClick() {
	if (tagButtonTools.confirmAction()) {
		return true;
	} else {
		return false;
	}
}

function zTreeBeforeAsync(treeId, treeNode, msg) {
}

function zTreeOnAsyncSuccess(treeId, treeNode, msg) {
}

function zTreeOnAsyncError(treeId, treeNode, msg) {
}

/**
 * parentNode==null --用在节点设置treenode的parent相关值
 * parentNode!=null --用在跟节点或子节点添加初始化treenode的parent相关值
 * @param node
 * @param parentNode
 * @returns
 */
function setParent(treenode, parentNode) {
	if (!parentNode)
		parentNode = treenode.getParentNode();

	if (parentNode) {
		treenode.parentTagName = parentNode.tagName;
		treenode.parentTagId = parentNode.tagId;
	} else {
		treenode.parentTagName = "";
		treenode.parentTagId = "-1";
	}
	return treenode;
}

var zTree;
var selectTreeNode;
var requestParmas = {};
var tagButtonTools = new ButtonTools();
var ajaxAsy = Ajax.getAsy();

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
		beforeAsync : zTreeBeforeAsync, // 异步加载事件之前得到相应信息    
		asyncSuccess : zTreeOnAsyncSuccess,//异步加载成功的fun    
		asyncError : zTreeOnAsyncError, //加载错误的fun    
		beforeClick : beforeClick,//捕获单击节点之前的事件回调函数  
		onClick : function(event, treeId, treeNode, clickFlag) {
			commonJs.setData($("#tag_edit_form"), tagDateFormate(setParent(treeNode)));
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
			rootId : "-1"
		}
	}
};

$(function() {
	loadTagTree();
	commonJs.disabled($("#tag_edit_form"));

	//添加根节点绑定事件
	$("#add_root").click(function() {
		if (tagButtonTools.confirmAction(this)) {
			commonJs.clear($("#tag_edit_form"));
			commonJs.enable($("#tag_edit_form"));
			commonJs.setData($("#tag_edit_form"), {
				"parentTagId" : "-1"
			});
			$("input[name='parentTagName']", $("#tag_edit_form")).attr("disabled", true);
		}
	});

	//添加孩子节点绑定事件
	$("#add_child").click(function() {
		selectTreeNode = zTree.getSelectedNodes()[0];
		if (!selectTreeNode) {
			$("#cancel").click();
			messager.alert("提示", "请选择父标签");
			return;
		} else {
			if (selectTreeNode.isLeaf == "1") {
				messager.alert("提示", "叶子节点不能添加子标签");
				return;
			}
		}

		if (tagButtonTools.confirmAction(this)) {

			if (selectTreeNode) {
				commonJs.clear($("#tag_edit_form"));
				commonJs.enable($("#tag_edit_form"));
				commonJs.setData($("#tag_edit_form"), setParent({}, selectTreeNode));
				$("input[name='parentTagName']", $("#tag_edit_form")).attr("disabled", true);
			}
		}
	});

	//修改页面数据按钮
	$("#update").click(function() {
		selectTreeNode = zTree.getSelectedNodes()[0];
		if (selectTreeNode) {
			if (tagButtonTools.confirmAction(this)) {
				commonJs.enable($("#tag_edit_form"));
				$("input[name='parentTagName']", $("#tag_edit_form")).attr("disabled", true);
				$("select[name='isLeaf']", $("#tag_edit_form")).attr("disabled", true);
			}
		} else {
			messager.alert("提示", "请选择标签");
		}
	});

	/**
	 * 确定按钮
	 * 1：统一在后台控制前台显示操作后的信息--约定返回json对象{success:true|false,msg:showWhat};
	 * 2：自定义错误处理-myAjaxExceptionHandler
	 * 3：持久化方法根据当前操作的currentAction决定buttonTools.currentAction
	 */
	$("#sure").click(function() {
		if (tagButtonTools.confirmAction(this)) {
			if (commonJs.validate($("#tag_edit_form"))) {
				messager.confirm("提示", "确认保存当前信息吗?", function(ok) {
					if (ok) {
						beforeLoading();
						var param = toTagDataDate(commonJs.getData($("#tag_edit_form")));
						ajaxAsy.remoteCall("TagsController", tagButtonTools.currentAction, [ param ], function(replay) {
							afterLoading();
							var result = replay.getResult();
							if (result.success) {
								$("#cancel").click();
								var theTag = result.me;
								if (theTag) {//只有添加才有值
									if (theTag.parentTagId == "-1") {
										loadTagTree();
									} else {
										zTree.reAsyncChildNodes(zTree.getSelectedNodes()[0], "refresh");
									}
									;
								} else {
									theTag = zTree.getSelectedNodes()[0];
									if (theTag.getParentNode()) {
										zTree.reAsyncChildNodes(theTag.getParentNode(), "refresh");
									} else {
										loadTagTree();
									}
									commonJs.setData($("#tag_edit_form"), {});
								}

							}

							messager.alert("提示", result.msg);
						}, myAjaxExceptionHandler);

					} else {
						return;
					}
				});
			}
			//允许确定后，要显示遮罩层禁止操作，进行ajaxt异步持久化数据，回调函数要把当前操作重置成空""
		}
	});

	/**
	 * 删除按钮
	 * 1：持久化方法根据按钮的属性action决定
	 */
	$("#delete").click(function() {
		var $btn = $(this);
		if (!zTree.getSelectedNodes()[0]) {
			messager.alert("提示", "请选择所要删除的标签");
			return;
		}
		if (tagButtonTools.confirmAction(this)) {
			var hasChild = true;
			var param = {
				"parentTagId" : zTree.getSelectedNodes()[0].tagId
			};
			Ajax.getSy().remoteCall("TagsController", "existChildrenTag", [ param ], function(reply) {
				if (reply.getResult()) {
					messager.alert("系统提示", "存在子标签，不能删除");
				} else {
					hasChild = false;
				}
			});
			if (hasChild) {
				$("#cancel").click();
				return;
			} else {
				messager.confirm("提示", "确认删除当前信息吗?", function(ok) {
					if (ok) {
						beforeLoading();
						var param = toTagDataDate(commonJs.getData($("#tag_edit_form")));
						ajaxAsy.remoteCall("TagsController", $btn.attr("action"), [ param ], function(replay) {
							afterLoading();
							var result = replay.getResult();
							messager.alert("提示", result.msg);
							if (result.success) {
								zTree.removeNode(zTree.getSelectedNodes()[0]);
								$("#cancel").click();
							}

						}, myAjaxExceptionHandler);

					} else {
						return;
					}
				});
			}

		}
	});

	//取消按钮
	$("#cancel").click(function() {
		if (tagButtonTools.confirmAction(this)) {
			if (zTree)
				selectTreeNode = zTree.getSelectedNodes()[0];
			if (selectTreeNode) {
				commonJs.setData($("#tag_edit_form"), tagDateFormate(setParent(selectTreeNode)));
			} else {
				commonJs.setData($("#tag_edit_form"), {});
			}
			commonJs.disabled($("#tag_edit_form"));
		}
	});
});

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