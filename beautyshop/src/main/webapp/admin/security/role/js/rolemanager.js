var rolegrid = "";
var selectedrole = "";
var requestParmas = {};
var buttonTools = new ButtonTools();
var ajaxAsy = Ajax.getAsy();

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
			data.createDate = $.formatDate(data.createDate, "yyyy-MM-dd HH:mm:ss");
		}
	}
	if (data.stateDate) {
		if ($.type(data.stateDate) == "date") {
			data.stateDate = $.formatDate(data.stateDate, "yyyy-MM-dd HH:mm:ss");
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
	if (data.stateDate) {
		if ($.type(data.stateDate) == "string") {
			data.stateDate = new Date(data.stateDate.replace(regEx, "/"));
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

/**
 * 每行添加checkbox
 * @param value
 * @param rowData
 * @param rowIndex
 * @returns {String}
 */
function formatCheckBox(value, rowData, rowIndex) {
	if (rowData.checked == "true") {
		return "<input type='checkbox' checked=" + rowData.checked + " value='" + rowData.privilegeId + "' parentId='" + rowData.parentPrivilegeId + "' ></input>" + rowData.privilegeName;
	} else {
		return "<input type='checkbox'  value='" + rowData.privilegeId + "' parentId='" + rowData.parentPrivilegeId + "' ></input>" + rowData.privilegeName;
	}
}

function privilegeTab_beforeClick() {
	if (buttonTools.confirmAction()) {
		return true;
	} else {
		return false;
	}
}

function roleTab_beforeClick() {
	if (treegridEdiable) {
		messager.alert("提示", "请选择保存或取消当前操作");
	}
	return !treegridEdiable;
}

/**
 * privilegeTab点击事件处理方法
 */
function loadTreeGrid(me) {
	if (privilegeTab_beforeClick()) {
		initFlag = true;
		$("#" + me.id + "Tab").show();
		$("#treegrid").treegrid({
			url : "PrivilegeController.queryPrivilegeOnRole",
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
				selectedrole = rolegrid.getSelected();
				if (!selectedrole) {
					return false;
				} else {
					param.roleId = selectedrole.roleId;
					return true;
				}
			},
			onBeforeExpand : function(row) {
				selectedrole = rolegrid.getSelected();
				//动态设置展开查询的url  
				$("#treegrid").treegrid("options").queryParams = {
					"parentPrivilegeId" : row.privilegeId,
					"roleId" : selectedrole.roleId
				};
				return true;
			},
			onClickRow : function(row) {
			}
		});
	}
}

function search_btn(rolegrid) {
	requestParmas["state"] = $('#state').val();
	requestParmas["roleName"] = $('#roleName').val();
	rolegrid.loadData(requestParmas);
	$("#cancel").click();
}

$(function() {
	rolegrid = new TableGrid({
		$table : $(".grid").find("table"),
		service : "RoleController",
		method : "queryPage",
		pageIndex : 1,
		pageSize : 10,
		onBeforeClickRow : function(data) {
			return privilegeTab_beforeClick() && roleTab_beforeClick();
		},
		onClickRow : function(data) {
			if (treegridEdiable) {
				messager.confirm("提示", "当前处在权限修改状态，确认不保存当前操作吗?", function(ok) {
					if (ok) {
						treegridEdiable = false;
						setTreeGridEdiable(treegridEdiable);
					} else {
						return;
					}
				});
			}

			if (buttonTools.confirmAction()) {

				commonJs.setData($("#role_edit_form"), myDateFormate(data));
				if (initFlag)
					$("#treegrid").treegrid("reload", {
						"parentPrivilegeId" : -1
					});//加载当前角色权限树
			}
		},
		onClickCell : function(field, value) {
		},
		onDblClickRow : function(data) {
		},
		renderColumn : function(field, value) {
			if ("createDate" == field || "stateDate" == field) {
				if (value)
					return $.formatDate(value, "yyyy-MM-dd HH:mm:ss");
			}
			return value;
		},
		afterLoadData : function() {
			var data = this.getSelected();
			if (data != null) {
				commonJs.setData($("#role_edit_form"), myDateFormate(data));
			} else {
				commonJs.clear($("#role_edit_form"));
			}
			commonJs.disabled($("#role_edit_form"));
			buttonTools.setCurrentAction("");
		}
	});

	search_btn(rolegrid);

	//查询数据信息
	$("#search_btn").click(function() {
		search_btn(rolegrid);
	});

	/*****************角色增删改查 按钮事件绑定***********************************************/
	//添加武器调用的事件
	$("#add").click(function() {
		if (buttonTools.confirmAction(this)) {
			commonJs.clear($("#role_edit_form"));
			commonJs.enable($("#role_edit_form"));
			commonJs.setData($("#role_edit_form"), {
				state : "10",
				createDate : new Date()
			});
		}
	});

	//修改页面数据按钮
	$("#update").click(function() {
		selectedrole = rolegrid.getSelected();
		if (!selectedrole) {
			messager.alert("提示", "请选择记录");
			return;
		}
		if (buttonTools.confirmAction(this)) {
			commonJs.enable($("#role_edit_form"));
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
			if (commonJs.validate($("#role_edit_form"))) {
				messager.confirm("提示", "确认保存当前信息吗?", function(ok) {
					if (ok) {
						beforeLoading();
						var param = new Object();
						param = toDate(commonJs.getData($("#role_edit_form")));
						/*var org = {"orgId":2};
						param.organization =org;
						param.roles = [{"roleId":1},{"roleId":2}];*/
						ajaxAsy.remoteCall("RoleController", buttonTools.currentAction, [ param ], function(replay) {
							afterLoading();
							var result = replay.getResult();
							if (result.success) {
								search_btn(rolegrid);
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
		if (buttonTools.confirmAction(this)) {
			messager.confirm("提示", "确认删除当前信息吗?", function(ok) {
				if (ok) {
					beforeLoading();
					var param = new Object();
					param = toDate(commonJs.getData($("#role_edit_form")));
					ajaxAsy.remoteCall("RoleController", $btn.attr("action"), [ param ], function(replay) {
						afterLoading();
						var result = replay.getResult();
						if (result.success) {
							$("#cancel").click();
							search_btn(rolegrid);
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
			if (rolegrid.getSelected())
				commonJs.setData($("#role_edit_form"), myDateFormate(rolegrid.getSelected()));
			commonJs.disabled($("#role_edit_form"));
		}
	});

	/*****************privilege treegrid按钮事件绑定***********************************************/
	//取消授予权限按钮
	$("#cancelPri").click(function() {
		treegridEdiable = false;
		$("#treegrid").treegrid("reload", {
			"parentPrivilegeId" : -1
		});//加载当前员工权限树
	});

	//开启授予权限按钮
	$("#updatePri").click(function() {
		treegridEdiable = true;
		setTreeGridEdiable(treegridEdiable);
	});

	$("#surePri").click(function() {
		selectedrole = rolegrid.getSelected();
		if (treegridEdiable == false) {
			messager.alert("提示", "当前数据无变化，不需要保存数据");
		} else {
			messager.confirm("提示", "确认保存当前信息吗?", function(ok) {
				if (ok) {
					beforeLoading();
					var param = {
						"roleId" : selectedrole.roleId,
						"privileges" : []
					};
					gridBody.find("input[type=checkbox]").each(function() {
						if (this.checked) {
							if(this.value){
								param.privileges.push({
									"privilegeId" : this.value,
									"roleId" : selectedrole.roleId
								});
							}
						} else {
							param.privileges.push({
								"privilegeId" : this.value
							});
						}
					});
					ajaxAsy.remoteCall("RoleController", "attachPrivilege", [ param ], function(replay) {
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
});