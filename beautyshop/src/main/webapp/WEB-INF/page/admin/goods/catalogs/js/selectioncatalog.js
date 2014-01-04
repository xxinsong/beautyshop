function beforeClick() {
	/*if(catalogButtonTools.confirmAction()){
	    return true;
	}else{
		return false;
	}*/
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
var catalogButtonTools = new ButtonTools();
var ajaxAsy = Ajax.getAsy();

var setting = {
	async : {
		enable : true,
		url : "DmGoodsCatalogController.query",
		autoParam : [ "catalogId=upCatalogId" ],
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
			name : "catalogName",
			idKey : "catalogId",
			pIdKey : "upCatalogId",
			rootId : "-1"
		}
	}
};

$(function() {
	loadCatalogTree();
	$("#sure").click(function() {
		selectTreeNode = zTree.getSelectedNodes()[0];
		if (!selectTreeNode) {
			messager.alert("提示", "请选择商品目录");
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

function loadCatalogTree() {
	Ajax.getAsy().remoteCall("DmGoodsCatalogController", "query", [ {
		"upCatalogId" : "-1"
	} ], function(reply) {
		var zNodes = reply.getResult();
		if (zNodes.length > 0) {
			zTree = $.fn.zTree.init($("#catalogTree"), setting, zNodes);
		}
	});
}