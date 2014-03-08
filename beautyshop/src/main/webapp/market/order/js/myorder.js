var showState;
var orderList;
$(function () {
    switchMenu($("#mnu_myorder"));

    orderList = new QryPager({
        $tpl_scope:$("#order_list"),
        $tpl_ele:$("#row_tpl"),
        $pager:$("#order_page"),
        service:"DmCustOrderController",
        method:"selectCustOrderList",
        pageIndex:1,
        pageSize:5,
        record_event:function(data,context){orderRowRender(data,context)}
    });
    var state = commonJs.getUrlParam("state");
    if(state&&state=='processing'){
        loadProcessing();
    }else if(state&&state=='done'){
        loadDone();
    }else{
        loadOrderList();
    }

    $("#showall").on("click",function(event){loadAll(event)});
    $("#showprocessing").on("click",function(event){loadProcessing(event)});
    $("#showdone").on("click",function(event){loadDone(event)});
    $("#showcancel").on("click",function(event){loadCancel(event)});
    $("#time_filter").on("change",function(event){filterOrder(event)});
    $("#search").on("click",function(event){searchOrder(event)});
    $("#cond").on("keydown", function (event) { if (event.keyCode == 13) { $("#search").click(); return false; }});
});


function switchTab($tab) {
    $(".my_order_tab .curr").removeClass();
    $tab.addClass("curr");
    $("#cond").val('');
    $("#time_filter").val('ALL');
}

function searchOrder(event){
    var cond = $("#cond").val().trim();
    var params={};
    if(cond){
        params.orderNo=cond;
    }
    switchTab($("#showall").parent());
    loadOrderList(params);

}
function filterOrder(event){
    var timeFilter = $("#time_filter").val();
    var params={};
    if(timeFilter){
        params.timeFilter=timeFilter;
    }
    if(showState&&showState!=''){
        params.state=showState;
    }
    loadOrderList(params);

}

function loadOrderList(params){
    if(!params){
        params = {}
    }
    orderList.loadData(params);
}

function loadAll(event){
    var tab = $("#showall").parent();
    switchTab(tab);
    showState='';
    loadOrderList();
}

function loadProcessing(){
    var tab = $("#showprocessing").parent();
    switchTab(tab);
    var params={'state':'10E'};
    showState='10E';
    loadOrderList(params);
}

function loadDone(){
    var tab = $("#showdone").parent();
    switchTab(tab);
    var params={'state':'10D'};
    showState='10D';
    loadOrderList(params);
}

function loadCancel(){
    var tab = $("#showcancel").parent();
    switchTab(tab);
    var params={'state':'10C'};
    showState='10C';
    loadOrderList(params);
}

function orderRowRender(data,context){
    $("[name='order_no']",context).text(data.orderNo).on('click',function(){
        window.location.href = commonJs.getWebPath()+"/order/edit?id="+data.orderId;
    });

    $("[name='amount']",context).text('总金额：￥'+data.amount);

    var subOrderList = data.subCustOrderList;
    for (var i in subOrderList){
        var $clone = $("#goods_tpl").clone();
        var subOrder = subOrderList[i];
        Ajax.getAsy().remoteCall("DmGoodsController","getGoodsById",[{"goodsId": subOrder.goodsId}],function(reply){
            var result = reply.getResult();
            if(result){
                $("[name='image_uri']",$clone).attr('src',getMiniImage(result.imageUri));
            }
        });
        $("[name='price']",$clone).text("￥"+subOrder.price);
        $("[name='payment_type']",$clone).text(data.paymentType=='1'?'在线支付':data.paymentType);
        $("[name='create_time']",$clone).text($.format.date(data.createTime,'yyyy-MM-dd HH:mm:ss'));
        var state = data.state;
        var $state = $("[name='state']", $clone);
        if(state=='10A'){
            $state.text('待付款');
        }else if(state=='10B'){
            $state.text('已付款');
        }else if(state=='10C'){
            $state.text('已取消');
        }else if(state=='10D'){
            $state.text('已发货');
        }
        var $btnView = $("[name='btn_view']",$clone);
        var $btnCancel = $("[name='btn_cancel']",$clone);
        var $btnComment = $("[name='btn_comment']",$clone);
        var $btnBuy = $("[name='btn_buy']",$clone);

        $btnView.on('click',function(){
            window.location.href = commonJs.getWebPath()+"/product?id="+subOrder.goodsId;
        });
        $btnCancel.on('click',function(){
            cancelOrder(data.orderId);
        });
        $btnComment.on('click',function(){
            commentOrder(subOrder.goodsId,subOrder.subOrderId);
        });
        $btnBuy.on('click',function(){
            window.location.href = commonJs.getWebPath()+"/product?id="+subOrder.goodsId;
        });

        if(state!='10A'){
            $btnCancel.hide();
        }
        if(state!='10D'){
            $btnComment.hide();
        }

        context.parent().append($clone.show());
    }
}

function cancelOrder(orderId){
    var callback = function(reply){
        if(reply.getResult()) {
            loadAll();
        }
    };
    msg.confirm("提示", "确定取消订单吗？", function(flag) {
        if(flag){
            Ajax.getAsy().remoteCall("DmCustOrderController", "cancelOrder", [orderId], callback);
        }
    });
}

function commentOrder(goodsId,subOrderId){
    window.location.href = commonJs.getWebPath()+"/product?id="+goodsId+"&cmt="+subOrderId;
}

function getMiniImage(uri){
    if(uri&&uri!=''){
        var filePath = uri.substring(0,uri.lastIndexOf("."));
        var subfix = uri.substring(uri.lastIndexOf("."));
        return commonJs.getWebPath()+filePath+"_mini"+subfix;
    }
}