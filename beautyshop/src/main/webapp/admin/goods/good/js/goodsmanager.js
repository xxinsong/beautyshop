var requestParmas = {};
var goodsButtonTools = new ButtonTools();
var selectedGood = "";// 选择特定商品对象
var selectedTag = "";
var goodsGrid = "";// 商品列表对象
var tagsGrid = "";// 商品标签列表对象
var tagItemsGrid = "";
var tagItemsEdiable = false;
var ajaxAsy = Ajax.getAsy();

function goodsDateFormate(data) {
	if (data.createDate) {// 创建时间
		if ($.type(data.createDate) == "date") {
			data.createDate = $.formatDate(data.createDate, "yyyy-MM-dd hh:mm:ss");
		}
	}
	if (data.effDate) {// 生效时间
		if ($.type(data.effDate) == "date") {
			data.effDate = $.formatDate(data.effDate, "yyyy-MM-dd hh:mm:ss");
		}
	}
	if (data.expDate) {// 失效时间
		if ($.type(data.expDate) == "date") {
			data.expDate = $.formatDate(data.expDate, "yyyy-MM-dd hh:mm:ss");
		}
	}
	if (data.putawayTime) {// 上架时间
		if ($.type(data.putawayTime) == "date") {
			data.putawayTime = $.formatDate(data.putawayTime, "yyyy-MM-dd hh:mm:ss");
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
function goodsToDate(data) {
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
	if (data.putawayTime) {
		if ($.type(data.putawayTime) == "string") {
			data.putawayTime = new Date(data.putawayTime.replace(regEx, "/"));
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

function search_btn(goodsGrid) {
	requestParmas["goodsName"] = $('#searchGoodsName').val();
	requestParmas["catalogId"] = $('#searchCatalogId').val();
	goodsGrid.loadData(requestParmas);
	$("#cancel").click();
}

/**
 * 根据选择的商品加载该商品标签
 */
function search_GoodTags() {
	selectedGood = goodsGrid.getSelected();
	if (selectedGood) {
		tagsGrid.loadData({
			"goodsId" : selectedGood.goodsId
		});
	} else {
		tagsGrid.clearRows();
		tagItemsGrid.clearRows();
	}
}

function search_tagsItems() {
	selectedTag = tagsGrid.getSelected();
	if (selectedTag) {
		tagItemsGrid.loadData({
			"tagGroupId" : selectedTag.tagGroupId,
			"tagId" : selectedTag.tagId
		});
	} else {
		tagItemsGrid.clearRows();
	}
}

function goodsTab_beforeClick() {
	if (tagItemsEdiable) {
		messager.alert("提示", "请先保存或者取消当前操作");
		return false;
	} else {
		return true;
	}
}

function tagItemsTab_beforeClick() {
	if (goodsButtonTools.currentAction != "") {
		messager.alert("提示", "请先保存或者取消当前操作");
		return false;
	} else {
		return true;
	}
}
/**
 * 点击标签tab加载
 * 
 * @param me
 */
function loadTagItems(me) {
	if (goodsButtonTools.currentAction == "") {
		$("#" + me.id + "Tab").show();
		search_GoodTags();
	}
}

function loadTagGood(me) {
}

/** *******************商品目录树展示****************************************************************************** */
var zTree;
var selectTreeNode;
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
		beforeClick : function beforeClick() {
			if (!tagItemsEdiable) {
				if (goodsButtonTools.confirmAction()) {
					goodsButtonTools.setCurrentAction("");
					return true;
				} else {
					return false;
				}
			} else {
				messager.alert("提示", "请先取消或者保存操作");
				return false;
			}

		},
		onClick : function(event, treeId, treeNode, clickFlag) {
			selectTreeNode = treeNode;
			// 设置当前查询标签id
			commonJs.setData($(".searchformDiv"), {
				"searchCatalogId" : treeNode.catalogId
			});
			$("#search_btn").click();
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
			rootPId : "-1"
		}
	}
};

function loadCatalogTree() {
	ajaxAsy.remoteCall("DmGoodsCatalogController", "query", [ {
		"upCatalogId" : "-1"
	} ], function(reply) {
		var zNodes = reply.getResult();
		if (zNodes.length > 0) {
			zTree = $.fn.zTree.init($("#catalogTree"), setting, zNodes);
		}
	});
}

/**
 * 上传图片弹出框
 */
function popoUploadDiv() {
	if (goodsGrid.getSelected().state != "00E") {
		messager.alert("提示", "当前所选择的商品非编辑中状态，你不允许上传图片");
		return;
	}
	overlay();
	selectedGood = goodsGrid.getSelected();
	$("#popDiv").show();
	$("#goodsupload_title").empty();
	$("#goodsupload_title").text("商品[" + selectedGood.goodsName + "]图片上传");
	$("#textfield").val("");
};

function close_btn() {
	$("#popDiv").hide();
	closeOverlay();
}

function goodImageUpload() {
	var uploadImage = $("#textfield").val();
	if (!uploadImage) {
		messager.alert("提示", "请选择需要上传的图片");
		return;
	} else {
		var strArray = uploadImage.split(".");
		if (strArray.length < 2) {
			messager.alert("提示", "图片文件格式不正确,请选择jpg,gif格式图片");
			return;
		} else {
			var suffix = strArray[strArray.length - 1];
			if (suffix != "jpg" && suffix != "gif") {
				messager.alert("提示", "图片文件格式不正确,请选择jpg,gif格式图片");
				return;
			}
		}
	}
	$(".btn").attr("disabled", true);
	$("#viewButtion").val("正在上传..");
	selectedGood = goodsGrid.getSelected();
	$.ajaxFileUpload({
		url : "../../../image/upload",
		secureuri : false,
		fileElementId : 'gfile',
		dataType : "json",
		data : {
			"goodsId" : selectedGood.goodsId,
			"basePrice" : selectedGood.basePrice,
			"catalogId" : selectedGood.catalogId,
			"imageUri" : selectedGood.imageUri
		},
		success : function(retData) {
			$("#textfield").val("");
			close_btn();
			messager.alert("提示", retData.msg);
			if (retData.success) {
				$("#search_btn").click();
				return;
			}
		},
		error : function(fileName) {
			alert("上传失败");
		},
		complete : function() {
			$(".btn").removeAttr("disabled");
			$("#viewButtion").val("浏览...");
		}
	});
}

function selectCatalog() {
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

$(function() {
	// 加载商品目录树
	loadCatalogTree();
	// 初始化商品标签列表
	tagsGrid = new TableGrid({
		$table : $("#tagList").find("table"),
		service : "DmGoodsController",
		method : "queryPageTagsOnGoods",
		pageIndex : 1,
		pageSize : 10,
		onClickRow : function(data) {
			selectedTag = this.getSelected();
			search_tagsItems();
		},
		onBeforeClickRow : function(data) {
			return goodsTab_beforeClick();
		},
		onClickCell : function(field, value) {
		},
		onDblClickRow : function(data) {
		},
		renderColumn : function(field, value) {
			return value;
		},
		afterLoadData : function() {
			selectedTag = this.getSelected();
			search_tagsItems();
		}
	});

	// 初始化商品可选标签列表
	tagItemsGrid = new TableGrid({
		$table : $("#tagItemList").find("table"),
		service : "TagsItemController",
		method : "queryPage",
		pageIndex : 1,
		pageSize : 10,
		onClickRow : function(data) {
		},
		onBeforeClickRow : function(data) {
			return true;
		},
		onClickCell : function(field, value) {
		},
		onDblClickRow : function(data) {
		},
		renderColumn : function(field, defaultValue, rowValue) {
			if (field == "checked") {
				if (defaultValue == "true") {
					return "<input type='checkbox' checked='true' itemId=" + rowValue.itemId + "  ></input>";
				} else {
					return "<input type='checkbox' itemId=" + rowValue.itemId + "></input>";
				}
			}
			return defaultValue;
		},
		getSelected : function() {
			var items = [];
			$("#tagItemList").find("input[type=checkbox]").each(function() {
				if (this.checked) {
					if($(this).attr("itemId")){
						items.push({
							"itemId" : $(this).attr("itemId")
						});
					}
				}
			});
			return items;
		},
		afterLoadData : function() {
			$("#tagItemList").find("input[type=checkbox]").each(function() {
				this.disabled = true;
			});
		}
	});

	$("#updateTagItems").click(function() {
		if ($("#tagItemList").find("input[type=checkbox]").size() == 0) {
			tagItemsEdiable = false;
			messager.alert("提示", "当前标签没有条目值");
			return false;
		}
		tagItemsEdiable = true;
		$("#tagItemList").find("input[type=checkbox]").each(function() {
			this.disabled = false;
		});
	});

	$("#sureTagItems").click(function() {
		selectedTag = tagsGrid.getSelected();
		if ($("#tagItemList").find("input[type=checkbox]").size() == 0) {
			messager.alert("提示", "当前标签没有条目值");
			return;
		}
		var param = {
			"tagGroupId" : selectedTag.tagGroupId,
			"tagsItems" : []
		};
		param.tagsItems = tagItemsGrid.getSelected();
		messager.confirm("提示", "确认保存当前信息吗?", function(ok) {
			if (ok) {
				beforeLoading();

				ajaxAsy.remoteCall("DmGoodsController", "attachGoodsTagsItemValue", [ param ], function(replay) {
					afterLoading();
					var result = replay.getResult();
					if (result.success) {
						$("#cancelTagItems").click();
					}
					messager.alert("提示", result.msg);
				}, myAjaxExceptionHandler);

			} else {
				return;
			}
		});
	});

	$("#cancelTagItems").click(function() {
		tagItemsEdiable = false;
		search_tagsItems();
	});

	/** ********************************************************************* */

	goodsGrid = new TableGrid({
		$table : $("#goodList").find("table"),
		service : "DmGoodsController",
		method : "queryPage",
		pageIndex : 1,
		pageSize : 10,
		onClickRow : function(data) {
			selectedGood = this.getSelected();

			if (data.catalogId != "-1" && selectTreeNode) {
				data.catalogName = selectTreeNode.catalogName;
			} else {
				data.catalogName = "";
			}

			commonJs.setData($("#goodsEditorForm"), goodsDateFormate(data));
			search_GoodTags();
		},
		onBeforeClickRow : function(data) {
			if (!tagItemsEdiable) {
				if (goodsButtonTools.confirmAction()) {
					return true;
				} else {
					return false;
				}
			} else {
				messager.alert("提示", "请先取消或者保存操作");
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
					return $.formatDate(value, "yyyy-MM-dd hh:mm:ss");
			} else if (field == "imageUri") {
				if (value) {
					var strArray = value.split(".");
					value = "<img id='" + row.goodsId + "' src=" + path + strArray[0] + "_mini." + strArray[1] + " /><input type='button' class='btn' value='上 传' onClick='popoUploadDiv()' />";
				} else {
					value = "<input type='button' class='btn' value='上 传' onClick='popoUploadDiv()' />";
				}
			}
			return value;
		},
		afterLoadData : function() {
			selectedGood = this.getSelected();
			if (selectedGood != null) {

				if (selectedGood.catalogId != "-1" && selectTreeNode) {
					selectedGood.catalogName = selectTreeNode.catalogName;
				} else {
					selectedGood.catalogName = "";
				}

				commonJs.setData($("#goodsEditorForm"), goodsDateFormate(selectedGood));
			} else {
				commonJs.clear($("#goodsEditorForm"));
			}
			commonJs.disabled($("#goodsEditorForm"));
			search_GoodTags();
			goodsButtonTools.setCurrentAction("");
		}
	});

	search_btn(goodsGrid);

	// 查询数据信息
	$("#search_btn").click(function() {
		search_btn(goodsGrid);
	});

	$("#add").click(function() {
		selectTreeNode = zTree.getSelectedNodes()[0];

		var catalogId = "";
		var catalogName = "";
		if (!selectTreeNode) {
			catalogId = -1;
		} else {
			catalogId = selectTreeNode.catalogId;
			catalogName = selectTreeNode.catalogName;
		}

		if (goodsButtonTools.confirmAction(this)) {
			commonJs.clear($("#goodsEditorForm"));
			commonJs.enable($("#goodsEditorForm"));
			commonJs.setData($("#goodsEditorForm"), {
				state : "00E",
				createDate : new Date(),
				"catalogId" : catalogId,
				"catalogName" : catalogName
			});
		}
	});

	// 修改页面数据按钮
	$("#update").click(function() {
		selectedGood = goodsGrid.getSelected();
		if (!selectedGood) {
			messager.alert("提示", "请选择记录");
			return;
		}

		if (goodsButtonTools.confirmAction(this)) {
			if ("00X" == selectedGood.state || "00A" == selectedGood.state) {
				$("#state").removeAttr("disabled");// attr("disabled", true);
			} else {
				commonJs.enable($("#goodsEditorForm"));
			}
		}
	});

	/**
	 * 确定按钮 1：统一在后台控制前台显示操作后的信息--约定返回json对象{success:true|false,msg:showWhat};
	 * 2：自定义错误处理-myAjaxExceptionHandler
	 * 3：持久化方法根据当前操作的currentAction决定buttonTools.currentAction
	 */
	$("#sure").click(function() {
		if ($("#effDate").val() > $("#expDate").val()) {
			messager.alert("提示", "生效时间大于失效时间");
			return;
		}
		if (goodsButtonTools.confirmAction(this)) {
			if (commonJs.validate($("#goodsEditorForm"))) {
				messager.confirm("提示", "确认保存当前信息吗?", function(ok) {
					if (ok) {
						beforeLoading();
						var param = new Object();
						param = goodsToDate(commonJs.getData($("#goodsEditorForm")));
						ajaxAsy.remoteCall("DmGoodsController", goodsButtonTools.currentAction, [ param ], function(replay) {
							afterLoading();
							var result = replay.getResult();
							if (result.success) {
								search_btn(goodsGrid);
							}
							messager.alert("提示", result.msg);
						}, myAjaxExceptionHandler);

					} else {
						return;
					}
				});
			}
			// 允许确定后，要显示遮罩层禁止操作，进行ajaxt异步持久化数据，回调函数要把当前操作重置成空""search_btn(goodsGrid);
		}
	});

	/**
	 * 删除按钮 1：持久化方法根据按钮的属性action决定
	 */
	$("#delete").click(function() {
		var $btn = $(this);
		if (goodsButtonTools.confirmAction(this)) {
			selectedGood = goodsGrid.getSelected();
			if (!selectedGood) {
				messager.alert("提示", "请选择记录");
				return;
			}

			messager.confirm("提示", "确认删除当前信息吗?", function(ok) {
				if (ok) {
					beforeLoading();
					var param = new Object();
					param = goodsToDate(commonJs.getData($("#goodsEditorForm")));
					ajaxAsy.remoteCall("DmGoodsController", $btn.attr("action"), [ param ], function(replay) {
						afterLoading();
						var result = replay.getResult();
						if (result.success) {
							search_btn(goodsGrid);
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
		if (goodsButtonTools.confirmAction(this)) {
			// 这里不用转换date，因为renderColumn函数已经转换了，类型是string类型
			selectedGood = goodsGrid.getSelected();
			if (selectedGood)
				commonJs.setData($("#goodsEditorForm"), goodsDateFormate(selectedGood));
			commonJs.disabled($("#goodsEditorForm"));
		}
		// alert(goodsButtonTools.currentAction);
	});

	$("#addTags").click(function() {
		selectedGood = goodsGrid.getSelected();
		var param = selectedGood;// ConfigureField.jsp
		if (goodsTab_beforeClick()) {
			if (param) {

				var prMap = window.showModalDialog("../tags/goodtagsselection.jsp", param, "dialogHeight: 600px; dialogWidth: 1020px;");
				if (prMap) {
					search_GoodTags();
				}
			} else {
				messager.alert("提示", "请先选择商品!");
			}
		}

	});
	$("#deleteTags").click(function() {
		selectedTag = tagsGrid.getSelected();
		selectedGood = goodsGrid.getSelected();
		var hasChild = false;
		if (goodsTab_beforeClick()) {
			if (selectedTag) {
				var param = {
					"parentTagId" : selectedTag.tagId,
					"goodsId" : selectedGood.goodsId
				};
				Ajax.getSy().remoteCall("TagsController", "exitsChildrenCheckedTags", [ param ], function(reply) {
					if (reply.getResult()) {
						messager.alert("系统提示", "存在子标签，不能删除");
						hasChild = true;
					}
				});
				if (hasChild) {
					return;
				} else {
					messager.confirm("提示", "确认删除当前商品的标签吗?", function(ok) {
						if (ok) {
							beforeLoading();
							var param = {
								"tagGroupId" : selectedTag.tagGroupId
							};
							ajaxAsy.remoteCall("DmGoodsController", "releasGoodTags", [ param ], function(replay) {
								afterLoading();
								var result = replay.getResult();
								if (result.success) {
									search_GoodTags();
								}
								messager.alert("提示", result.msg);
							}, myAjaxExceptionHandler);

						} else {
							return;
						}
					});
				}
			} else {
				messager.alert("提示", "请先选择商品标签!");
			}
		}

	});
});