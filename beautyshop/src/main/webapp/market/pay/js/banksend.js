$(function() {
	sendOrderResult();
});

function sendOrderResult() {
	var params = new Object();
	params["UPTRANSEQ"] = $("#UPTRANSEQ").val();
	params["TRANDATE"] = $("#TRANDATE").val();
	params["ORDERREQTRANSEQ"] = $("#ORDERREQTRANSEQ").val();
	params["ORDERSEQ"] = $("#ORDERSEQ").val();
	params["ORDERAMOUNT"] = $("#ORDERAMOUNT").val();
	params["PRODUCTAMOUNT"] = $("#PRODUCTAMOUNT").val();
	params["ATTACHAMOUNT"] = $("#ATTACHAMOUNT").val();
	params["CURTYPE"] = $("#CURTYPE").val();
	params["ENCODETYPE"] = $("#ENCODETYPE").val();
	
	var result;
	Ajax.getSy().remoteCall("DmPayConfigController", "getOrderConfig", [params], function(reply) {
		result = reply.getResult();
	});
	$("#retnCode").val(result.RETNCODE);
	$("#retnInfo").val(result.RETNINFO);
	$("#sign").val(result.SIGN);
	$("#banksendForm").submit();
}
