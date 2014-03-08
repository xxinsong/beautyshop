$(function() {
	//关闭
	$(".pop_close", ".login_pop").click(function() {
//		closePayDialog();
	});
	$("#sucess_pay").on('click',function(){
		closePayDialog();
        location.href = commonJs.getWebPath() + "/order";
    });
	$("#error_pay").on('click',function(){
		closePayDialog();
        location.href = commonJs.getWebPath() + "/order";
    });
	$("#return_pay").on('click',function(){
		closePayDialog();
        location.href = commonJs.getWebPath() + "/order";
    });

})

function closePayDialog() {
	$(".login_pop").hide();
	$(".trans_div").hide();
}
