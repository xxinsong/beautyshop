function beforeClick() {
}

function zTreeBeforeAsync(treeId, treeNode, msg) {
}

function zTreeOnAsyncSuccess(treeId, treeNode, msg) {
}

function zTreeOnAsyncError(treeId, treeNode, msg) {
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
		},
		onDblClick : function(event, treeId, treeNode) {
			$("#sure").click();
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

	/**
	 * 确定按钮
	 * 1：统一在后台控制前台显示操作后的信息--约定返回json对象{success:true|false,msg:showWhat};
	 * 2：自定义错误处理-myAjaxExceptionHandler
	 * 3：持久化方法根据当前操作的currentAction决定buttonTools.currentAction
	 */
	$("#sure").click(function() {
		selectTreeNode = zTree.getSelectedNodes()[0];
		if (!selectTreeNode) {
			messager.alert("提示", "请选择所属标签");
		} else {
			window.returnValue = selectTreeNode;
			window.close();
		}
	});
	//取消按钮
	$("#cancel").click(function() {
		window.returnValue = "";
		window.close();
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