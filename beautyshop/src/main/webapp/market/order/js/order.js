var goodsInstList;
var orderId;
var total=0;
var totalPrice = 0;
var cashBack = 0.00;
var state = "OK";
$(function(){
    orderId = $("input[name='orderId']").val();

    goodsInstList = new QryPager({
        $tpl_scope:$("#goodsInst_list"),
        $tpl_ele:$("#row_tpl"),
        $pager:$("#goodsInst_page"),
        service:"DmShoppingCartController",
        method:"getBuyingGoodsList",
        pageIndex:1,
        pageSize:5,
        record_event:function(data,context){goodsInstRowRender(data,context)}
    });

    loadContactInfo();
    loadInvoiceInfo();
    loadGoodsInstList();


    $("#btnEditInvoice").on('click',function(){
        showInvoiceEditContent();
        state = "EDIT";
    });
    $("#btnSaveInvoice").on('click',function(){
        saveInvoiceContent();
        state = "OK";
    });
    $("#disp_invoiceNotes").on('blur',function(){
        validateInvoiceNotes();
    });
    $("#btn_submit").on('click',function(){
       submitOrder();
    });
    $("#goShoppingCart").on('click',function(){
       window.location.href=commonJs.getWebPath()+"/mycart";
    });
    if(mode != "CREATE"){
        $("#goShoppingCart").hide();
    }
});

function goodsInstRowRender(data,context){
    $("[name='goodsName']",context).text(data.goodsName);
    $("[name='goodsNo']",context).text("商品编号："+data.goodsNo);
    $("[name='price']",context).text("￥"+data.price);
    $("[name='itemNo']",context).text("x "+data.itemNo);
    $("[name='amount']",context).text("￥"+data.amount);
    /*totalPrice =  accAdd(totalPrice,data.amount);
    total = accAdd(total,data.goodsItemNo);
    $("#total").text(total);
    $("#totalPrice").text("￥"+totalPrice);
    $("#disp_amount").text("￥"+totalPrice);
    $("#payPriceId").text("￥"+totalPrice);*/
}

function loadTotalPrice(){
    var url = '';
    if(mode == "CREATE"){
        url = commonJs.getWebPath()+"/mycart/calc/";
    }else{
        url = commonJs.getWebPath()+"/order/"+orderId+"/calc";
    }
    $.ajax({
        url:url,
        method:'GET',
        success:function(data){
            totalPrice =  data.totalPrice;
            total = data.totalCount;
            $("#total").text(total);
            $("#totalPrice").text("￥"+totalPrice);
            $("#disp_amount").text("￥"+totalPrice);
            $("#payPriceId").text("￥"+totalPrice);
        }
    })
}

function loadGoodsInstList(params){
    if(!params){
        params = {'orderId':orderId};
    }
    if(mode == "CREATE"){
        goodsInstList.service = "DmShoppingCartController";
    }else if(mode == "EDIT"){
        goodsInstList.service = "DmCustOrderController";
    }
    goodsInstList.loadData(params);
    loadTotalPrice();
}
function showInvoiceEditContent(){
    $("#invoice_view").hide();
    $("#invoice_edit").show();
    $("#invoice_div").addClass('step_current');
    $("#old_invoice").click();
    $("#defaultInvoice").html($("#invoiceContentDisplay").html());
}
function saveInvoiceContent(){
    if($("[name='invoice']:checked").val()=="new"){

        var invoiceType = $("input[name='disp_invoiceType']:checked").val();
        var invoiceTitle = $("input[name='invoiceTitle']:checked").val();
        var invoiceNotes;
        var invoiceDetail = $("input[name='invoiceContent']:checked").val();

        if(invoiceTitle=='1'){
            invoiceNotes = "个人";
        }else{
            invoiceNotes = $("#disp_invoiceNotes").val();
        }

        if(!validateInvoiceNotes()){
            $("#disp_invoiceNotes").focus();
            return ;
        }

        $("form input[name='invoiceType']").val(invoiceType);
        $("form input[name='invoiceNotes']").val(invoiceNotes);
        $("form input[name='invoiceDetail']").val(invoiceDetail);

        var displayName = (invoiceType==1?'普通发票':'增值发票')+"&nbsp;&nbsp;"+invoiceNotes+"&nbsp;&nbsp;"+invoiceDetail;
        $("#invoiceContentDisplay").html(displayName);

    }

    $("#invoice_view").show();
    $("#invoice_edit").hide();
    $("#invoice_div").removeClass('step_current');
}

function useDefaultInvoice(){
    $("#useOldInvoice").addClass('item_selected');
    $("#useNewInvoice").removeClass('item_selected');
}

function useNewInvoice(){
    $("#useNewInvoice").addClass('item_selected');
    $("#useOldInvoice").removeClass('item_selected');
}

function validateInvoiceNotes(){
    var invoiceTitle = $("input[name='invoiceTitle']:checked").val();
    var invoiceNotes = $.trim($("#disp_invoiceNotes").val());
    if(invoiceTitle=='2' && invoiceNotes == ''){
        $("#disp_invoiceNotes_hint").html('');
        $("#disp_invoiceNotes_hint").append("<i class='wrongico'></i>不能为空！");
        return false;
    }else{
        $("#disp_invoiceNotes_hint").html('');
        return true;
    }
}

function submitOrder(){
    if(state!='OK'){
        $("#btnSaveInvoice").focus();
        return;
    }
    $("#amount").val(totalPrice);
    $("#form_order").submit();
}

function loadContactInfo(){
    Ajax.getAsy().remoteCall("DmShoppingCartController","loadContactInfo",[],function(reply){
        var result = reply.getResult();
        if(result){
            var html=[];
            html.push("<b>"+result.contactName+"</b>");
            html.push(result.contactPhone);
            var fullAddress = result.provinceName + result.cityName + result.districtName + result.address;
            html.push(fullAddress);
            $("#contact_info").html(html.join("&nbsp;&nbsp;"));
        }
    });
}

function loadInvoiceInfo(){
    var invoiceType = $("form input[name='invoiceType']").val();
    var invoiceNotes = $("form input[name='invoiceNotes']").val();
    var invoiceDetail = $("form input[name='invoiceDetail']").val();

    var displayName = (invoiceType==1?'普通发票':'增值发票')+"&nbsp;&nbsp;"+invoiceNotes+"&nbsp;&nbsp;"+invoiceDetail;

    $("#invoiceContentDisplay").html(displayName);
    $("#defaultInvoice").html(displayName);

    if(mode == "VIEW"){
        $("#btnEditInvoice").hide();
        $("#btn_submit").hide();
    }else{
        $("#btnEditInvoice").show();
        $("#btn_submit").show();
    }
}