$(function() {
	checkResult();
});

function checkResult() {
	var params = new Object();
	params["UPTRANSEQ"] = $("#UPTRANSEQ").val();
	params["TRANDATE"] = $("#TRANDATE").val();
	params["RETNCODE"] = $("#RETNCODE").val();
	params["RETNINFO"] = $("#RETNINFO").val();
	params["ORDERREQTRANSEQ"] = $("#ORDERREQTRANSEQ").val();
	params["ORDERSEQ"] = $("#ORDERSEQ").val();
	params["ORDERAMOUNT"] = $("#ORDERAMOUNT").val();
	params["PRODUCTAMOUNT"] = $("#PRODUCTAMOUNT").val();
	params["ATTACHAMOUNT"] = $("#ATTACHAMOUNT").val();
	params["CURTYPE"] = $("#CURTYPE").val();
	params["ENCODETYPE"] = $("#ENCODETYPE").val();
	params["ATTACH"] = $("#ATTACH").val();
	params["SIGN"] = $("#SIGN").val();
	
	Ajax.getSy().remoteCall("PayReceiveController", "checkResult", [params], function(reply) {
		var result = reply.getResult();
		if (result.success == true) {
			$("#order_msg1").text("订单号："+result.orderNo);
			$("#pay_sec").show();
		} else {
			$("#err_code").text("错误代码："+$("#RETNCODE").val());
			$("#err_msg").text("错误原因："+$("#RETNINFO").val());
			$("#pay_fal").show();
		}
	});
}
