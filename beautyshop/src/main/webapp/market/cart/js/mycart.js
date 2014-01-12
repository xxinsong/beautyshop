var goodsInstList;
var orderId = 1;
var totalPrice = 0;

$(function () {
    goodsInstList = new QryPager({
        $tpl_scope: $("#goodsInst_list"),
        $tpl_ele: $("#row_tpl"),
        $pager: $("#goodsInst_page"),
        service: "DmShoppingCartController",
        method: "getCartGoodsList",
        pageIndex: 1,
        pageSize: 5,
        record_event: function (data, context) {
            goodsInstRowRender(data, context)
        }
    });

    loadGoodsInstList();

    $("#chk_selectAll").on('click', function () {
        if (this.checked) {
            selectAll();
        } else {
            disSelectAll();
        }
    });

    $("#deleteSelected").on('click', function () {
        var selected = getSelectedItem();
        if (selected.length > 0) {
            msg.confirm("提示", "确定要删除购物车中选中的商品吗？", function (flag) {
                if (flag) {
                    Ajax.getAsy().remoteCall("DmShoppingCartController", "removeGoodsFromCart", [selected], function () {
                        loadGoodsInstList();
                    });
                }
            });
        }
    });

    $("#deleteAll").on('click', function () {
        var records = $("input:visible[name='checkItem']");
        msg.confirm("提示", "确定要删除购物车中所有商品吗？", function (flag) {
            if (flag) {
                if (records.length > 0) {
                    Ajax.getAsy().remoteCall("DmShoppingCartController", "removeAllGoodsFromCart", [], function () {
                        loadGoodsInstList();
                    });
                }
            }
        });
    });

    $("#gotoPay").on('click', function () {
        var selected = getSelectedItem();
        if (selected.length > 0) {
//            $("input[name='buyingInstIds']").val(selected);
            Ajax.getAsy().remoteCall("DmShoppingCartController", "addBuyingGoods", [selected], function (reply) {
                if (reply.getResult()) {
                    $("#form_gotopay").submit();
                }
            });
        } else {
            alert("请选择需要支付的商品！");
        }
    });

    $("#goShopping").on('click', function () {
        window.location.href = commonJs.getWebPath() + "/welcome";
    });

    $("#btn_login").on('click', function () {
        openLoginDialog();
    });
    $(".cart_logo").click(function () {
        location = commonJs.getWebPath() + "/welcome";
    });
});

function loadGoodsInstList(params) {
    if (!params) {
        params = {'orderId': orderId};
    }
    totalPrice = 0;
    goodsInstList.loadData(params);
    loadTotalPrice();
}


function goodsInstRowRender(data, context) {
    $("[name='checkItem']", context).val(data.goodsId);
    $("[name='checkItem']", context).attr("amount", data.amount);
    $("[name='goodsName']", context).text(data.goodsName).on('click', function () {
        window.location.href = commonJs.getWebPath() + "/product?id=" + data.goodsId;
    });
    ;
    $("[name='price']", context).text("￥" + data.price);
    $("[name='itemNo']", context).val(data.itemNo);
    $("[name='subtotal']", context).text("￥" + data.amount);
    $("[name='btn_del']", context).on('click', function () {
        Ajax.getAsy().remoteCall("DmShoppingCartController", "removeGoodsFromCart", [
            [data.goodsId]
        ], function () {
            loadGoodsInstList();
        });
    });
    /*totalPrice = accAdd(totalPrice, data.amount);
    $("#totalPrice").text("￥" + totalPrice);*/

    $("[name='checkItem']", context).on('click', function (event) {
        var amount = $(this).attr('amount');
        if (this.checked) {
            totalPrice = accAdd(totalPrice,amount);
        } else {
            totalPrice = subtr(totalPrice, amount);
        }
        $("#totalPrice").text("￥" + totalPrice);
    });

    $(".pro_reduc", context).on('click', function () {

        if (commonJs.validate($(".pro_do_div", context))) {
            var $itemNo = $("[name='itemNo']", context);
            var itemNo = $itemNo.val();
            itemNo = itemNo - 1;
            if(itemNo<=0){
                showRed($itemNo);
                $itemNo.focus();
                $itemNo.val(1);
                return;
            }
            $itemNo.val(itemNo);

            editGoodsItemNo(data, itemNo);
        }
    });

    $(".pro_add", context).on('click', function () {
        var $itemNo = $("[name='itemNo']", context);
        if (commonJs.validate($(".pro_do_div", context))) {
            var itemNo = $itemNo.val();
            itemNo = accAdd(itemNo, 1);
            $itemNo.val(itemNo);
            editGoodsItemNo(data, itemNo);
        }
    });

    $("[name='itemNo']", context).on('keydown',function (event) {
        if (event.keyCode == 13) {
            var $itemNo = $(this);
            if (commonJs.validate($(".pro_do_div", context))) {
                var itemNo = $itemNo.val();
                if(itemNo<=0){
                    showRed($itemNo);
                    $itemNo.focus();
                    $itemNo.val(1);
                    return;
                }
                editGoodsItemNo(data, itemNo);
            }
        }
    }).on('blur', function () {
            var $itemNo = $(this);
            if (commonJs.validate($(".pro_do_div", context))) {
                var itemNo = $itemNo.val();
                if(itemNo<=0){
                    showRed($itemNo);
                    $itemNo.focus();
                    $itemNo.val(1);
                    return;
                }
                editGoodsItemNo(data, itemNo);
            }
        });
}

function selectAll() {
    $("input:visible[name='checkItem']").each(function () {
        if (!this.checked) {
            this.checked = true;
            totalPrice = accAdd(totalPrice, $(this).attr('amount'));
        }
    });
    $("#totalPrice").text("￥" + totalPrice);
}
function disSelectAll() {
    $("input:visible[name='checkItem']").each(function () {
        if (this.checked) {
            this.checked = false;
            totalPrice = subtr(totalPrice, $(this).attr('amount'));
        }
    });
    $("#totalPrice").text("￥" + totalPrice);
}


function getSelectedItem() {
    var selected = [];
    $("input:visible[name='checkItem']").each(function () {
        if (this.checked) {
            selected.push($(this).val());
        }
    });
    return selected;
}

function editGoodsItemNo(data, itemNo) {
    /*Ajax.getAsy().remoteCall("DmShoppingCartController", "setItemNo", [
     [data.goodsId],
     itemNo
     ], function () {
     loadGoodsInstList();
     });*/
    $.ajax({
        type: 'PUT',
        url:commonJs.getWebPath()+"/mycart/edit/"+data.goodsId+":"+itemNo,
        success:loadGoodsInstList
    });
}

function loadTotalPrice(){
    /*var url = '';
    if(mode == "CREATE"){
        url = commonJs.getWebPath()+"/mycart/calc/";
    }else{
        url = commonJs.getWebPath()+"/order/"+orderId+"/calc";
    }*/
    $.ajax({
        url:commonJs.getWebPath()+"/mycart/calc/",
        method:'GET',
        success:function(data){
            totalPrice =  data.totalPrice;
//            total = data.totalCount;
//            $("#total").text(total);
            $("#totalPrice").text("￥"+totalPrice);
//            $("#disp_amount").text("￥"+totalPrice);
//            $("#payPriceId").text("￥"+totalPrice);
        }
    })
}