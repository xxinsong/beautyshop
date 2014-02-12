var addressList;
var rows = 0;
$(function(){
    $.cxSelect.defaults.url=commonJs.getWebPath()+"/public/jquery/city.min.js";
    $("#selectaddress").cxSelect({
        selects:["province","city","area"]
    });

    switchMenu($("#mnu_myaddress"));

    addressList = new QryPager({
        $tpl_scope:$("#address_list"),
        $tpl_ele:$("#row_tpl"),
        $pager:$("#address_page"),
        service:"DmAddressController",
        method:"selectAddressList",
        pageIndex:1,
        pageSize:5,
        record_event:function(data,context){addressRowRender(data,context)}
    });

    loadAddressList();

    $("#btn_add").on('click',function(){
        openEditAddressDiv();
    });

    $(".pop_close", "#editAddressDiv").click(function() {
        closeEditAddressDiv();
    });

    $("#btn_submit").on('click',function(){
        submitAddress();
    });
});

function loadAddressList(params){
    if(!params){
        params = {}
    }
    rows = 0;
    addressList.loadData(params);
}

function addressRowRender(data,context){
    rows++;
    $("[name='contact_person']",context).text(data.contactPerson);
    $("[name='mobile_phone']",context).text(data.mobilePhone);
    $("[name='full_address']",context).text(data.province+data.city+data.district+data.address);
    $("[name='zip_code']",context).text(data.zipCode);
    if(data.isDefault=='1'){
        $("[name='is_default']",context).attr("checked",true);
    }else{
        $("[name='is_default']",context).attr("checked",false);
    }

    $("[name='is_default']",context).on('click',function(){
        setDefaultAddress(data.id,data.isDefault);
    });

    var $btn_del = $("[name='btn_del']",context);
    var $btn_mod = $("[name='btn_mod']",context);

    $btn_del.on('click',function(){
        if(rows <=1){
            msg.alert("提示","只有一条记录，不允许删除！");
            return;
        }
        msg.confirm("确认","确定要删除这条记录吗？",function(result){
            if(result){
                $.ajax({
                    method:'DELETE',
                    url:commonJs.getWebPath()+"/setting/address/"+data.id+":"+data.isDefault,
                    success:function(){
                        loadAddressList();
                    }
                });
            }
        });
    });
    $btn_mod.on('click',function(){
        openEditAddressDiv();
        $.ajax({
            method:'GET',
            url:commonJs.getWebPath()+"/setting/address/"+data.id,
            success:function(data){
                $("[name='id']").val(data.id);
                $("[name='contactPerson']").val(data.contactPerson);
                $("[name='mobilePhone']").val(data.mobilePhone);
                $("[name='province']").val(data.province).change();
                $("[name='city']").val(data.city).change();
                $("[name='district']").val(data.district);
                $("[name='address']").val(data.address);
                $("[name='zipCode']").val(data.zipCode);
            }
        });
    });

}

function setDefaultAddress(addressId,oriValue){
    if(oriValue!="1"){
        $.ajax({
            method:'PUT',
            url:commonJs.getWebPath()+"/setting/address/default:"+addressId,
            success:function(){
                loadAddressList();
            }
        });
    }
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
            loadAddressList();
        }
    });
}

function openEditAddressDiv(){
    openOverlay();
    var top = document.documentElement.clientHeight - $("#editAddressDiv").height();
    $("#editAddressDiv").css( {
        "top" :  top / 4 + document.documentElement.scrollTop
    }).show();
}
function closeEditAddressDiv(){
    $("#editAddressDiv").hide();
    closeOverlay();
    commonJs.clear($("#editAddressDiv"));
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
