var testgrid;

$(function() {
	testgrid = new TableGrid( {
		$table : $(".grid").find("table"),
		service : "DmMerchantFileController",
		method : "queryPage",
		pageIndex : 1,
		pageSize : 1,
		onClickRow : function(data) {
		},
		onClickCell : function(field, value) {
		},
		onDblClickRow : function(data) {
		},
		renderColumn : function(field, value) {
			if (field == 'uri') {
				return "<img src='" + contextPath + value + "' title='营业执照/店面照片等' height='400px'></img>";
			}
		}
	});
	
	queryData();
	
});

function queryData() {
	var params = new Object();
	params.merchantId = merchantId;
	params.state = '00A';
	testgrid.params = params;
	testgrid.loadData();
}
