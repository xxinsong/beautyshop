var requestParmas = {};
var adButtonTools = new ButtonTools();
var selectedAd = "";//选择特定商品对象
var selectedGood = "";
var goodAdGrid = "";//商品包列表对象
var goodsListGrid = "";//商品列表
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

function search_btn(goodAdGrid) {
	requestParmas["adName"] = $('#searchAdName').val();
	goodAdGrid.loadData(requestParmas);
	$("#cancel").click();
}

function search_GoodsList(goodsListGrid) {
	var params = {};
	params["packageId"] = selectedAd.packageId;
	goodsListGrid.loadData(params);
}

function selectGood() {
	var param = "";
	var selectgood = window.showModalDialog("../good/selectiongood.jsp", param, "dialogHeight: 600px; dialogWidth: 1020px;");
	if (selectgood) {
		$("#goodsId").val(selectgood.goodsId);
		$("#goodsName").val(selectgood.goodsName);
	} else {
		$("#goodsId").val("-1");
		$("#goodsName").val("");
	}
}

/**
 * 上传图片弹出框
 */
function popoUploadDiv() {
	overlay();
	selectedAd = goodAdGrid.getSelected();
	$("#popDiv").show();
	$("#adupload_title").empty();
	$("#adupload_title").text("广告[" + selectedAd.adName + "]图片上传");
	$("#textfield").val("");
};

function close_btn() {
	$("#popDiv").hide();
	closeOverlay();
}

function adImageUpload() {
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
	selectedAd = goodAdGrid.getSelected();
	$.ajaxFileUpload({
		url : "../../../image/adupload",
		secureuri : false,
		fileElementId : 'adfile',
		dataType : "json",
		data : {
			"id" : selectedAd.id,
			"imageUrl" : selectedAd.imageUrl
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
			messager.alert("提示", "上传失败");
		},
		complete : function() {
			$(".btn").removeAttr("disabled");
			$("#viewButtion").val("浏览...");
		}
	});
}

$(function() {
	/************************************************************************/
	goodAdGrid = new TableGrid({
		$table : $("#adList").find("table"),
		service : "DmAdvertisementController",
		method : "queryPage",
		pageIndex : 1,
		pageSize : 10,
		onClickRow : function(data) {
			selectedAd = this.getSelected();
			commonJs.setData($("#adEditorForm"), data);
		},
		onBeforeClickRow : function(data) {
			if (adButtonTools.confirmAction()) {
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
			if (field == "imageUrl") {
				if (value) {
					var strArray = value.split(".");
					value = "<img id='" + row.id + "' src=" + path + strArray[0] + "_mini." + strArray[1] + " /><input type='button' class='btn' value='上 传' onClick='popoUploadDiv()' />";
				} else {
					value = "<img id='" + row.id + "' src= /><input type='button' class='btn' value='上 传' onClick='popoUploadDiv()' />";
				}
			}
			return value;
		},
		afterLoadData : function() {
			selectedAd = this.getSelected();
			if (selectedAd != null) {
				commonJs.setData($("#adEditorForm"), selectedAd);
			} else {
				commonJs.clear($("#adEditorForm"));
			}
			commonJs.disabled($("#adEditorForm"));
			adButtonTools.setCurrentAction("");
		}
	});

	search_btn(goodAdGrid);

	//查询数据信息
	$("#search_btn").click(function() {
		search_btn(goodAdGrid);
	});

	$("#add").click(function() {
		if (adButtonTools.confirmAction(this)) {
			commonJs.clear($("#adEditorForm"));
			commonJs.enable($("#adEditorForm"));
		}
	});

	//修改页面数据按钮
	$("#update").click(function() {
		selectedAd = goodAdGrid.getSelected();
		if (!selectedAd) {
			messager.alert("提示", "请选择记录");
			return;
		}

		if (adButtonTools.confirmAction(this)) {
			commonJs.enable($("#adEditorForm"));
		}
	});

	$("#sure").click(function() {
		if (adButtonTools.confirmAction(this)) {
			if (commonJs.validate($("#adEditorForm"))) {
				messager.confirm("提示", "确认保存当前信息吗?", function(ok) {
					if (ok) {
						beforeLoading();
						var param = commonJs.getData($("#adEditorForm"));
						ajaxAsy.remoteCall("DmAdvertisementController", adButtonTools.currentAction, [ param ], function(replay) {
							afterLoading();
							var result = replay.getResult();
							if (result.success) {
								search_btn(goodAdGrid);
							}
							messager.alert("提示", result.msg);
						}, myAjaxExceptionHandler);

					} else {
						return;
					}
				});
			}
			//允许确定后，要显示遮罩层禁止操作，进行ajaxt异步持久化数据，回调函数要把当前操作重置成空""search_btn(goodAdGrid);
		}
	});

	/**
	 * 删除按钮
	 * 1：持久化方法根据按钮的属性action决定
	 */
	$("#delete").click(function() {
		var $btn = $(this);
		if (adButtonTools.confirmAction(this)) {
			selectedAd = goodAdGrid.getSelected();
			if (!selectedAd) {
				messager.alert("提示", "请选择记录");
				return;
			}
			messager.confirm("提示", "确认删除当前信息吗?", function(ok) {
				if (ok) {
					beforeLoading();
					var param = commonJs.getData($("#adEditorForm"));
					ajaxAsy.remoteCall("DmAdvertisementController", $btn.attr("action"), [ param ], function(replay) {
						afterLoading();
						var result = replay.getResult();
						if (result.success) {
							search_btn(goodAdGrid);
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
		if (adButtonTools.confirmAction(this)) {
			selectedAd = goodAdGrid.getSelected();
			if (selectedAd)
				commonJs.setData($("#adEditorForm"), selectedAd);
			commonJs.disabled($("#adEditorForm"));
		}
	});
});