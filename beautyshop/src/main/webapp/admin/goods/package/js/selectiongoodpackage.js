var requestParmas = {};
var selectedGoodPackage = "";// 选择特定商品对象
var goodPackageGrid = "";// 商品包列表对象
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

$(function() {
	/*********************************************************************** */
	goodPackageGrid = new TableGrid({
		$table : $("#packageList").find("table"),
		service : "DmGoodsPackageController",
		method : "queryPage",
		pageIndex : 1,
		pageSize : 10,
		onClickRow : function(data) {
			selectedGoodPackage = this.getSelected();
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
		}
	});

	search_btn(goodPackageGrid);

	// 查询数据信息
	$("#search_btn").click(function() {
		search_btn(goodPackageGrid);
	});

	
//	
	$("#sure").click(function() {
		selectedGoodPackage = goodPackageGrid.getSelected();
		if (!selectedGoodPackage) {
			messager.alert("提示", "请选择商品包");
		} else {
			window.returnValue = selectedGoodPackage;
			window.close();
		}
	});

	// 取消按钮
	$("#cancel").click(function() {
		window.returnValue = "";
		window.close();
	});
});