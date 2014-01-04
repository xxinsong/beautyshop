$(function() {
	//关闭
	$(".pop_close", ".login_pop").click(function() {
		closePayDialog();
	});
	$("#sucess_pay").on('click',function(){
		closePayDialog();
    });
	$("#error_pay").on('click',function(){
		closePayDialog();
    });
	$("#return_pay").on('click',function(){
		closePayDialog();
    });

})

function closePayDialog() {
	$(".login_pop").hide();
	$(".trans_div").hide();
}
