<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="library" content="market"/>
    <title></title>
    <script type="text/javascript" src="<%=path%>/public/core/EasyuiZX.js"></script>
    <script type="text/javascript" src="<%=path%>/market/cart/js/mycart.js"></script>
    <%
        boolean isLogin = (Boolean)request.getAttribute("isLogin");
    %>
</head>
<body>
<jsp:include page="../main/minilogin.jsp" flush="true"></jsp:include>
<div class="header">
<jsp:include page="../main/topnav.jsp" flush="true"/>
    <div class="wrap" style="z-index:1000;">
        <div class="cart_logo" style="cursor: pointer;"></div>
        <div class="progress">
            <ul class="progress-1">
                <li class="step-1"><b></b>1.我的购物车</li>
                <li class="step-2"><b></b>2.填写核对订单信息</li>
                <li class="step-3">3.成功提交订单</li>
            </ul>
        </div>
        <div class="clear"></div>
    </div>
    <div class="menubar">
        <div class="wrap">
            <div class="cart_title"></div>
            <%if(!isLogin){%>
            <div class="cart_now" id="login_tip">现在 <a id="btn_login" href="javascript:void(0);">登录</a> ， 您购物车中的商品将被永久保存 </div>
            <%}%>
        </div>
    </div>
</div>
<div class="contaiter">
    <div class="w cart mt">
        <div class="cart_inner">
            <div class="cart_thead clearfix">
                <div class="column t_checkbox form">
                    <input type="checkbox" value="" checked="" id="chk_selectAll" data-cart="toggle-cb">
                    <label for="chk_selectAll">全选</label>
                </div>
                <div class="column t_goods">商品信息</div>
                <div class="column t_price">单价</div>
                <div class="column t_quantity">数量</div>
                <div class="column t_inventory">小计(元)</div>
                <div class="column t_action">操作</div>
                <div class="clear"></div>
            </div>
            <div class="cart_tbody" id="goodsInst_list">
                <div class="item item_selected" id="row_tpl" style="display: none;">
                    <div class="item_form clearfix">
                        <div class="cell p_checkbox">
                            <input type="checkbox" checked="" value="" price="" name="checkItem" class="checkbox">
                        </div>
                        <div class="cell p_goods">
                            <div class="p_img"><a name="goodsImage" href="#"><img alt="" src=""></a></div>
                            <div class="p_name"><a name="goodsName" href="javascript:void(0)"></a><span class="promise411"></span></div>
                        </div>
                        <div class="cell p_price"><span class="price" name="price">¥0</span></div>
                        <div class="cell p_quantity">
                            <div class="quantity_form">
                                <div class="pro_do_div">
                                    <a href="javascript:void(0)" class="pro_reduc">减少</a>
                                    <input type="text" name="itemNo" valid_type="numOnly" maxlength="2" nullable='false' value="1" />
                                    <a href="javascript:void(0)" class="pro_add">增加</a>
                                </div>
                            </div>
                        </div>
                        <div class="cell p_inventory" name="subtotal">¥0</div>
                        <div class="cell p_remove">
                            <p>
                                <a name="btn_del" href="javascript:void(0)" class="cart-remove">删除</a>
                                <%--<a name="btn_mod" href="javascript:void(0)" class="cart-edit">修改</a>--%>
                            </p>
                        </div>
                    </div>
                    <div class="item_extra">
                        <div class="sku_yanBao newJdService clearfix">
                        </div>
                    </div>
                </div>

            </div>
            <div id="goodsInst_page" style="display: block;" class="turnPageBottom">
            </div>
            <div class="cart_toolbar">
                <div class="control fl">
                    <span class="delete">
                        <a id="deleteSelected" href="javascript:void(0);">删除选中商品</a>
                        <a id="deleteAll" href="javascript:void(0);">清空购物车</a>
                    </span>
                </div>
                <div class="total fr">
                    <p><span class="all">应付总额：</span><span class="price allprice" id="totalPrice">￥0</span></p>
                </div>
                <div class="clear"></div>
                <form id="form_gotopay" action="<%=request.getContextPath()%>/order/confirm" method="POST">
                    <input type="hidden" name="buyingInstIds" value=""/>
                </form>
                <div class="button">
                    <a id="gotoPay" href="javascript:void(0)" class="go_to_settle"><%--去结算--%></a>
                    <a id="goShopping" href="javascript:void(0)" class="go_to_buy"><%--继续购物--%></a>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../main/footer.jsp" flush="true"></jsp:include>
</body>
</html>