var requestParmas = {};
var selectRow = {};
var buttonTools = new ButtonTools();
var ajaxAsy = Ajax.getAsy();
var gridBody = "";
var good = {
	"goodsId" : 1,
	"goodsName" : "测试商品"
};

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
/*
 * function formatCheckBox(value,rowData,rowIndex){
 if(rowData.checked=="true"){
 return "<input type='checkbox' checked="+rowData.checked+" value='"+rowData.privilegeId+"' parentId='"+rowData.parentPrivilegeId+"' ></input>"+rowData.privilegeName;
 }else{
 return "<input type='checkbox'  value='"+rowData.privilegeId+"' parentId='"+rowData.parentPrivilegeId+"' ></input>"+rowData.privilegeName;
 }
 }*/
var cols = [ [ {
	title : 'id',
	field : 'tagId',
	width : 18
}, {
	title : '标签名称',
	field : 'tagName',
	width : 500,
	formatter : function(value, rowData, rowIndex) {
		if (rowData.checked == "true") {

			return "<input type='checkbox' disabled=true checked=" + rowData.checked + "  value='" + rowData.tagId + "' parentId='" + rowData.parentTagId + "' ></input>" + rowData.tagName;
		} else {
			return "<input type='checkbox'  value='" + rowData.tagId + "' parentId='" + rowData.parentTagId + "' ></input>" + rowData.tagName;
		}
	}
} ] ];

$(function() {
	good = window.dialogArguments;
	//	good = {"goodsId":1,"goodsName":"测试商品"};
	/**
	 * 支持级联checkbox选择 
	 */
	$("#treegrid").treegrid({
		url : "TagsController.query",
		threeLinkCheck : true,
		deepCascadeCheck : true,
		animate : true,
		idField : "tagId",
		parentIdField : "parentTagId",
		treeField : 'tagName',
		queryParams : {
			"parentTagId" : "-1",
			"goodsId" : good.goodsId
		},//首次查询参数
		columns : cols,
		onLoadSuccess : function(row, data) {
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
		},
		onBeforeExpand : function(row) {
			//动态设置展开查询的url  
			$("#treegrid").treegrid("options").queryParams = {
				"parentTagId" : row.tagId,
				"goodsId" : good.goodsId
			};
			return true;
		},
		onClickRow : function(row) {
		}
	});

	$("#sure").click(function() {
		var param = {
			"goodsId" : good.goodsId,
			"tags" : []
		};
		gridBody.find("input[type=checkbox]").each(function() {
			if (this.checked && !this.disabled) {
				if(this.value){
					param.tags.push({
						"tagId" : this.value,
						"goodsId" : good.goodsId
					});
				}
			}
		});
		if (param.tags.length == 0) {
			messager.alert("提示", "数据没变换，不需要保存");
			return;
		}

		messager.confirm("提示", "当前商品[" + good.goodsName + "]将绑定当前选择标签以及标签所属所有条目,确认绑定吗?", function(ok) {
			if (ok) {

				beforeLoading();
				ajaxAsy.remoteCall("DmGoodsController", "attachTagsAndAllItems", [ param ], function(replay) {
					afterLoading();
					var result = replay.getResult();
					messager.alert("提示", result.msg);
					if (result.success) {
						window.returnValue = result.success;
						window.close();
					}

				}, myAjaxExceptionHandler);

			} else {
				return;
			}
		});
	});

	//取消按钮
	$("#cancel").click(function() {
		$("#treegrid").treegrid("reload", {
			"parentTagId" : "-1",
			"goodsId" : good.goodsId
		});
	});
});