var setting = {
	async : {
		enable : true,
		url : "MenuController.searchMenusTree",
		autoParam : [ "menuId=parentMenu" ],
		otherParam : {
		},
		dataFilter : function (treeId, parentNode, childNodes) {
			for ( var i = 0; i < childNodes.length; i++) {
				if (childNodes[i].isLeaf == "0") {
					childNodes[i].isParent = true;
				}
			}
			return childNodes;
		}
	},
	callback : {
		onClick : function(event, treeId, treeNode, clickFlag) {
		},
	    onDblClick: function(event, treeId, treeNode){
	    	 $("#sure").click();
	    }
	},
	data : {
		keep : {
			parent : true
		},
		key : {
			name : "menuName",
			url : "xurl"
		}
	}
};

var zTree;
var action_type = "";

$(function() {

	initMenuTree();
	
	$("#sure").click(function(){
		selectTreeNode = zTree.getSelectedNodes()[0];
		if(!selectTreeNode){
			messager.alert("提示", "请选择菜单");
		}else{
			window.returnValue=selectTreeNode;
			window.close();
		}
	});
	
	//取消按钮
	$("#cancel").click(function(){
		window.returnValue="";
		window.close();
	});
	
});

function initMenuTree() {
	Ajax.getAsy().remoteCall("MenuController", "searchMenusTree", [ { parentMenu : "-1" } ], function(reply) {
		var zNodes = reply.getResult();
		if (zNodes.length > 0) {
			for ( var i = 0; i < zNodes.length; i++) {
				if (zNodes[i].isLeaf == "0") {
					zNodes[i].isParent = true;
				}
			}
			zTree = $.fn.zTree.init($("#menuTree"), setting, zNodes);
		}
	});
}

