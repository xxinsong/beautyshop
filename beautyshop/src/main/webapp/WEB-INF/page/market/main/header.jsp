<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String from_page = request.getParameter("from_page") == null ? "" : request.getParameter("from_page");
%>
<script type="text/javascript">
    var from_page = "<%=from_page%>";
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/market/main/js/header.js"></script>

<jsp:include page="minilogin.jsp" flush="true"></jsp:include>

<div class="header">
    <jsp:include page="topnav.jsp" flush="true"/>
    <div class="wrap" style="z-index:1000;">
    	<div class="header_logo" style="cursor: pointer;"></div>
        <div class="header_search">
   	    	<div class="searchBox">
            	<div class="searchIpt">
            	  <input name="textfield" type="text" id="textfield" value="输入搜索关键字" onFocus="if(value=='输入搜索关键字') {value='';}" onBlur="if (value=='') {value='输入搜索关键字';}"/>
       			</div>
   		  		<a href="#" class="searchBtn">搜索</a>
       	  	</div>
            <%--<div class="recommendDiv"><span>推荐搜索：</span><a href="#">大屏拼接</a>  <a href="#">数字标牌</a>  <a href="#">PVC</a>  <a href="#">LED</a>  <a href="#">印刷</a></div>--%>
        </div>
        <div class="mini_cart clearfix">
            <div class="minicart_box">
                <a href="#" class="mini_my_cart">
                <i class="cartico"></i>去购物车结算<i class="cartarrow"></i></a>
                <%--<div class="minicart_list" style="display: none; height: auto;">
                    <ul class="cart_tab hide">
                        <li class="cur_tab">购物车</li>
                    </ul>
                    <div class="list_detail">
                        <div class="none_tips"><span class="shop_cart"></span>您的购物车里还没有商品，欢迎选购！</div>
                    </div>
                    <div class="list_detail hide" style="display: none;"></div>
                </div>--%>
                <div class="minicart_list" style="display: none; height: auto;">
                    <ul class="cart_tab hide">
                        <li class="cur_tab">购物车</li>
                    </ul>
                    <div class="list_detail">
                        <ul id="tab_minicart">
                            <div id="noneTips" class="none_tips"><span class="shop_cart"></span>您的购物车里还没有商品，欢迎选购！</div>
                            <li id="minicart_row_tpl" style="display: none;">
                                <a href="#" class="pro_img" traget="_blank"><img src="<%=request.getContextPath()%>/market/main/images/cartimg.jpg"></a>
                                <a href="javascript:void(0);" class="pro_name" name="goodsName"></a>
                                <span class="pro_price" name="price">¥0.0</span>
                                <div class="num_box">
                                    <a name="btn_del" href="javascript:void(0);">删除</a>
                                </div>
                            </li>
                        </ul>
                        <div class="checkout_box">
                            <p><span class="fl" style="line-height:24px;">共<strong id="m_total">0</strong>件商品</span>共计：<strong id="m_totalPrice">¥0.0</strong>
                            <a id="btn_pay" class="checkout_btn" href="javascript:void(0);">去结算</a></p>
                        </div>
                    </div>
                    <div id="minicart_page" style="display: none;" class="turnPageBottom">
                    </div>
                    <div class="list_detail hide" id="dqgMiniCart" style="display: none;">
                    </div>
                </div>
                <div class="ap_shopping_warning"></div>
            </div>
        </div>
    </div>
    <div class="menubar">    	
    	<div class="wrap" style="z-index:900;">
            <div class="allSortbox">
                <h2 class="all_sort_link"><a href="javascript: void(0)">全部商品分类</a></h2>
                <div id="allCategoryHeader" class="allsort_out_box">
                    <div class="allsort_out" style="border-bottom-width: 0px;">
                        <ul class="allsort" style="display: ;">
                            <li class="">
                                <div class="div_loading" style="border-bottom: #d8d8d8 1px solid;">
							        <span>加载中...</span>
						        </div>
                          	</li>                                       
                        </ul>
                    </div>
                    <div style="display: none;"><img src="<%=request.getContextPath()%>/market/main/images/advert01.jpg" width="220" height="121" /></div>
                </div>
            </div>
            <div class="headerNavWrap">
                <ul class="headerNavMain clearfix">
                    <li style="z-index:798" class="cur"><a target="_blank" href="javascript: void(0)">首页</a></li>
                    <li style="z-index:797;display: none;"><a target="_blank" href="javascript: void(0)">商品类别</a></li>
                    <li style="z-index:796;display: none;"><a target="_blank" href="javascript: void(0)">商品类别</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>