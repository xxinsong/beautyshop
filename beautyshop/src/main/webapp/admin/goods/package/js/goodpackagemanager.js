var requestParmas = {};
var packageButtonTools = new ButtonTools();
var selectedGoodPackage = "";// 选择特定商品对象
var selectedGood = "";
var goodPackageGrid = "";// 商品包列表对象
var goodsListGrid = "";// 商品列表
var goodPlanGrid = "";
var ajaxAsy = Ajax.getAsy();

function goodPackageDateFormate(data) {
	if (data.createDate) {// 创建时间
		if ($.type(data.createDate) == "date") {
			data.createDate = $.formatDate(data.createDate, "yyyy-MM-dd HH:mm:ss");
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
function goodPackageToDate(data) {
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

function search_btn(goodPackageGrid) {
	requestParmas["packageName"] = $('#searchPackageName').val();
	goodPackageGrid.loadData(requestParmas);
	$("#cancel").click();
}

function search_GoodsList(goodsListGrid) {
	var params = {};
	params["packageId"] = selectedGoodPackage.packageId;
	goodsListGrid.loadData(params);
}

function search_goodsplan(){
	selectedGoodPackage = goodPackageGrid.getSelected();
	if (selectedGoodPackage) {
		goodPlanGrid.loadData({
			"goodsId" : selectedGoodPackage.packageId,
			"goodsType": "2"
		});
	} else {
		goodPlanGrid.clearRows();
	}
}

/**
 * 根据选择的商品加载该商品标签
 */
/*
 * function search_GoodTags(){ selectedGoodPackage =
 * goodPackageGrid.getSelected(); if(selectedGoodPackage){
 * 
 * tagsGrid.loadData({"goodsId":selectedGoodPackage.goodsId}); }else{
 * tagsGrid.clearRows(); tagItemsGrid.clearRows(); } }
 * 
 * function search_tagsItems(){ selectedTag = tagsGrid.getSelected();
 * if(selectedTag){
 * tagItemsGrid.loadData({"tagGroupId":selectedTag.tagGroupId,"tagId":selectedTag.tagId});
 * }else{ tagItemsGrid.clearRows(); } }
 */

/**
 * 点击标签tab加载
 * 
 * @param me
 */
/*
 * function loadTagItems(me){ if(!packageButtonTools.confirmAction()){
 * me.crossBubble = false; return; }else{ me.crossBubble = true; }
 * $("#"+me.id+"Tab").show(); search_GoodTags(); }
 */
function loadTabPackage(me) {

}
function loadTabGoodWraps(me) {
	search_GoodsList(goodsListGrid);
}

function loadGoodsPlan(me){
	search_goodsplan();
}

function selectGood() {
	var param = "";
	var selectcatalog = window.showModalDialog("../catalogs/selectioncatalog.jsp", param, "dialogHeight: 600px; dialogWidth: 1020px;");
	if (selectcatalog) {
		$("#catalogId").val(selectcatalog.catalogId);
		$("#catalogName").val(selectcatalog.catalogName);
	} else {
		$("#catalogId").val("-1");
		$("#catalogName").val("");
	}
}

function goodwrapTab_beforeClick() {
	var ret = false;
	if (packageButtonTools.confirmAction()) {
		ret = true;
	}
	return ret;
}

function goodsPlanTab_beforeClick(){
	var ret = false;
	if (packageButtonTools.confirmAction()) {
		ret = true;
	}
	return ret;
}

$(function() {
	goodsListGrid = new TableGrid({
		$table : $("#goodList").find("table"),
		service : "DmGoodsController",
		method : "queryGoodsOnPackage",
		pageIndex : 1,
		pageSize : 10,
		onClickRow : function(data) {
			selectedGood = this.getSelected();
		},
		onClickCell : function(field, value) {
		},
		onDblClickRow : function(data) {
		},
		renderColumn : function(field, value, row) {
			return value;
		},
		afterLoadData : function() {
			selectedGood = this.getSelected();
		}
	});

	$("#addGoods").click(function() {
		selectedGoodPackage = goodPackageGrid.getSelected();
		var param = selectedGoodPackage;// ConfigureField.jsp
		if (param) {
			var prMap = window.showModalDialog("../good/goodwrapselections.jsp", param, "dialogHeight: 600px; dialogWidth: 1020px;");
			if (prMap) {
				search_GoodsList(goodsListGrid);
			}
		} else {
			messager.alert("提示", "请先选择商品包!");
		}
	});

	$("#deleteGoods").click(function() {
		selectedGood = goodsListGrid.getSelected();
		if (selectedGood) {
			selectedGoodPackage = goodPackageGrid.getSelected();
			if (!selectedGoodPackage) {
				messager.alert("提示", "请选择商品包");
				return;
			}
			var param = {
				"packageId" : selectedGoodPackage.packageId,
				"goodsId" : selectedGood.goodsId
			};
			messager.confirm("提示", "确认从商品包" + selectedGoodPackage.packageName + "剔除商品" + selectedGood.goodsName + "吗?", function(ok) {
				if (ok) {
					beforeLoading();
					ajaxAsy.remoteCall("DmGoodsPackageController", "pickOutGood", [ param ], function(replay) {
						afterLoading();
						var result = replay.getResult();
						if (result.success) {
							search_GoodsList(goodsListGrid);
						}
						messager.alert("提示", result.msg);
					}, myAjaxExceptionHandler);
				} else {
					return;
				}
			});
		} else {
			messager.alert("提示", "请先选择商品!");
		}
	});

	/** ********************************************************************* */
	goodPackageGrid = new TableGrid({
		$table : $("#packageList").find("table"),
		service : "DmGoodsPackageController",
		method : "queryPage",
		pageIndex : 1,
		pageSize : 10,
		onClickRow : function(data) {
			selectedGoodPackage = this.getSelected();
			commonJs.setData($("#packageEditorForm"), goodPackageDateFormate(data));
			search_GoodsList(goodsListGrid);
			search_goodsplan();
		},
		onBeforeClickRow : function(data) {
			if (packageButtonTools.confirmAction()) {
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
			if ("createDate" == field || "effDate" == field || "expDate" == field || "putawayTime" == field) {
				if (value)
					return $.formatDate(value, "yyyy-MM-dd HH:mm:ss");
			}
			return value;
		},
		afterLoadData : function() {
			selectedGoodPackage = this.getSelected();
			if (selectedGoodPackage != null) {
				commonJs.setData($("#packageEditorForm"), goodPackageDateFormate(selectedGoodPackage));
			} else {
				commonJs.clear($("#packageEditorForm"));
			}
			commonJs.disabled($("#packageEditorForm"));
			packageButtonTools.setCurrentAction("");
		}
	});

	search_btn(goodPackageGrid);
	
	
	goodPlanGrid = new TableGrid({
		$table : $("#goodsPlanList").find("table"),
		service : "DmGoodsPlanController",
		method : "queryPage",
		pageIndex : 1,
		pageSize : 10,
		onClickRow : function(data) {
			/*selectedGoodPlan = this.getSelected();
			commonJs.setData($("#planEditorForm"), goodPlanDateFormate(data));*/
		},
		onClickCell : function(field, value) {
		},
		onDblClickRow : function(data) {
		},
		renderColumn : function(field, value, row) {
			if ("stateDate" == field || "effDate" == field || "expDate" == field) {
				if (value)
					return $.formatDate(value, "yyyy-MM-dd HH:mm:ss");
			}
			return value;
		},
		afterLoadData : function() {
		}
	});

	// 查询数据信息
	$("#search_btn").click(function() {
		search_btn(goodPackageGrid);
	});

	$("#add").click(function() {
		if (packageButtonTools.confirmAction(this)) {
			commonJs.clear($("#packageEditorForm"));
			commonJs.enable($("#packageEditorForm"));
			commonJs.setData($("#packageEditorForm"), {
				state : "00E",
				createDate : new Date()
			});
			$("#state").attr("disabled",true);//约束添加商品包的时候只能是编辑中状态
		}
	});

	// 修改页面数据按钮
	$("#update").click(function() {
		selectedGoodPackage = goodPackageGrid.getSelected();
		if (!selectedGoodPackage) {
			messager.alert("提示", "请选择记录");
			return;
		}

		if (packageButtonTools.confirmAction(this)) {
			//当商品包是下架或者上架的状态时,约束商品包其它信息不能更改，只能更改状态
			if ("00X" == selectedGoodPackage.state || "00A" == selectedGoodPackage.state) {
				$("#state").removeAttr("disabled");
			} else {
				//只能是编辑中的商品包状态才允许更改所有信息
				commonJs.enable($("#packageEditorForm"));
			}
			
		}
	});

	/**
	 * 确定按钮 1：统一在后台控制前台显示操作后的信息--约定返回json对象{success:true|false,msg:showWhat};
	 * 2：自定义错误处理-myAjaxExceptionHandler
	 * 3：持久化方法根据当前操作的currentAction决定buttonTools.currentAction
	 */
	$("#sure").click(function() {
		if (packageButtonTools.confirmAction(this)) {

			if ($("#effDate").val() > $("#expDate").val()) {
				messager.alert("提示", "生效时间大于失效时间");
				return;
			}

			if (commonJs.validate($("#packageEditorForm"))) {
				messager.confirm("提示", "确认保存当前信息吗?", function(ok) {
					if (ok) {
						beforeLoading();
						var param = new Object();
						param = goodPackageToDate(commonJs.getData($("#packageEditorForm")));
						ajaxAsy.remoteCall("DmGoodsPackageController", packageButtonTools.currentAction, [ param ], function(replay) {
							afterLoading();
							var result = replay.getResult();
							if (result.success) {
								search_btn(goodPackageGrid);
							}
							messager.alert("提示", result.msg);
						}, myAjaxExceptionHandler);

					} else {
						return;
					}
				});
			}
			// 允许确定后，要显示遮罩层禁止操作，进行ajaxt异步持久化数据，回调函数要把当前操作重置成空""search_btn(goodPackageGrid);
		}
	});

	/**
	 * 删除按钮 1：持久化方法根据按钮的属性action决定
	 */
	$("#delete").click(function() {
		var $btn = $(this);
		if (packageButtonTools.confirmAction(this)) {
			selectedGoodPackage = goodPackageGrid.getSelected();
			if (!selectedGoodPackage) {
				messager.alert("提示", "请选择记录");
				return;
			}
			messager.confirm("提示", "确认删除当前信息吗?", function(ok) {
				if (ok) {
					beforeLoading();
					var param = new Object();
					param = goodPackageToDate(commonJs.getData($("#packageEditorForm")));
					ajaxAsy.remoteCall("DmGoodsPackageController", $btn.attr("action"), [ param ], function(replay) {
						afterLoading();
						var result = replay.getResult();
						if (result.success) {
							search_btn(goodPackageGrid);
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
		if (packageButtonTools.confirmAction(this)) {
			selectedGoodPackage = goodPackageGrid.getSelected();
			if (selectedGoodPackage)
				commonJs.setData($("#packageEditorForm"), goodPackageDateFormate(selectedGoodPackage));
			commonJs.disabled($("#packageEditorForm"));
		}
	});
});