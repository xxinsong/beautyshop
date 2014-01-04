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
    <script type="text/javascript" src="js/payment.js"></script>
</head>
<body>

<div class="header">
    <jsp:include page="../main/topnav.jsp" flush="true"/>
    <div class="wrap" style="z-index:1000;">
        <div class="cart_logo"></div>
        <div class="progress">
            <ul class="progress-3">
                <li class="step-1"><b></b>1.我的购物车</li>
                <li class="step-2"><b></b>2.填写核对订单信息</li>
                <li class="step-3"><b></b>3.成功提交订单</li>
            </ul>
        </div>
        <div class="clear"></div>
    </div>
    <div class="menubar">
        <div class="wrap">
            <div class="order_pay_title"></div>
        </div>
    </div>
</div>
<div class="contaiter">
	<div class="qpay m m3 mt">
		<div class="mc"> 
			<s class="icon_succ02"></s>
			<div class="fore">
				<h3 class="ftx_02">订单提交成功，请您尽快付款！</h3>
				<ul class="list_h">
					<li class="fore1">订单号：${orderNo}</li>
					<li class="fore2">应付金额（元）：<strong class="ftx_01">${amount}元</strong></li>
                    <div class="clear"></div>
				</ul>
				<p id="p_show_info">&nbsp;</p>
				<p class="reminder">
                	立即支付<span class="">${amount}元</span>，即可完成订单。</strong>
	    	请您在<span class="ftx-04">24小时</span>内完成支付，否则订单会被自动取消。
				</p>
			</div>
		</div>
	</div>
	<div id="qpay03" class="m tabs">
		<div class="mt">
			<div id="notice1" class="hn"></div>
		</div>
		<div data-widget="tabs" class="mc">
			<ul id="bank_tab" class="tab">
				<li id="deposit_card" class="curr">
					<a href="javascript:void(0);"><strong>储蓄卡</strong></a>
				</li>
				<li id="credit_card" >
					<a href="javascript:void(0);"><strong>信用卡</strong></a>
				</li>
				<li id="pay_platform" >
					<a href="javascript:void(0);"><strong>支付平台</strong></a>
				</li>
				<div class="clear"></div>
			</ul>
			<div class="tabcon ol3">
				<div id="card_list" class="mpart fore2">
					<div class="mp_t">
						<strong>网银支付</strong>
						需开通网银
					</div>
					<!-- todo -->
					
					<ul class="bank_list">
						<li>
							<input type="radio" name="RadioGroup1" class="radio" value="ICBC">
							<div class="bank_info">
                                <label>
                                    <a href="#none"><img width="125" height="28" src="../main/images/icbc_1301.png" alt="工商银行"></a>
                                </label>
							</div>
						</li>	
						<li class="">
							<input type="radio" name="RadioGroup1" class="radio" value="CCB">
							<div class="bank_info">
                                <label>
                                    <a href="#none"><img width="125" height="28" src="../main/images/ccb_1301.png" alt="建设银行"></a>
                                </label>
							</div>
						</li>	
						<li>
							<input type="radio" name="RadioGroup1" class="radio" value="CMB">
							<div class="bank_info">
                                <label>
                                    <a href="#none"><img width="125" height="28" src="../main/images/cmb_1301.png" alt="招商银行"></a>
                                </label>
								</div>
						</li>	
						<li>
							<input type="radio" name="RadioGroup1" class="radio" value="BCOM">
							<div class="bank_info">
                                <label>
                                    <a href="#none"><img width="125" height="28" src="../main/images/bcom_1301.png" alt="中国交通银行"></a>
                                </label>
							</div>
						</li>
						<li class="">
							<input type="radio" name="RadioGroup1" class="radio" value="ABC">
							<div class="bank_info">
                                <label>
                                    <a href="#none"><img width="125" height="28" src="../main/images/abc_1301.png" alt="农业银行"></a>
                                </label>
							</div>
						</li>	
						<li>
                            <input type="radio" name="RadioGroup1" class="radio" value="BOC">
                            <div class="bank_info">
                                <label>
                                    <a href="#none"><img width="125" height="28" src="../main/images/boc_1301.png" alt="中国银行"></a>
                                </label>
                            </div>
						</li>	
						<li>
                            <input type="radio" name="RadioGroup1" class="radio" value="GDB">
                            <div class="bank_info">
                                <label>
                                    <a href="#none"><img width="125" height="28" src="../main/images/gdb_1301.png" alt="广东发展银行"></a>
                                </label>
                            </div>
                        </li>	
						<li>
                            <input type="radio" name="RadioGroup1" class="radio" value="CEB">
                            <div class="bank_info">
                                <label>
                                    <a href="#none"><img width="125" height="28" src="../main/images/ceb_1301.png" alt="中国光大银行"></a>
                                </label>
                            </div>
                        </li>	
						<li>
                            <input type="radio" name="RadioGroup1" class="radio" value="CMBC">
                            <div class="bank_info">
                                <label>
                                    <a href="#none"><img width="125" height="28" src="../main/images/cmbc_1301.png" alt="中国民生银行"></a>
                                </label>
                            </div>
                        </li>	
						<li>
                            <input type="radio" name="RadioGroup1" class="radio" value="HXB">
                            <div class="bank_info">
                                <label>
                                    <a href="#none"><img width="125" height="28" src="../main/images/hxb_1301.png" alt="华夏银行"></a>
                                </label>
                            </div>
                        </li>	
						<li>
                            <input type="radio" name="RadioGroup1" class="radio" value="CIB">
                            <div class="bank_info">
                                <label>
                                    <a href="#none"><img width="125" height="28" src="../main/images/cib_1301.png" alt="兴业银行"></a>
                                </label>
                            </div>
                        </li>	
						<li>
                            <input type="radio" name="RadioGroup1" class="radio" value="POST">
                            <div class="bank_info">
                                <label>
                                    <a href="#none"><img width="125" height="28" src="../main/images/post_1301.png" alt="邮政储蓄"></a>
                                </label>
                            </div>
                        </li>	
						<li>
                            <input type="radio" name="RadioGroup1" class="radio" value="CITIC">
                            <div class="bank_info">
                                <label>
                                    <a href="#none"><img width="125" height="28" src="../main/images/citic_1301.png" alt="中信银行"></a>
                                </label>
                            </div>
                        </li>	
						<li>
                            <input type="radio" name="RadioGroup1" class="radio" value="SPDB">
                            <div class="bank_info">
                                <label>
                                    <a href="#none"><img width="125" height="28" src="../main/images/spdb_1301.png" alt="浦东发展银行"></a>
                                </label>
                            </div>
                        </li>	
						<li>
                            <input type="radio" name="RadioGroup1" class="radio" value="SDB">
                            <div class="bank_info">
                                <label>
                                    <a href="#none"><img width="125" height="28" src="../main/images/sdb_1301.png" alt="深圳发展银行"></a>
                                </label>
                            </div>
                        </li>	
						<li>
                            <input type="radio" name="RadioGroup1" class="radio" value="BOB">
                            <div class="bank_info">
                                <label>
                                    <a href="#none"><img width="125" height="28" src="../main/images/bob_1301.png" alt="北京银行"></a>
                                </label>
                            </div>
                        </li>	
						<li>
                            <input type="radio" name="RadioGroup1" class="radio" value="CBHB">
                            <div class="bank_info">
                                <label>
                                    <a href="#none"><img width="125" height="28" src="../main/images/cbhb_1301.png" alt="渤海银行"></a>
                                </label>
                            </div>
                        </li>	
						<li>
                            <input type="radio" name="RadioGroup1" class="radio" value="PAB">
                            <div class="bank_info">
                                <label>
                                    <a href="#none"><img width="125" height="28" src="../main/images/pab_1301.png" alt="平安银行"></a>
                                </label>
                            </div>
                        </li>	
						<li>
                            <input type="radio" name="RadioGroup1" class="radio" value="NJCB">
                            <div class="bank_info">
                                <label>
                                    <a href="#none"><img width="125" height="28" src="../main/images/njcb_1301.png" alt="南京银行"></a>
                                </label>
                            </div>
                        </li>	
						<li>
                            <input type="radio" name="RadioGroup1" class="radio" value="HZB">
                            <div class="bank_info">
                                <label>
                                    <a href="#none"><img width="125" height="28" src="../main/images/hzb_1301.png" alt="杭州银行"></a>
                                </label>
                            </div>
                        </li>	
					</ul>
				</div>
				<div id="platform_list" class="mpart fore2" style="display:none;">
					<div class="mp_t">
						<strong>平台支付</strong>
					</div>
					<ul class="bank_list">
						<li>
							<input type="radio" name="RadioGroup1" class="radio" value="EPAYACC">
							<div class="bank_info">
                                <label>
                                    <a href="#none"><img width="125" height="28" src="../main/images/yizhifu_1301.png" alt="翼支付"></a>
                                </label>
							</div>
						</li>	
						<li class="">
							<input type="radio" name="RadioGroup1" class="radio" value="ALIPAY">
							<div class="bank_info">
                                <label>
                                    <a href="#none"><img width="125" height="28" src="../main/images/zhifubao.png" alt="支付宝"></a>
                                </label>
							</div>
						</li>						
					</ul>
				</div>
				<form id="form_pay" action="<%=request.getContextPath()%>/market/pay/send.jsp" method="POST" target="_blank">
		            <input id="orderId" type="hidden" name="ORDERSEQ" value="${orderId}"/>
		            <!-- <input type="hidden" name="ORDERSEQ" value="${orderNo}"/>  -->
		            <input type="hidden" name="AMOUNT" value="${amount}"/>
		            <input id="bankId" type="hidden" name="BANKID" value=""/>
	        	</form>
    			<div class="btns">
    				<a id="btn_submit" href="javascript:void(0)" class="btn_surepay">确认支付方式</a>
    			</div>
			</div>
		</div>
	</div>
	<div class="w m2 mt">
		<div class="checkout gray_check">
			<div class="mtt">
				<div id="open_ct_div" class="contract">
					<a id="open_cont" href="javascript:void(0)"><i class="open_contract"></i>展开订单详情</a>
				</div>
				<div id="close_ct_div" class="contract" style="display:none;">
					<a id="close_cont" href="javascript:void(0)"><i class="close_contract"></i>收起订单详情</a>
				</div>
			</div>
			<div id="order_list_div" class="checkout_steps" style="display:none;">
               <div class="steps step_complete">
				    <div class="step_title"><a class="return_edit" href="#">返回修改购物车</a><strong>商品清单</strong></div>
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
				                                    <td class="fore4">库存</td>
				                                </tr>
				                                </tbody>
				                            </table>
				                            <div class="review_body" id="goodsInst_list">
				                                <div class="review_tbody" id="row_tpl" style="display: none;">
				                                    <table class="order_table">
				                                        <tr>
				                                            <td class="fore1">
				                                                <div class="p_goods">
				                                                    <div class="p_img"><a target="_blank" href="#"><img
				                                                            src="../main/images/pic01.jpg" alt=""></a></div>
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
				                                            <td class="fore2">x 1</td>
				                                            <td skuid="136363" class="fore2 p_inventory">现货</td>
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
				                                    <span><em id="total">4</em> 件商品&nbsp;&nbsp;&nbsp;&nbsp;总价：</span>
				                                    <em v="59.90" id="totalPrice" class="price">￥59.90</em>
				                                </div>
				                                <div class="list">
				                                    <span>返现：</span>
				                                    <em v="0.00" id="cashBack" class="price"> -￥0.00</em>
				                                </div>
				                                <div class="list"><span>应付：</span><em id="disp_amount" class="price"> ￥59.90</em></div>
				                            </div>
				                            <div class="span clr"></div>
				                        </div>
				                    </div>
				                </div>
				            </div>
				            <span class="clr"></span>
				        </div>
				        <div class="checkout_buttons group">
				             <div class="sticky_wrap">
                                <div class="inner">
                                    <span class="total" style="margin-right:20px;">应付总额：<strong id="payPriceId">￥59.90</strong>元</span>
                                </div>
                                <span class="submit_error" style="display:none" id="submit_message"></span>
							</div>
				        </div>
				    </div>
				</div> 
            </div>
		</div>
	</div>
</div>
<jsp:include page="payresult.jsp" flush="true"></jsp:include>
<jsp:include page="../main/footer.jsp" flush="true"></jsp:include>
</body>
</html>