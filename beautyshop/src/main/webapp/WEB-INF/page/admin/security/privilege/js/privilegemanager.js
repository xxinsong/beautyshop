var requestParmas = {};
var selectRow = {};
var buttonTools = new ButtonTools();
var ajaxAsy = Ajax.getAsy();

function selectMenu() {
	var param = "";
	var selectMenu = window.showModalDialog("../../system/selectioinmenu.jsp", param, "dialogHeight: 600px; dialogWidth: 1020px;");
	if (selectMenu) {
		$("#menuId").val(selectMenu.menuId);
		$("#menuName").val(selectMenu.menuName);
	} else {
		selectRow = $("#treegrid").treegrid("getSelected");
		if (!selectRow) {
			$("#menuId").val("-1");
			$("#menuName").val("");
		} else {
			$("#menuId").val(selectRow.menuId);
			$("#menuName").val(selectRow.menuName);
		}

	}
}

function showAndHideMenu(typeValue) {
	if (typeValue == "MENU") {
		$("#menuIdTh").show();
		$("#menuIdTd").show();
	} else {
		$("#menuIdTh").hide();
		$("#menuIdTd").hide();
	}
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

var cols = [ [ {
	title : 'id',
	field : 'privilegeId',
	width : 18
}, {
	title : '权限名称',
	field : 'privilegeName',
	width : 500
}, {
	title : '菜单id',
	field : 'menuId',
	width : 400,
	hidden : 'true'
}, {
	title : '权限类型',
	field : 'type',
	width : 200,
	attr_code : "ADMIN_PRIVILEGE_TYPE"
} ] ];

function setParent(row, parentRow) {
	if (!parentRow)
		parentRow = $("#treegrid").treegrid("getParent", row.privilegeId);
	if (parentRow) {
		row.parentPrivilegeName = parentRow.privilegeName;
		row.parentPrivilegeId = parentRow.privilegeId;
	} else {
		row.parentPrivilegeName = "";
		row.parentPrivilegeId = "-1";
	}
	return row;
}

$(function() {
	/**
	 * 支持级联checkbox选择 
	 */
	$("#treegrid").treegrid({
		url : "PrivilegeController.query",
		threeLinkCheck : true,
		deepCascadeCheck : true,
		animate : true,
		idField : "privilegeId",
		parentIdField : "parentPrivilegeId",
		treeField : 'privilegeName',
		queryParams : {
			"parentPrivilegeId" : "-1"
		},//首次查询参数
		columns : cols,
		onLoadSuccess : function(row, data) {
			var target = $(this);
			var opts = $(this).treegrid("options");//$.data(this, "treegrid").options;  
			var panel = $(this).datagrid("getPanel");
			var gridBody = panel.find("div.datagrid-body");
			var idField = opts.idField;
			/** 
			 * 级联选择父节点 
			 * @param {Object} target 
			 * @param {Object} id 节点ID 
			 * @param {Object} status 节点状态，true:勾选，false:未勾选 
			 * @return {TypeName}  
			 */
			function selectParent(target, id, idField, status) {
				var parent = target.treegrid('getParent', id);
				status = false;
				if (parent) {
					var parentId = parent[idField];
					//与当前checkbox的parentId相同的都属于同一parent树下
					gridBody.find("input[type=checkbox][parentId=" + parentId + "]").each(function() {
						if (this.checked) {
							status = true;
						}
					});

					if (status) {
						$("input[type=checkbox][value='" + parentId + "']").prop("checked", status);
					}
					selectParent(target, parentId, idField, status);
				}
			}
			/** 
			 * 级联选择子节点 
			 * @param {Object} target 
			 * @param {Object} id 节点ID 
			 * @param {Object} deepCascade 是否深度级联 
			 * @param {Object} status 节点状态，true:勾选，false:未勾选 
			 * @return {TypeName}  
			 */
			function selectChildren(target, id, idField, deepCascade, status) {
				if (status && deepCascade) {
					target.treegrid('expand', id);
				}
				var children = target.treegrid('getChildren', id);
				for ( var i = 0; i < children.length; i++) {
					var childId = children[i][idField];
					$("input[type=checkbox][value='" + childId + "']").prop("checked", status);
				}
			}
			gridBody.find("span.tree-title input[type=checkbox]").click(function(e) {
				if (opts.cascadeCheck || opts.deepCascadeCheck || opts.threeLinkCheck) {
					var id = $(this).attr("value");
					var parentstatus = false;
					var chilestatus = this.checked;//当前input-checkbox的状态
					if (opts.threeLinkCheck) {
						//三级联动,是否深度级联还需要设置deepCascadeCheck的值  
						selectParent(target, id, idField, parentstatus);
						selectChildren(target, id, idField, opts.deepCascadeCheck, chilestatus);
					} else {
						//只设置cascadeCheck或者deepCascadeCheck  
						if (opts.cascadeCheck || opts.deepCascadeCheck) {
							//普通级联  
							selectChildren(target, id, idField, opts.deepCascadeCheck, status);
						}
					}

				}
				e.stopPropagation();//停止事件传播  
			});

			commonJs.disabled($("#privilege_edit_form"));
		},
		onBeforeLoad : function(row, param) {
		},
		onBeforeExpand : function(row) {
			$("#treegrid").treegrid("options").queryParams = {
				"parentPrivilegeId" : row.privilegeId
			};
			return true;
		},
		onClickRow : function(row) {
			if (buttonTools.confirmAction()) {
				selectRow = $("#treegrid").treegrid("getSelected");
				commonJs.setData($("#privilege_edit_form"), setParent(row));
				showAndHideMenu(row.type);
			} else {
				$("#treegrid").treegrid("select", selectRow.privilegeId);
			}

		}
	});

	//添加根节点绑定事件
	$("#add_root").click(function() {
		if (buttonTools.confirmAction(this)) {
			commonJs.clear($("#privilege_edit_form"));
			commonJs.enable($("#privilege_edit_form"));
			commonJs.setData($("#privilege_edit_form"), {
				"parentPrivilegeId" : "-1"
			});
		}
	});

	//添加孩子节点绑定事件
	$("#add_child").click(function() {
		selectRow = $("#treegrid").treegrid("getSelected");
		if (selectRow) {
			if (selectRow.isLeaf == "1") {
				$("#cancel").click();
				messager.alert("提示", "所选父权限为叶子节点，不能添加子权限");
			} else {
				if (buttonTools.confirmAction(this)) {
					commonJs.clear($("#privilege_edit_form"));
					commonJs.enable($("#privilege_edit_form"));
					commonJs.setData($("#privilege_edit_form"), setParent({}, selectRow));
				}
			}

		} else {
			$("#cancel").click();
			messager.alert("提示", "请选择父权限");
		}

	});

	//修改页面数据按钮
	$("#update").click(function() {
		if (!$("#treegrid").treegrid("getSelected")) {
			messager.alert("提示", "请选择需要修改的记录");
			return;
		}
		if (buttonTools.confirmAction(this)) {
			commonJs.enable($("#privilege_edit_form"));
			var typeValue = $("#type").val();
			showAndHideMenu(typeValue);
			$("#type").attr("disabled", true);
			$("select[name='isLeaf']").attr("disabled", true);
		}
	});

	/**
	 * 确定按钮
	 * 1：统一在后台控制前台显示操作后的信息--约定返回json对象{success:true|false,msg:showWhat};
	 * 2：自定义错误处理-myAjaxExceptionHandler
	 * 3：持久化方法根据当前操作的currentAction决定buttonTools.currentAction
	 */
	$("#sure").click(function() {
		if (buttonTools.confirmAction(this)) {
			if (commonJs.validate($("#privilege_edit_form"))) {
				messager.confirm("提示", "确认保存当前信息吗?", function(ok) {
					if (ok) {
						beforeLoading();
						var param = commonJs.getData($("#privilege_edit_form"));
						ajaxAsy.remoteCall("PrivilegeController", buttonTools.currentAction, [ param ], function(replay) {
							afterLoading();
							var result = replay.getResult();
							if (result.success) {
								if (result.me) {//只有添加才有值
									var appendRow = result.me;
									$("#treegrid").treegrid("append", {
										parent : appendRow.parentPrivilegeId,
										data : [ appendRow ]
									});
								} else {
									if (param.isLeaf == "0") {
										param.state = "closed";
									} else {
										param.state = "open";
									}
									$("#treegrid").treegrid('update', {
										id : param.privilegeId,
										row : param
									});
								}
							}
							$("#cancel").click();
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

		if (buttonTools.confirmAction(this)) {
			if (!$("#treegrid").treegrid("getSelected")) {
				messager.alert("提示", "请选择需要删除的记录");
				return;
			}
			messager.confirm("提示", "确认删除当前信息吗?", function(ok) {
				if (ok) {
					beforeLoading();
					var param = commonJs.getData($("#privilege_edit_form"));
					ajaxAsy.remoteCall("PrivilegeController", $btn.attr("action"), [ param ], function(replay) {
						afterLoading();
						var result = replay.getResult();
						if (result.success) {
							$("#treegrid").treegrid("remove", param.privilegeId);//Remove a node and it's children nodes.
						}
						messager.alert("提示", result.msg);
					}, myAjaxExceptionHandler);

				} else {
					return;
				}
			});
		}
	});

	//取消按钮
	$("#cancel").click(function() {
		if (buttonTools.confirmAction(this)) {
			selectRow = $("#treegrid").treegrid("getSelected");
			if (selectRow)
				commonJs.setData($("#privilege_edit_form"), setParent(selectRow));
			commonJs.disabled($("#privilege_edit_form"));
		}
	});

	$("#type").change(function() {
		var selectedValue = $(this).children('option:selected').val();
		showAndHideMenu(selectedValue);
		if (selectedValue == "MENU") {
			$('#menuId').val("-1");
			$('#menuName').val("");
		}
	});

	$("#menuIdTh").hide();
	$("#menuIdTd").hide();
});