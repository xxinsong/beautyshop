$(function() {
	var testgrid = new TableGrid( {
		$table : $(".grid").find("table"),
		service : "MenuController",
		method : "searchMenus",
		pageIndex : 1,
		pageSize : 10,
		onBeforeClickRow : function(data) {
		    return true;
		},
		onClickRow : function(data) {
		},
		onClickCell : function(field, value) {
		},
		onDblClickRow : function(data) {
		},
		renderColumn : function(field, value) {
			if (field != "target_name") {
				return value;
			}
			return "<a>" + value + "</a>";
		}
	});
	testgrid.loadData();
	
	$(".submitbtn").click(function() {
		commonJs.validate($(".formgrid"));
	});
	$("#resetBtn").click(function() {
		commonJs.clear($(".formgrid"));
	});
	$("#modifyBtn").click(function() {
		commonJs.enable($(".formgrid"));
	});
	$("#cancelBtn").click(function() {
		commonJs.disabled($(".formgrid"));
	});
	$("#setBtn").click(function() {
		commonJs.setData($(".formgrid"), { textarea1 : "内容", select : "99B", vehicle : "0", sex : "female"});
	});
})