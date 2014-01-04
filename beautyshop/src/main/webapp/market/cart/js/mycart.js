var goodsInstList;
var orderId = 1;
var totalPrice = 0;

$(function(){
    goodsInstList = new QryPager({
        $tpl_scope:$("#goodsInst_list"),
        $tpl_ele:$("#row_tpl"),
        $pager:$("#goodsInst_page"),
        service:"DmShoppingCartController",
        method:"getCartGoodsList",
        pageIndex:1,
        pageSize:5,
        record_event:function(data,context){goodsInstRowRender(data,context)}
    });

    loadGoodsInstList();

    $("#chk_selectAll").on('click',function(){
        if(this.checked){
            selectAll();
        }else{
            disSelectAll();
        }
    });

    $("#deleteSelected").on('click',function(){
        var selected = getSelectedItem();
        if(selected.length>0){
            msg.confirm("提示", "确定要删除购物车中选中的商品吗？", function(flag) {
                if(flag){
                    Ajax.getAsy().remoteCall("DmShoppingCartController", "deleteGoodsInstFromCart", [selected], function(){
                        loadGoodsInstList();
                    });
                }
            });
        }
    });

    $("#deleteAll").on('click',function(){
        var records = $("input:visible[name='checkItem']");
            msg.confirm("提示", "确定要删除购物车中所有商品吗？", function(flag) {
                if(flag){
        if(records>0){
                    Ajax.getAsy().remoteCall("DmShoppingCartController", "deleteAllGoodsInstFromCart", [], function(){
                        loadGoodsInstList();
                    });
                }
        }
            });
    });

    $("#gotoPay").on('click',function(){
        var selected = getSelectedItem();
        if(selected.length>0){
//            $("input[name='buyingInstIds']").val(selected);
            Ajax.getAsy().remoteCall("DmShoppingCartController", "addBuyingGoods", [selected], function(reply){
                if(reply.getResult()){
                    $("#form_gotopay").submit();
                }
            });
        }else{
            alert("请选择需要支付的商品！");
        }
    });

    $("#goShopping").on('click',function(){
        window.location.href = commonJs.getWebPath()+"/welcome";
    });

    $("#btn_login").on('click',function(){
        openLoginDialog();
    });
    $(".cart_logo").click(function() {
        location = commonJs.getWebPath() + "/welcome";
    });
});

function loadGoodsInstList(params){
    if(!params){
        params = {'orderId':orderId};
    }
    totalPrice = 0;
    goodsInstList.loadData(params);
}

function goodsInstRowRender(data,context){
    $("[name='checkItem']",context).val(data.instId);
    $("[name='checkItem']",context).attr("price",data.dmGoodsPlan.planPrice);
    $("[name='goodsName']",context).text(data.goodsName).on('click',function(){
        window.location.href = commonJs.getWebPath()+"/product?id="+data.goodsId;
    });;
    $("[name='price']",context).text("￥"+data.dmGoodsPlan.planPrice);
    $("[name='btn_del']",context).on('click',function(){
        Ajax.getAsy().remoteCall("DmShoppingCartController", "deleteGoodsInstFromCart", [[data.instId]], function(){
            loadGoodsInstList();
        });
    });
    totalPrice = accAdd(totalPrice,data.dmGoodsPlan.planPrice);
    $("#totalPrice").text("￥"+totalPrice);

    $("[name='checkItem']",context).on('click',function(event){
        var price = $(this).attr('price');
        if(this.checked){
            totalPrice = accAdd(totalPrice,$(this).attr('price'));
        }else{
            totalPrice = subtr(totalPrice,$(this).attr('price'));
        }
        $("#totalPrice").text("￥"+totalPrice);
    });
}

function selectAll(){
    $("input:visible[name='checkItem']").each(function(){
        if(!this.checked){
            this.checked = true;
            totalPrice = accAdd(totalPrice,$(this).attr('price'));
        }
    });
    $("#totalPrice").text("￥"+totalPrice);
}
function disSelectAll(){
    $("input:visible[name='checkItem']").each(function(){
        if(this.checked){
            this.checked = false;
            totalPrice = subtr(totalPrice,$(this).attr('price'));
        }
    });
    $("#totalPrice").text("￥"+totalPrice);
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