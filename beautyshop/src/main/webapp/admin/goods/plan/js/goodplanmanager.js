var requestParmas = {};
var planButtonTools = new ButtonTools();
var selectedGoodPlan = "";// 选择特定商品对象
var selectedGood = "";
var goodPlanGrid = "";// 商品包列表对象
var goodsListGrid = "";// 商品列表
var ajaxAsy = Ajax.getAsy();

function goodPlanDateFormate(data) {
	if (data.stateDate) {// 状态时间
		if ($.type(data.stateDate) == "date") {
			data.stateDate = $.formatDate(data.stateDate, "yyyy-MM-dd HH:mm:ss");
		}
	}
	if (data.effDate) {// 生效时间
		if ($.type(data.effDate) == "date") {
			data.effDate = $.formatDate(data.effDate, "yyyy-MM-dd HH:mm:ss");
		}
	}
	if (data.expDate) {// 失效时间
		if ($.type(data.expDate) == "date") {
			data.expDate = $.formatDate(data.expDate, "yyyy-MM-dd HH:mm:ss");
		}
	}
	return data;
}

/**
 * 把data json对象中的字符串转成date类型
 * 
 * @param data
 * @returns
 */
function goodPlanToDate(data) {
	var regEx = new RegExp("\\-", "gi");
	if (data.stateDate) {
		if ($.type(data.stateDate) == "string") {
			data.stateDate = new Date(data.stateDate.replace(regEx, "/"));
		}
	}
	if (data.effDate) {
		if ($.type(data.effDate) == "string") {
			data.effDate = new Date(data.effDate.replace(regEx, "/"));
		}
	}
	if (data.expDate) {
		if ($.type(data.expDate) == "string") {
			data.expDate = new Date(data.expDate.replace(regEx, "/"));
		}
	}
	return data;
}

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

function search_btn(goodPlanGrid) {
	requestParmas["planName"] = $('#searchPlanName').val();
	goodPlanGrid.loadData(requestParmas);
	$("#cancel").click();
}

function selectGoodOrPackage() {
	var param = "";
	selectedGoodPlan = goodPlanGrid.getSelected();
	var goodsType = $("#goodsType").val();
	if(!goodsType){
		messager.alert("提示", "请先选择商品类型");
		return;
	}
	if(goodsType=="1"){
		var selectionGood = window.showModalDialog("../good/selectiongood.jsp", param, "dialogHeight: 600px; dialogWidth: 1020px;");
		if (selectionGood) {
			$("#goodsId").val(selectionGood.goodsId);
			$("#goodName").val(selectionGood.goodsName);
		} else {
			$("#goodsId").val("-1");
			$("#goodName").val("");
		}
	}else if(goodsType=="2"){
		var selectionPackage = window.showModalDialog("../package/selectiongoodpackage.jsp", param, "dialogHeight: 600px; dialogWidth: 1020px;");
		if (selectionPackage) {
			$("#goodsId").val(selectionPackage.packageId);
			$("#goodName").val(selectionPackage.packageName);
		} else {
			$("#goodsId").val("-1");
			$("#goodName").val("");
		}
	}
}

function updateState(me){
	if($(me).parent().parent(".curr").length==0)
		return;
	if (planButtonTools.confirmAction()) {
		selectedGoodPlan = goodPlanGrid.getSelected();
		if(selectedGoodPlan.state=="00A"){
			messager.confirm("提示", "确认状态切换成无效吗?", function(ok) {
				if (ok) {
					beforeLoading();
					var param = goodPlanToDate(selectedGoodPlan);
					param.state = "00X";
					ajaxAsy.remoteCall("DmGoodsPlanController", "updateStatePlan", [ param ], function(replay) {
						afterLoading();
						var result = replay.getResult();
						if (result.success) {
							search_btn(goodPlanGrid);
						}
						messager.alert("提示", result.msg);
					}, myAjaxExceptionHandler);
				} else {
					return;
				}
			});
		}else if(selectedGoodPlan.state=="00X"){
			messager.confirm("提示", "把当前定价切换成有效将失效同类商品/商品包状态,确认状态切换吗?", function(ok) {
				if (ok) {
					beforeLoading();
					var param = goodPlanToDate(selectedGoodPlan);
					param.state = "00A";
					ajaxAsy.remoteCall("DmGoodsPlanController", "updateStatePlan", [ param ], function(replay) {
						afterLoading();
						var result = replay.getResult();
//						if (result.success) {
							search_btn(goodPlanGrid);
//						}
						messager.alert("提示", result.msg);
					}, myAjaxExceptionHandler);
				} else {
					return;
				}
			});
		}else{
			alert("system error~");
		}
	}
	
}

$(function() {
	/** ********************************************************************* */
	goodPlanGrid = new TableGrid({
		$table : $("#planList").find("table"),
		service : "DmGoodsPlanController",
		method : "queryPage",
		pageIndex : 1,
		pageSize : 10,
		onClickRow : function(data) {
			selectedGoodPlan = this.getSelected();
			commonJs.setData($("#planEditorForm"), goodPlanDateFormate(data));
		},
		onBeforeClickRow : function(data) {
			if (planButtonTools.confirmAction()) {
				return true;
			} else {
				return false;
			}
		},
		onClickCell : function(field, value) {
		},
		onDblClickRow : function(data) {
		},
		renderColumn : function(field, value, row) {
			if ("stateDate" == field || "effDate" == field || "expDate" == field) {
				if (value)
					return $.formatDate(value, "yyyy-MM-dd HH:mm:ss");
			}else if("state" == field){
				if(value=="00A"){
					return "<input type='button' style='background-color: #FFF;	border: 1px solid #CDCDCD;height: 24px;width: 70px;' value='失效' onClick='updateState(this)' />";
				}else{
					return "<input type='button' style='background-color: #FFF;	border: 1px solid #CDCDCD;height: 24px;width: 70px;' value='生效' onClick='updateState(this)' />";
				}
			}
			return value;
		},
		afterLoadData : function() {
			selectedGoodPlan = this.getSelected();
			if (selectedGoodPlan != null) {
				commonJs.setData($("#planEditorForm"), goodPlanDateFormate(selectedGoodPlan));
			} else {
				commonJs.clear($("#planEditorForm"));
			}
			commonJs.disabled($("#planEditorForm"));
			planButtonTools.setCurrentAction("");
		}
	});

	search_btn(goodPlanGrid);

	// 查询数据信息
	$("#search_btn").click(function() {
		search_btn(goodPlanGrid);
	});

	$("#add").click(function() {
		if (planButtonTools.confirmAction(this)) {
			commonJs.clear($("#planEditorForm"));
			commonJs.enable($("#planEditorForm"));
			commonJs.setData($("#planEditorForm"), {
				state : "00X"
			});
			$("#state").attr("disabled", true);
		}
	});

	// 修改页面数据按钮
	$("#update").click(function() {
		selectedGoodPlan = goodPlanGrid.getSelected();
		if (!selectedGoodPlan) {
			messager.alert("提示", "请选择记录");
			return;
		}

		if (planButtonTools.confirmAction(this)) {
			commonJs.enable($("#planEditorForm"));
			$("#state").attr("disabled", true);
			$("#goodName").attr("disabled", true);
			$("#goodsType").attr("disabled", true);
		}
	});

	/**
	 * 确定按钮 1：统一在后台控制前台显示操作后的信息--约定返回json对象{success:true|false,msg:showWhat};
	 * 2：自定义错误处理-myAjaxExceptionHandler
	 * 3：持久化方法根据当前操作的currentAction决定buttonTools.currentAction
	 */
	$("#sure").click(function() {
		if (planButtonTools.confirmAction(this)) {

			if ($("#effDate").val() > $("#expDate").val()) {
				messager.alert("提示", "生效时间大于失效时间");
				return;
			}

			if (commonJs.validate($("#planEditorForm"))) {
				messager.confirm("提示", "确认保存当前信息吗?", function(ok) {
					if (ok) {
						beforeLoading();
						var param = new Object();
						param = goodPlanToDate(commonJs.getData($("#planEditorForm")));
						ajaxAsy.remoteCall("DmGoodsPlanController", planButtonTools.currentAction, [ param ], function(replay) {
							afterLoading();
							var result = replay.getResult();
							if (result.success) {
								search_btn(goodPlanGrid);
							}
							messager.alert("提示", result.msg);
						}, myAjaxExceptionHandler);

					} else {
						return;
					}
				});
			}
			// 允许确定后，要显示遮罩层禁止操作，进行ajaxt异步持久化数据，回调函数要把当前操作重置成空""search_btn(goodPlanGrid);
		}
	});

	/**
	 * 删除按钮 1：持久化方法根据按钮的属性action决定
	 */
	$("#delete").click(function() {
		var $btn = $(this);
		if (planButtonTools.confirmAction(this)) {
			selectedGoodPlan = goodPlanGrid.getSelected();
			if (!selectedGoodPlan) {
				messager.alert("提示", "请选择记录");
				return;
			}
			messager.confirm("提示", "确认删除当前信息吗?", function(ok) {
				if (ok) {
					beforeLoading();
					var param = new Object();
					param = goodPlanToDate(commonJs.getData($("#planEditorForm")));
					ajaxAsy.remoteCall("DmGoodsPlanController", $btn.attr("action"), [ param ], function(replay) {
						afterLoading();
						var result = replay.getResult();
						if (result.success) {
							search_btn(goodPlanGrid);
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
		if (planButtonTools.confirmAction(this)) {
			selectedGoodPlan = goodPlanGrid.getSelected();
			if (selectedGoodPlan)
				commonJs.setData($("#planEditorForm"), goodPlanDateFormate(selectedGoodPlan));
			commonJs.disabled($("#planEditorForm"));
		}
	});
	
	$("#goodsType").change(function() {
		//var selectedValue = $(this).children('option:selected').val();
		$("#goodsId").val("-1");
		$("#goodName").val("");
	});
});