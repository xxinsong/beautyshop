var requestParmas = {};
var buttonTools = new ButtonTools();
var selected = "";
var staffgrid = "";
var ajaxAsy = Ajax.getAsy();
var roleEditable = false;
var privilegeEditable = false;

/**
 * 弹出组织树页面选择组织
 */
function selectOrg() {
	var param = "";
	var selectOrg = window.showModalDialog("../org/selectionorg.jsp", param, "dialogHeight: 600px; dialogWidth: 1020px;");
	if (selectOrg) {
		$("#orgId").val(selectOrg.orgId);
		$("#orgName").val(selectOrg.orgName);
	} else {
		$("#orgId").val("-1");
		$("#orgName").val("");
	}
}

function roleTab_beforeClick() {
	var ret = false;
	if (treegridEdiable) {
		messager.alert("提示", "请选择保存或取消当前权限分配操作");
	} else {
		if (buttonTools.confirmAction()) {
			ret = true;
		}
	}
	return ret;
}

function privilegeTab_beforeClick() {
	var ret = false;
	if (roletreegridEdiable) {
		messager.alert("提示", "请选择保存或取消当前角色分配操作");
	} else {
		if (buttonTools.confirmAction()) {
			ret = true;
		}
	}
	return ret;

}

function staffTab_beforeClick() {
	if (roletreegridEdiable || treegridEdiable) {
		if (roletreegridEdiable) {
			messager.alert("提示", "请选择保存或取消当前角色分配操作");
		} else if (treegridEdiable) {
			messager.alert("提示", "请选择保存或取消当前权限分配操作");
		}
	}
	return !roletreegridEdiable && !treegridEdiable;
}

/********************员工个性化权限树表***************************************************/
var initFlag = false;
var treegridEdiable = false;
var gridBody = "";
function setTreeGridEdiable(state) {
	if (state) {
		commonJs.enable($("#privilegeContain"));
	} else {
		commonJs.disabled($("#privilegeContain"));
	}
}
function formatCheckBox(value, rowData, rowIndex) {
	if (rowData.checked == "true") {
		return "<input type='checkbox' checked=" + rowData.checked + " value='" + rowData.privilegeId + "' parentId='" + rowData.parentPrivilegeId + "' ></input>" + rowData.privilegeName;
	} else {
		return "<input type='checkbox'  value='" + rowData.privilegeId + "' parentId='" + rowData.parentPrivilegeId + "' ></input>" + rowData.privilegeName;
	}
}
/**
 * privilegeTab点击事件处理方法
 */
function loadTreeGrid(me) {
	if (staffTab_beforeClick() && roleTab_beforeClick()) {
		$("#" + me.id + "Tab").show();
		if (!initFlag) {
			initFlag = true;
			$("#treegrid").treegrid({
				url : "PrivilegeController.queryPrivilegeOnStaff",
				threeLinkCheck : true,
				deepCascadeCheck : true,
				animate : true,
				idField : "privilegeId",
				parentIdField : "parentPrivilegeId",
				treeField : 'privilegeName',
				queryParams : {
					"parentPrivilegeId" : "-1"
				},//首次查询参数
				onLoadSuccess : function(row, data) {
					setTreeGridEdiable(treegridEdiable);//设置编辑状态
					var target = $(this);
					var opts = $(this).treegrid("options");//$.data(this, "treegrid").options;  
					var panel = $(this).datagrid("getPanel");
					gridBody = panel.find("div.datagrid-body");
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
						if (deepCascade) {
							var thisNodedata = target.treegrid("find", id);
							if (thisNodedata.isLeaf == "0")
								target.treegrid('expand', id);
						}
						var children = target.treegrid('getChildren', id);
						for ( var i = 0; i < children.length; i++) {
							var childId = children[i][idField];
							$("input[type=checkbox][value='" + childId + "']").prop("checked", status);
							selectChildren(target, childId, idField, deepCascade, status);
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
				},
				onBeforeLoad : function(row, param) {
					selected = staffgrid.getSelected();
					if (!selected) {
						return false;
					} else {
						param.staffId = selected.staffId;
						return true;
					}
				},
				onBeforeExpand : function(row) {
					selected = staffgrid.getSelected();
					//动态设置展开查询的url  
					$("#treegrid").treegrid("options").queryParams = {
						"parentPrivilegeId" : row.privilegeId,
						"staffId" : selected.staffId
					};
					return true;
				},
				onClickRow : function(row) {
				}
			});
		}
	}
}

/********************员工角色树表***************************************************/
var roleinitFlag = false;
var roletreegridEdiable = false;
var rolegridBody = "";
function setRoleTreeGridEdiable(state) {
	if (state) {
		$("#roleContain").find("input[type=checkbox]").each(function() {
			$(this).removeAttr("disabled");
		});
	} else {
		$("#roleContain").find("input[type=checkbox]").each(function() {
			$(this).attr("disabled", true);
		});
	}
}
/**
 * roleTab点击事件处理方法
 */
function loadRoleTreeGrid(me) {
	if (staffTab_beforeClick() && privilegeTab_beforeClick()) {
		$("#" + me.id + "Tab").show();
		if (roleinitFlag == false) {
			roleinitFlag = true;
			$("#roletreegrid").datagrid({
				url : "RoleController.queryRolesOnStaff",
				animate : true,
				idField : "roleId",
				singleSelect : false,
				checkbox : true,
				checkOnSelect : false,
				onLoadSuccess : function(data) {
					setRoleTreeGridEdiable(roletreegridEdiable);//设置编辑状态
					for ( var i = 0; i < data.rows.length; i++) {
						if ("true" == data.rows[i].checked) {
							$(this).datagrid("checkRow", i);
						} else {
							$(this).datagrid("uncheckRow", i);
						}
					}
				},
				onBeforeLoad : function(param) {
					selected = staffgrid.getSelected();
					if (!selected) {
						return false;
					} else {
						param.staffId = selected.staffId;
						return true;
					}
				}
			});
		}
	}
}

/**
 * 从新加载自己tab里面的数据，从新加载数据条件在各自的组件中beforeLoad设置
 */
function reloadTab(tapIds) {//["treegrid","roletreegrid"]
	for ( var i = 0; i < tapIds.length; i++) {
		try {
			if (tapIds[i] == "treegrid") {
				$("#treegrid").treegrid("reload", {
					"parentPrivilegeId" : -1
				});//加载当前员工权限树
			} else if (tapIds[i] == "roletreegrid") {
				$("#roletreegrid").datagrid("uncheckAll");
				//晕~easyui中的datagrid的reload不会恢复checkbox不勾选状态
				//临时解决：在加载成功后主动设置状态或者在这里统一不勾选
				$("#roletreegrid").datagrid("reload");
			}
		} catch (e) {
		}

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

function myDateFormate(data) {
	if (data.createDate) {
		if ($.type(data.createDate) == "date") {
			data.createDate = $.formatDate(data.createDate, "yyyy-MM-dd hh:mm:ss");
		}
	}
	if (data.effDate) {
		if ($.type(data.effDate) == "date") {
			data.effDate = $.formatDate(data.effDate, "yyyy-MM-dd hh:mm:ss");
		}
	}
	return data;
}

/**
 * 把data json对象中的字符串转成date类型
 * @param data
 * @returns
 */
function toDate(data) {
	var regEx = new RegExp("\\-", "gi");
	if (data.createDate) {
		if ($.type(data.createDate) == "string") {
			data.createDate = new Date(data.createDate.replace(regEx, "/"));
		}
	}
	if (data.effDate) {
		if ($.type(data.effDate) == "string") {
			data.effDate = new Date(data.effDate.replace(regEx, "/"));
		}
	}
	return data;
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

function search_btn(staffgrid) {
	$("#cancel").click();
	initFlag = false;
	roleinitFlag = false;
	requestParmas["staffCode"] = $('#staffCode').val();
	requestParmas["staffName"] = $('#staffName').val();
	if ($("#hasOrg").val() == "1") {
		requestParmas["orgId"] = $('#stafforgId').val();
	} else {
		requestParmas["orgId"] = "-1";
	}
	staffgrid.loadData(requestParmas);

}

/*********************组织树展示*******************************************************************************/
var zTree;
var selectTreeNode;
var setting = {
	async : {
		enable : true,
		url : "OrganizationController.query",
		autoParam : [ "orgId=parentOrgId" ],
		otherParam : {},
		dataFilter : function(treeId, parentNode, childNodes) {
			return childNodes;
		}
	},
	callback : {
		beforeClick : function beforeClick() {
			return buttonTools.confirmAction() && staffTab_beforeClick();
			/*if(roletreegridEdiable){
				messager.alert("提示", "请保存或取消角色分配操作");
				return false;
			}else if(treegridEdiable){
				messager.alert("提示", "请保存或取消员工个性化权限分配操作");
				return false;
			}else if(buttonTools.confirmAction()){
				return true;
			}else{
				return false;
			}*/
		},
		onClick : function(event, treeId, treeNode, clickFlag) {
			selectTreeNode = treeNode;
			//设置当前查询组织id
			commonJs.setData($(".searchformDiv"), {
				"stafforgId" : treeNode.orgId
			});
			$("#hasOrg").val("1");
			$("#search_btn").click();
		}
	},
	data : {
		keep : {
			parent : true
		},
		key : {
			name : "orgName",
			idKey : "orgId",
			pIdKey : "parentOrgId",
			rootPId : "-1"
		}
	}
};

function loadOrgTree() {
	Ajax.getAsy().remoteCall("OrganizationController", "query", [ {
		"parentOrgId" : "-1"
	} ], function(reply) {
		var zNodes = reply.getResult();
		zTree = $.fn.zTree.init($("#orgTree"), setting, zNodes);
	});
}

$(function() {
	loadOrgTree();
	staffgrid = new TableGrid({
		$table : $(".grid").find("table"),
		service : "StaffController",
		method : "queryPage",
		pageIndex : 1,
		pageSize : 10,
		onClickRow : function(data) {
			if (data.orgId != "-1" && selectTreeNode) {
				data.orgName = selectTreeNode.orgName;
			} else {
				data.orgName = "";
			}
			commonJs.setData($("#staff_editor_form"), myDateFormate(data));
			reloadTab([ "treegrid", "roletreegrid" ]);
		},
		onBeforeClickRow : function(data) {
			if (roletreegridEdiable) {
				messager.alert("提示", "请保存或取消角色分配操作");
				return false;
			} else if (treegridEdiable) {
				messager.alert("提示", "请保存或取消员工个性化权限分配操作");
				return false;
			} else {
				if (buttonTools.confirmAction()) {
					/**
					 * 查询按钮与这里一样，需要设置初始化变量为false
					 * 到达这里标识允许选择员工row，在此设置easyui中的组件初始化标识为false，
					 * 让点击tab的时候重新初始化组件
					 */
					initFlag = false;
					roleinitFlag = false;
					return true;
				} else {
					return false;
				}

			}
		},
		onClickCell : function(field, value) {
		},
		onDblClickRow : function(data) {
		},
		renderColumn : function(field, value) {
			if ("createDate" == field || "effDate" == field) {
				if (value)
					return $.formatDate(value, "yyyy-MM-dd hh:mm:ss");
			}
			return value;
		},
		afterLoadData : function() {
			selected = this.getSelected();
			reloadTab([ "treegrid", "roletreegrid" ]);
			if (selected != null) {
				if (selected.orgId != "-1" && selectTreeNode) {
					selected.orgName = selectTreeNode.orgName;
				} else {
					selected.orgName = "";
				}
				commonJs.setData($("#staff_editor_form"), myDateFormate(selected));
			} else {
				commonJs.clear($("#staff_editor_form"));
			}
			commonJs.disabled($("#staff_editor_form"));
			buttonTools.setCurrentAction("");
		}
	});

	search_btn(staffgrid);

	//查询数据信息
	$("#search_btn").click(function() {
		search_btn(staffgrid);
	});

	/*****************staff--CRUD按钮事件绑定start***********************************************/
	$("#add").click(function() {
		selectTreeNode = zTree.getSelectedNodes()[0];
		var orgId = "";
		var orgName = "";
		if (!selectTreeNode) {
			orgId = -1;
		} else {
			orgId = selectTreeNode.orgId;
			orgName = selectTreeNode.orgName;
		}

		if (buttonTools.confirmAction(this)) {
			commonJs.clear($("#staff_editor_form"));
			commonJs.enable($("#staff_editor_form"));
			commonJs.setData($("#staff_editor_form"), {
				state : "10",
				createDate : new Date(),
				"orgId" : orgId,
				"orgName" : orgName
			});
		}
	});

	$("#update").click(function() {
		selected = staffgrid.getSelected();
		if (!selected) {
			messager.alert("提示", "请选择记录");
			return;
		}
		if (buttonTools.confirmAction(this)) {
			commonJs.enable($("#staff_editor_form"));
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
			if (commonJs.validate($("#staff_editor_form"))) {
				messager.confirm("提示", "确认保存当前信息吗?", function(ok) {
					if (ok) {
						beforeLoading();
						var param = new Object();
						param = toDate(commonJs.getData($("#staff_editor_form")));
						ajaxAsy.remoteCall("StaffController", buttonTools.currentAction, [ param ], function(replay) {
							afterLoading();
							var result = replay.getResult();
							if (result.success) {
								search_btn(staffgrid);
							}
							messager.alert("提示", result.msg);
						}, myAjaxExceptionHandler);

					} else {
						return;
					}
				});
			}
			//允许确定后，要显示遮罩层禁止操作，进行ajaxt异步持久化数据，回调函数要把当前操作重置成空""search_btn(staffgrid);
		}
	});

	/**
	 * 删除按钮
	 * 1：持久化方法根据按钮的属性action决定
	 */
	$("#delete").click(function() {
		var $btn = $(this);
		if (buttonTools.confirmAction(this)) {
			selected = staffgrid.getSelected();
			if (!selected) {
				messager.alert("提示", "请选择记录");
				return;
			}

			messager.confirm("提示", "确认删除当前信息吗?", function(ok) {
				if (ok) {
					beforeLoading();
					var param = new Object();
					param = toDate(commonJs.getData($("#staff_editor_form")));
					ajaxAsy.remoteCall("StaffController", $btn.attr("action"), [ param ], function(replay) {
						afterLoading();
						var result = replay.getResult();
						if (result.success) {
							search_btn(staffgrid);
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
			//这里不用转换date，因为renderColumn函数已经转换了，类型是string类型
			selected = staffgrid.getSelected();
			if (selected) {
				if (selected.orgId != "-1" && selectTreeNode) {
					selected.orgName = selectTreeNode.orgName;
				} else {
					selected.orgName = "";
				}
				commonJs.setData($("#staff_editor_form"), myDateFormate(selected));
			}
			commonJs.disabled($("#staff_editor_form"));
		}
	});

	/*****************privilege treegrid按钮事件绑定start***********************************************/
	//取消授予权限按钮
	$("#cancelPri").click(function() {
		treegridEdiable = false;
		$("#treegrid").treegrid("reload", {
			"parentPrivilegeId" : -1
		});//加载当前员工权限树
	});

	//开启授予权限按钮
	$("#updatePri").click(function() {
		selected = staffgrid.getSelected();
		if (!selected) {
			messager.alert("提示", "请先选择员工记录");
			return;
		}
		treegridEdiable = true;
		setTreeGridEdiable(treegridEdiable);
	});

	$("#surePri").click(function() {
		selected = staffgrid.getSelected();
		if (treegridEdiable == false || gridBody.find("input[type=checkbox]").length == 0) {
			messager.alert("提示", "当前数据无变化，不需要保存数据");
		} else {
			messager.confirm("提示", "确认保存当前信息吗?", function(ok) {
				if (ok) {
					beforeLoading();
					var param = {
						"staffId" : selected.staffId,
						"privileges" : []
					};
					gridBody.find("input[type=checkbox]").each(function() {
						if (this.checked) {
							param.privileges.push({
								"privilegeId" : this.value,
								"staffId" : selected.staffId
							});
						} else {
							param.privileges.push({
								"privilegeId" : this.value
							});
						}
					});
					ajaxAsy.remoteCall("StaffController", "attachPrivilege", [ param ], function(replay) {
						afterLoading();
						var result = replay.getResult();
						if (result.success) {
							treegridEdiable = false;
							setTreeGridEdiable(treegridEdiable);
						}
						messager.alert("提示", result.msg);
					}, myAjaxExceptionHandler);

				} else {
					return;
				}
			});
		}
	});
	/*****************privilege treegrid按钮事件绑定end***********************************************/

	/*****************role datagrid按钮事件绑定start***********************************************/
	//取消授予权限按钮
	$("#cancelRole").click(function() {
		roletreegridEdiable = false;
		$("#roletreegrid").datagrid("reload");//加载当前员工权限树
	});

	//开启授予权限按钮
	$("#updateRole").click(function() {
		selected = staffgrid.getSelected();
		if (!selected) {
			messager.alert("提示", "请先选择员工记录");
			return;
		}
		roletreegridEdiable = true;
		setRoleTreeGridEdiable(roletreegridEdiable);
	});

	$("#sureRole").click(function() {
		selected = staffgrid.getSelected();
		if (roletreegridEdiable == false || $("#roletreegrid").datagrid("getData").total == 0) {
			messager.alert("提示", "当前数据无变化，不需要保存数据");
		} else {
			messager.confirm("提示", "确认保存当前信息吗?", function(ok) {
				if (ok) {
					beforeLoading();
					var param = {
						"staffId" : selected.staffId,
						"roles" : []
					};
					var allData = $("#roletreegrid").datagrid("getChecked");
					for ( var i = 0; i < allData.length; i++) {
						param.roles.push({
							"roleId" : allData[i].roleId,
							"staffId" : selected.staffId
						});
					}
					ajaxAsy.remoteCall("StaffController", "attachRole", [ param ], function(replay) {
						afterLoading();
						var result = replay.getResult();
						if (result.success) {
							roletreegridEdiable = false;
							setRoleTreeGridEdiable(roletreegridEdiable);
						}
						messager.alert("提示", result.msg);
					}, myAjaxExceptionHandler);

				} else {
					return;
				}
			});

		}
	});
	/*****************role datagrid按钮事件绑定end***********************************************/

	$("#hasOrg").change(function() {
		var selectedValue = $(this).children('option:selected').val();
		if (selectedValue == "0") {
			zTree.cancelSelectedNode();
			$('#stafforgId').val("-1");
		}
	});
});