var result;
$(function(){
	sendOrder();
	//alert('111');
});

function sendOrder() {
	var ORDERSEQ = $("#ORDERSEQ").val();
	var ORDERAMOUNT = $("#ORDERAMOUNT").val();
	var PRODUCTAMOUNT = $("#PRODUCTAMOUNT").val();
	var BANKID = $("#BANKID").val();

	var params = new Object();
	params["ORDERSEQ"] = ORDERSEQ;
	params["ORDERAMOUNT"] = ORDERAMOUNT;
	params["PRODUCTAMOUNT"] = PRODUCTAMOUNT;
	params["BANKID"] = BANKID;

	Ajax.getSy().remoteCall("PaySendController", "queryPayConfig", [params], function(reply) {
		result = reply.getResult();
	});
		
	var MERCHANTID = result.MERCHANTID;
	var ORDERREQTRANSEQ = result.ORDERREQTRANSEQ;
	var ORDERDATE = result.ORDERDATE;
	var ENCODETYPE = result.ENCODETYPE;
	var MERCHANTURL = result.MERCHANTURL;
	var BACKMERCHANTURL = result.MERCHANTURL;
	var MAC = result.MAC;
	$("#MERCHANTID").val(MERCHANTID);
	$("#ORDERREQTRANSEQ").val(ORDERREQTRANSEQ);
	$("#ORDERDATE").val(ORDERDATE);
	$("#ENCODETYPE").val(ENCODETYPE);
	$("#MERCHANTURL").val(MERCHANTURL);
	$("#BACKMERCHANTURL").val(BACKMERCHANTURL);
	$("#MAC").val(MAC);
//	alert(MERCHANTID);
	$("#send_form").submit();
}
