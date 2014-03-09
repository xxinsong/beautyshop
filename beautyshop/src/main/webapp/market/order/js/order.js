var goodsInstList;
var orderId;
var total=0;
var totalPrice = 0;
var cashBack = 0.00;
var state = "OK";
$(function(){
    $.cxSelect.defaults.url=commonJs.getWebPath()+"/public/jquery/city.min.js";
    $("#selectaddress").cxSelect({
        selects:["province","city","area"]
    });
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


    $("#btnAddContact").on('click',function(){
        showContactEditContent();
    });
    $(".pop_close", "#editAddressDiv").click(function() {
        closeEditAddressDiv();
    });
    $("#btnSubmitAddress").on('click',function(){
        submitAddress();
    });
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

    $(".cart_logo").click(function() {
        location = commonJs.getWebPath() + "/welcome";
    });
});

function goodsInstRowRender(data,context){
    $("[name='goodsImage']",context).on('click',function(){
        window.location.href = commonJs.getWebPath()+"/product?id="+data.goodsId;
    });
    $("[name='goodsImageUrl']",context).attr('src',data.goodsImage);
    $("[name='goodsName']",context).text(data.goodsName).on('click',function(){
        window.location.href = commonJs.getWebPath()+"/product?id="+data.goodsId;
    });
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
function showContactEditContent(){
    openOverlay();
    var top = document.documentElement.clientHeight - $("#editAddressDiv").height();
    $("#editAddressDiv").css( {
        "top" :  top / 4 + document.documentElement.scrollTop
    }).show();
//    $("#contact_div").addClass('step_current');
//    $("#old_invoice").click();
//    $("#defaultInvoice").html($("#invoiceContentDisplay").html());
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
    var contactInfo = $("input[name='address']:checked").val();
    if(contactInfo && contactInfo!=''){
        $("#contactInfo").val(contactInfo);
    }else{
        msg.alert("提示", "请选择收货人信息！");
        return;
    }
    $("#form_order").submit();
}

/*function loadContactInfo(){
    $.ajax({
        method:'GET',
        url:commonJs.getWebPath()+"/setting/address/default",
        success:function(data){
            var html=[];
            html.push("<b>"+data.contactPerson+"</b>");
            html.push(data.mobilePhone);
            var fullAddress = data.province + data.city + data.district + data.address;
            html.push(fullAddress);
            html.push(data.zipCode);
            $("#contact_info").html(html.join("&nbsp;&nbsp;"));
        }
    });

}*/

function loadContactInfo(){
    var contactInfo = $("form input[name='contactInfo']").val();
    $.ajax({
        method:'GET',
        url:commonJs.getWebPath()+"/setting/address/list",
        success:function(data){
            $("#contact_list_div").html("");
            for(var i=0;i<data.length;i++){
            var html=[];
                var fullAddress = data[i].province + data[i].city + data[i].district + data[i].address;
                html.push("<input type='radio' name='address' value='"+data[i].id+"' id='address"+i+"' "+(contactInfo==data[i].id||i==0?"checked='true'":" ")+"/>");
                html.push("<label for='address"+i+"'>");
                html.push("<b>"+data[i].contactPerson+"</b>");
                html.push(data[i].mobilePhone);
                html.push(fullAddress);
                html.push(data[i].zipCode);
                html.push("</label>");
                html.push("<br/>");
                $("#contact_list_div").append(html.join("&nbsp;&nbsp;"));
//                $("#address"+i).on('click',function(){checkContactAddress(data[i].contactPerson,fullAddress,data[i].zipCode)});
            }
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
function getMiniImage(uri){
    if(uri&&uri!=''){
        var filePath = uri.substring(0,uri.lastIndexOf("."));
        var subfix = uri.substring(uri.lastIndexOf("."));
        return commonJs.getWebPath()+filePath+"_mini"+subfix;
    }
}

function openOverlay() {
    if ($(".trans_div").size() == 0) {
        $("body").append("<div class='trans_div' style='display: none;'></div>");
    }
    $(".trans_div").show();
}

function closeOverlay() {
    $(".trans_div").hide();
}
function submitAddress(){
    if (!commonJs.validate($("#editAddressDiv"))) {
        return;
    }
    var params = commonJs.getData($("#editAddressDiv"));
    var url = commonJs.getWebPath()+"/setting/address/add";
    if(params.id!=""){
        url = commonJs.getWebPath()+"/setting/address/edit/"+params.id;
    }
    $.ajax({
        method:'POST',
        url:url,
        data:params,
        success:function(){
            closeEditAddressDiv();
            loadContactInfo();
        }
    });
}
function closeEditAddressDiv(){
    $("#editAddressDiv").hide();
    closeOverlay();
    commonJs.clear($("#editAddressDiv"));
}