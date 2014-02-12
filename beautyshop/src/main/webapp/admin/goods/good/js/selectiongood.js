var requestParmas = {};
var selectedGood = "";// 选择特定商品对象
var goodsGrid = "";// 商品列表对象
var ajaxAsy = Ajax.getAsy();
var adParams = "";

function search_btn(goodsGrid) {
	requestParmas["goodsName"] = $('#searchGoodsName').val();
	if(adParams){
		requestParmas["excludeAdExist"] = adParams;
	}
	goodsGrid.loadData(requestParmas);
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

$(function() {
	adParams = window.dialogArguments;
	/** ********************************************************************* */
	goodsGrid = new TableGrid({
		$table : $("#goodList").find("table"),
		service : "DmGoodsController",
		method : "queryPage",
		pageIndex : 1,
		pageSize : 10,
		onClickRow : function(data) {
			selectedGood = this.getSelected();
		},
		onClickCell : function(field, value) {
		},
		onDblClickRow : function(data) {
			$("#sure").click();
		},
		renderColumn : function(field, value, row) {
			if ("createDate" == field || "effDate" == field || "expDate" == field || "putawayTime" == field) {
				if (value)
					return $.formatDate(value, "yyyy-MM-dd HH:mm:ss");
			} else if (field == "imageUri") {
				if (value) {
					var strArray = value.split(".");
					value = "<img id='" + row.goodsId + "' src=" + path + strArray[0] + "_mini." + strArray[1] + " />";
				} else {
					value = "<img id='" + row.goodsId + "' src= />";
				}
			}
			return value;
		},
		afterLoadData : function() {
			selectedGood = this.getSelected();
		}
	});

	search_btn(goodsGrid);

	// 查询数据信息
	$("#search_btn").click(function() {
		search_btn(goodsGrid);
	});

	//	
	$("#sure").click(function() {
		selectedGood = goodsGrid.getSelected();
		if (!selectedGood) {
			messager.alert("提示", "请选择商品");
		} else {
			window.returnValue = selectedGood;
			window.close();
		}
	});

	// 取消按钮
	$("#cancel").click(function() {
		window.returnValue = "";
		window.close();
	});

});