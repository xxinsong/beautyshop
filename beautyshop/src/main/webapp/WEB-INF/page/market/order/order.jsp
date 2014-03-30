
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="library" content="market"/>
    <title>深圳市韩塑美生物医学科技有限公司是一家化妆品面膜垂直电商为一体的分享平台互联网公司</title>
    <script type="text/javascript" src="<%=path%>/public/core/EasyuiZX.js"></script>
    <script type="text/javascript" src="<%=path%>/market/order/js/order.js"></script>
    <script type="text/javascript" src="<%=path%>/public/jquery/jquery.cxselect.min.js"></script>
</head>
<body>
<script>
    var mode = "<%=request.getAttribute("mode")%>";
</script>
<div class="header">
    <jsp:include page="../main/topnav.jsp" flush="true"/>
    <div class="wrap" style="z-index:1000;">
        <div class="cart_logo"></div>
        <div class="progress">
            <ul class="progress-2">
                <li class="step-1"><b></b>1.我的购物车</li>
                <li class="step-2"><b></b>2.填写核对订单信息</li>
                <li class="step-3">3.成功提交订单</li>
            </ul>
        </div>
        <div class="clear"></div>
    </div>
    <div class="menubar">
        <div class="wrap">
            <div class="order_title"></div>
        </div>
    </div>
</div>
<div class="contaiter">
<div class="w m2 mt">
<div class="checkout">
<div class="order_msg">
    订单号：<a id="order_no" href="javascript:void(0)">${orderNo}</a>
</div>
<div class="checkout_steps">
<div class="steps step_complete" style="display:block;">
    <div class="step_title">
        <div class="step_right"></div>
        <strong>收货人信息</strong>
        <span class="step_action" style="display: inline;">
            <a id="btnAddContact" style="color:#005EA7;">[添加新地址]</a>
        </span>
    </div>
    <div class="step_content" id="contact_view" style="display: none;">
        <div class="sbox_wrap consignee">
            <div class="sbox">
                <div class="form">
                    <div class="consignee_list">
                        <div class="item">
                            <label id="contact_info">

                            </label>
                        </div>
                        <%--<div style="display:block" class="invoice_note">备注：此账户订单的发票将邮寄到该地址。</div>--%>

                    </div>

                </div>
            </div>
        </div>
    </div>
    <div class="step_content" id="contact_edit">
        <div class="part_invoice sbox_wrap">
            <div class="sbox" id="contact_list_div">

            </div>
        </div>
    </div>
</div>
<div class="steps step_complete">
    <div class="step_content">
        <div class="sbox_wrap payment_ship">
            <div class="payment">
                <h3>支付方式</h3>

                <div style="padding-bottom:10px"></div>
                <div class="mc form">
                    <!-- 在线支付 -->
                    <div class="item">
                        <div class="label">
                            <input type="radio" value="1" class="hookbox" id="pay-method-4" payid="1" payname="在线支付"
                                   name="payment" checked="checked">
                            <label for="pay-method-4">在线支付</label>
                        </div>
                        <div class="field">
                            <span class="tip">由第三方担保交易。</span>
                        </div>
                        <span class="clr"></span>
                    </div>
                    <div class="item">
                        <div class="label">
                            <input type="radio" value="2" class="hookbox" id="pay-method-5" payid="2" payname="货到付款"
                                   name="payment"><label for="pay-method-5">货到付款</label>
                        </div>
                        <div class="field">
                            <span class="tip">送货上门之后，验货付款。</span>
                        </div>
                        <span class="clr"></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="invoice_div" class="steps step_complete">
    <div class="step_title">
        <div class="step_right"></div>
        <strong>发票信息</strong>
        <span class="step-action" style="display: inline;">
            <a id="btnEditInvoice" style="color:#005EA7;" href="javascript:void(0)">[修改]</a>
        </span>
    </div>
    <div class="step_content" id="invoice_view">
        <div class="sbox_wrap" id="part_invoice">
            <div class="sbox">
                <div class="invoice">
                    <div class="invoice_content" id="invoiceContentDisplay">
                        普通发票 &nbsp; 个人
                        &nbsp; 明细
                        &nbsp;
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="step_content" id="invoice_edit" style="display: none;">
        <div class="part_invoice sbox_wrap">
            <div class="sbox">
                <div class="step_stitle"><strong>类型和抬头</strong></div>
                <div class="form">
                    <div class="invoice_form">
                        <div class="item item_selected" id="useOldInvoice">
                            <input type="radio" checked onclick="useDefaultInvoice();" id="old_invoice" name="invoice" value="old" class="hookbox">
                            <label for="old_invoice" id="defaultInvoice">个人&nbsp;&nbsp;普通发票</label>
                        </div>
                        <div class="item " id="useNewInvoice">
                            <input type="radio" onclick="useNewInvoice();" id="new_invoice" name="invoice" value="new" class="hookbox">
                            <label for="new_invoice">使用新的发票信息</label>
                        </div>
                        <div style="padding-bottom:0px;" class="list clearfix">
                            <span class="label">发票类型：</span>

                            <div class="field">
                                <ul class="hookbox_list group">
                                    <li>
                                        <input type="radio" checked="" class="hookbox" name="disp_invoiceType" value="1">
                                        <label>普通发票</label>&nbsp;&nbsp;&nbsp;
                                    </li>
                                    <li>
                                        <input type="radio" class="hookbox" name="disp_invoiceType" value="2">
                                        <label>增值税发票</label>&nbsp;&nbsp;&nbsp;
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div id="normal_form">
                            <div id="invoice_title" class="list">
                                <span class="label">发票抬头：</span>

                                <div class="field">
                                    <ul id="invoice_title_radio" class="hookbox_list group">
                                        <li>
                                            <input type="radio" checked="" value="1" class="hookbox"
                                                   name="invoiceTitle" id="invoiceTitle_1" onclick="validateInvoiceNotes();">
                                            <label for="invoiceTitle_1">个人</label>
                                        </li>
                                        <li>
                                            <input type="radio" value="2" class="hookbox" name="invoiceTitle" id="invoiceTitle_2">
                                            <label for="invoiceTitle_2">单位</label>
                                        </li>
                                        <li>
                                            <input type="text" style="display:block" class="company_textbox textbox" value="" id="disp_invoiceNotes"/>
                                            <span id="disp_invoiceNotes_hint" class="explain"></span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div style="padding-top:20px;" class="list">
                                <div class="step_stitle"><strong>发票内容</strong></div>
                                <span class="label">发票内容：</span>

                                <div class="field">
                                    <div class="invoice_group">
                                        <ul class="hookbox_list group">
                                            <li>
                                                <input type="radio" checked="" value="明细" class="hookbox" name="invoiceContent"
                                                       id="invoiceContent_1">
                                                <label for="invoiceContent_1">明细</label>
                                            </li>
                                            <li>
                                                <input type="radio" value="办公用品" class="hookbox" name="invoiceContent"
                                                       id="invoiceContent_2">
                                                <label for="invoiceContent_2">办公用品</label>
                                            </li>
                                            <li>
                                                <input type="radio" value="耗材" class="hookbox" name="invoiceContent"
                                                       id="invoiceContent_3">
                                                <label for="invoiceContent_3">耗材</label>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="invoice_group">
                                        <ul class="hookbox_list group"></ul>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="form_btn group">
                        <a id="btnSaveInvoice" href="javascript:void(0)" class="btn_submit">
                            <span>保存发票信息</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="steps step_complete">
    <div class="step_title"><a id="goShoppingCart" class="return_edit" href="javascript:void(0);">返回修改购物车</a><strong>商品清单</strong></div>
    <div class="step_content">
        <div class="sbox_wrap">
            <div class="sbox">
                <div class="order_cart">
                    <div class="order_review">
                        <span id="span-skulist">
                            <table class="review_thead">
                                <tbody>
                                <tr>
                                    <td class="fore1">商品</td>
                                    <td class="fore3">价格</td>
                                    <td class="fore4">数量</td>
                                    <td class="fore4">总价</td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="review_body" id="goodsInst_list">
                                <div class="review_tbody" id="row_tpl" style="display: none;">
                                    <table class="order_table">
                                        <tr>
                                            <td class="fore1">
                                                <div class="p_goods">
                                                    <div class="p_img"><a name="goodsImage" target="_blank" href="javascript:void(0)"><img
                                                            name="goodsImageUrl" src="" alt=""></a></div>
                                                    <div class="p_detail">
                                                        <div class="p_name">
                                                            <a name="goodsName" target="_blank" href="javascript:void(0)">
                                                                <%--金士顿（Kingston）8G Class4 TF（micro SD）存储卡--%>
                                                            </a>
                                                        </div>
                                                        <div name="goodsNo" class="p_more">
                                                            <%--商品编号：136363--%>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%--<!--- 赠品和附件显示 --->
                                                <div class="p_extra">[赠品]&nbsp;川宇（kawau）蝴蝶Micro SD/T-Flash
                                                    读卡器（颜色随机） ×1
                                                </div>--%>
                                            </td>
                                            <td name="price" class="p_promotion" style="padding-right: 0px;">￥39.90</td>
                                            <td name="itemNo" class="fore2">x 1</td>
                                            <td name="amount" skuid="136363" class="fore2 p_inventory">总价</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </span>
                        <div id="goodsInst_page" style="display: block;" class="turnPageBottom">
                        </div>
                        <div class="clear"></div>
                        <div class="order_summary">
                            <div class="statistic fr">
                                <div class="list">
                                    <span><em id="total">0</em> 件商品&nbsp;&nbsp;&nbsp;&nbsp;合计：</span>
                                    <em v="59.90" id="totalPrice" class="price">￥0.00</em>
                                </div>
                                <div class="list">
                                    <span>运费：</span>
                                    <em v="0.00" id="freight" class="price"> ￥0.00</em>
                                </div>
                                <div class="list"><span>应付：</span><em id="disp_amount" class="price"> ￥0.00</em></div>
                            </div>
                            <div class="span clr"></div>
                        </div>
                    </div>
                </div>
            </div>
            <span class="clr"></span>
        </div>
        <form id="form_order" action="<%=request.getContextPath()%>/order/submit" method="POST">
            <input type="hidden" name="mode" value="${mode}"/>
            <input type="hidden" name="orderId" value="${orderId}"/>
            <input type="hidden" name="orderNo" value="${orderNo}"/>
            <input type="hidden" id="amount" name="amount" value="${amount}"/>
            <input type="hidden" id="paymentType" name="paymentType" value="${paymentType}"/>
            <input type="hidden" name="invoiceType" value="${invoiceType}"/>
            <input type="hidden" name="invoiceNotes" value="${invoiceNotes}"/>
            <input type="hidden" name="invoiceDetail" value="${invoiceDetail}"/>
            <input type="hidden" id="contactInfo" name="contactInfo" value="${contactInfo}"/>
            <input type="hidden" name="token" value="${token}"/>
        </form>
        <div class="checkout_buttons group">
            <div class="sticky_wrap">
                <div class="inner">
                    <span class="total">应付总额：<strong id="payPriceId">￥0.0</strong></span>
                    <a id="btn_submit" href="javascript:void(0)" class="submit_order">提交订单</a>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>
</div>
</div>

<div class="trans_div" style="display: none;"></div>
<div class="login_pop" style="width:508px;display: none;" id="editAddressDiv">
    <h2>新增地址<a href="javascript: void(0)" class="pop_close">关闭</a></h2>

    <div class="login_pop_table">
        <table width="60%" border="0" cellspacing="0" cellpadding="0" class="form_table" style="margin: 0px auto;">
            <tr>
                <th style="width: 50px;">收货人：</th>
                <td><input type="text" name="contactPerson" value="" class="ui_ipt bold" style="width: 200px;"
                           nullable="false" max_length="40"/></td>
            </tr>
            <tr>
                <th style="width: 50px;">电话：</th>
                <td><input type="text" name="mobilePhone" value=""  class="ui_ipt bold" style="width: 200px;"
                           nullable="false" max_length="11" valid_type="mobile"/></td>
            </tr>
            <tr>
                <th style="width: 50px;">地址：</th>
                <td id="selectaddress">
                    <select name="province" data-val="${LOGIN_INFO.provinceCode}" class="province">
                    </select>
                    <select name="city" data-val="${LOGIN_INFO.cityCode}" class="city">
                    </select>
                    <select name="district" data-val="${LOGIN_INFO.districtCode}" class="area">
                    </select>
                </td>
            </tr>
            <tr>
                <th style="width: 80px;">详细地址：</th>
                <td><input type="text" name="address" value="" class="ui_ipt bold" style="width: 210px;"
                           nullable="false" max_length="100"/></td>
            </tr>
            <tr>
                <th style="width: 50px;">邮编：</th>
                <td><input type="text" name="zipCode" value="" class="ui_ipt bold" style="width: 200px;"
                           nullable="false" max_length="6" valid_type="numOnly"/>
                    <input type="hidden" name="isDefault" value=""/>
                    <input type="hidden" name="id" value=""/>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;"><a id="btnSubmitAddress" href="javascript: void(0)"
                                                               class="orangebtn_m"><span>提交</span></a></td>
            </tr>
        </table>
    </div>
</div>
<jsp:include page="../main/footer.jsp" flush="true"></jsp:include>
</body>
</html>