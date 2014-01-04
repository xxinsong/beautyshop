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
		    if (action_type != "") {
		    	messager.confirm("系统提示", "确定要取消当前编辑吗？", function(flag) {
		    		if (flag) {
		    			$("#btn_cancel").click();
		    			setMenuData(treeNode);
		    		}
				});
		    } else {
		    	setMenuData(treeNode);
		    }

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
	
	commonJs.disabled($("#menu_edit_form"));
	
	$("#btn_add_root").click(function() {
		if (action_type != "" && action_type != "AR") {
			messager.alert("系统提示", "请先取消当前的编辑");
			return;
		}
		action_type = "AR";
		commonJs.clear($("#menu_edit_form"));
		commonJs.enable($("#menu_edit_form"));
		$("input[name='parentMenuName']", $("#menu_edit_form")).attr("disabled", true);
		$("input[name='parentMenu']", $("#menu_edit_form")).val("-1");
	});
	
	$("#btn_add_child").click(function() {
		if (action_type != "" && action_type != "AC") {
			messager.alert("系统提示", "请先取消当前的编辑");
			return;
		}
		var parentMenu = zTree.getSelectedNodes()[0];
		if (!parentMenu) {
			messager.alert("系统提示", "请先选择上级菜单");
			return;
		}
		if (parentMenu.isLeaf == "1") {
			messager.alert("系统提示", "此菜单是叶子节点，不能建立子菜单");
			return;
		}

		action_type = "AC";
		commonJs.clear($("#menu_edit_form"));
		commonJs.enable($("#menu_edit_form"));
		$("input[name='parentMenuName']", $("#menu_edit_form")).attr("disabled", true).val(parentMenu.menuName);
		$("input[name='parentMenu']", $("#menu_edit_form")).val(parentMenu.menuId);
	});
	
	$("#btn_modify").click(function() {
		if (action_type != "" && action_type != "M") {
			messager.alert("系统提示", "请先取消当前的编辑");
			return;
		}
		var menu = zTree.getSelectedNodes()[0];
		if (!menu) {
			messager.alert("系统提示", "请选择要修改的菜单");
			return;
		}
		
		action_type = "M";
		commonJs.setData($("#menu_edit_form"), menu);
		commonJs.enable($("#menu_edit_form"));
		$("input[name='parentMenuName']", $("#menu_edit_form")).attr("disabled", true);
		$("[name='isLeaf']", $("#menu_edit_form")).attr("disabled", true);
	});
	
	$("#btn_del").click(function() {
		if (action_type != "") {
			messager.alert("系统提示", "请先取消当前的编辑");
			return;
		}
		var menu = zTree.getSelectedNodes()[0];
		if (!menu) {
			messager.alert("系统提示", "请选择要删除的菜单");
			return;
		}
		
		if ((menu.children && menu.children.length > 0) || checkChildExist(menu.menuId)) {
			messager.alert("系统提示", "存在子菜单，不能删除");
			return;
		}
		messager.confirm("系统提示", "确定要删除这个菜单吗？", function(flag) {
			if (flag) {
				Ajax.getAsy().remoteCall("MenuController", "deleteMenu", [ menu ], function(reply) {
					if (reply.getResult()) {
						zTree.removeNode(menu);
						$("#btn_cancel").click();
					}
				});
			}
		});
	});
	
	$("#btn_cancel").click(function() {
		action_type = "";
		commonJs.disabled($("#menu_edit_form"));
		commonJs.clear($("#menu_edit_form"));
	});
	
	$("#btn_save").click(function() {
		if (action_type == "") {
			return;
		}
		if (!commonJs.validate($("#menu_edit_form"))) {
			return;
		}
		var saveData = commonJs.getData($("#menu_edit_form"));
		var callback = function(reply) {
			if (reply.getResult()) {
				messager.alert("系统提示", "操作成功", function() {
					if (action_type == "AR") {
						initMenuTree();
					} else if (action_type == "AC") {
						zTree.reAsyncChildNodes(zTree.getSelectedNodes()[0], "refresh");
					} else {
						var menu = zTree.getSelectedNodes()[0];
						if (menu.getParentNode()) {
							zTree.reAsyncChildNodes(menu.getParentNode(), "refresh");
						} else {
							initMenuTree();
						}
					}
					action_type = "";
					$("#btn_cancel").click();
				});
			}
		};
		if (action_type == "AR" || action_type == "AC") {
			Ajax.getAsy().remoteCall("MenuController", "insertMenu", [ saveData ], callback);
		} else if (action_type == "M") {
			Ajax.getAsy().remoteCall("MenuController", "updateMenu", [ saveData ], callback);
		}
	});
})

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

function setMenuData(treeNode) {
	commonJs.setData($("#menu_edit_form"), treeNode);
	var parentNode = treeNode.getParentNode();
	if (parentNode) {
		$("input[name='parentMenuName']", $("#menu_edit_form")).val(parentNode.menuName);
	}
}

function checkChildExist(menuId) {
	var hasChild = false;
	Ajax.getSy().remoteCall("MenuController", "searchMenusTree", [ { parentMenu : menuId } ], function(reply) {
		if (reply.getResult().length > 0) {
			hasChild = true;
		}
	});
	return hasChild;
}