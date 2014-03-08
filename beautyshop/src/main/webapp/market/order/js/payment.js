var goodsInstList;
var total=0;
var totalPrice = 0;
$(function(){	
    goodsInstList = new QryPager({
        $tpl_scope:$("#goodsInst_list"),
        $tpl_ele:$("#row_tpl"),
        $pager:$("#goodsInst_page"),
        service:"DmCustOrderController",
        method:"selectOrderGoodsInstList",
        pageIndex:1,
        pageSize:5,
        record_event:function(data,context){goodsInstRowRender(data,context)}
    });
      
    loadGoodsInstList();
        
    $("#btn_submit").on('click',function(){
    	submitPay();
    });
    
    $("#deposit_card").on('click',function(){
    	loadDepositCard();
    });
    
    $("#credit_card").on('click',function(){
    	loadCreditCard();
    });
    
    $("#pay_platform").on('click',function(){
    	loadPayPlatform();
    });
    
    $("#open_cont").on('click',function(){
    	showOrderList();
    });
    
    $("#close_cont").on('click',function(){
    	hideOrderList();
    });
    
    $("#goShoppingCart").on('click',function(){
        window.location.href=commonJs.getWebPath()+"/market/cart/mycart";
     });

    $(".cart_logo").click(function() {
        location = commonJs.getWebPath() + "/welcome";
    });
});

function goodsInstRowRender(data,context){
    $("[name='goodsName']",context).text(data.goodsName);
    $("[name='goodsNo']",context).text("商品编号："+data.goodsId);
    $("[name='price']",context).text("￥"+data.price);
    totalPrice = totalPrice + data.price;
    $("#total").text(++total);
    $("#totalPrice").text("￥"+totalPrice);
    $("#disp_amount").text("￥"+totalPrice);
    $("#payPriceId").text("￥"+totalPrice);
}

function loadGoodsInstList(){
	var params = new Object();
	params.orderId = $('#orderId').val();
    goodsInstList.loadData(params);
}

function submitPay(){
	/*var bankId = $("input[name='RadioGroup1']:checked").val();
	if(bankId == null) {
		alert("请选择银行！");
		return;
	}
	$("#bankId").val(bankId);*/
    $("#form_pay").submit();
    $("#pay_result").show();
    $(".trans_div").show();
}

function loadDepositCard(){
	var tab = $("#deposit_card");
	switchTab(tab);
	$("#card_list").show();
	$("#platform_list").hide();
	$("input[name='RadioGroup1']").attr("checked",false);
}

function loadCreditCard(){
	var tab = $("#credit_card");
	switchTab(tab);
	$("#card_list").show();
	$("#platform_list").hide();
	$("input[name='RadioGroup1']").attr("checked",false);
}

function loadPayPlatform(){
	var tab = $("#pay_platform");
	switchTab(tab);
	$("#card_list").hide();
	$("#platform_list").show();
	$("input[name='RadioGroup1']").attr("checked",false);
}

function switchTab($tab){
	$(".tab .curr").removeClass();
    $tab.addClass("curr");
}

function showOrderList(){
	$("#order_list_div").show();
	$("#open_ct_div").hide();
	$("#close_ct_div").show();
}

function hideOrderList(){
	$("#order_list_div").hide();
	$("#open_ct_div").show();
	$("#close_ct_div").hide();
}