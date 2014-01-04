<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="library" content="market" />
<title>数据超市</title>
<script type="text/javascript" src="<%=path%>/public/core/EasyuiZX.js"></script>
<script type="text/javascript" src="<%=path%>/market/goods/js/search_product.js"></script>
</head>

<body>
<jsp:include page="../main/header.jsp" flush="true"></jsp:include>
<div class="contaiter">
	<div class="positionDiv" id="curr_pos"></div>
    <div class="wrap">
		<div class="searchColMainItem searchResultOp mt">
            <h3><span>类别</span>-商品筛选<div class="searchResultNum" style="display: none;"><a href="javascript: void(0)">重置条件</a></div></h3>
            <div class="searchOpBrand brandAttr clearfix " style="z-index: 0;" id="goodTags">
          	</div>
        </div>
    	<div class="filter mt">
            <div class="fore1">
            	<dl class="order">
                	<dt>排序：</dt>
            		<dd class="curr down" query_type="001"><a href="javascript: void(0)">按销售</a><b></b></dd>
            		<dd class="down" query_type="002"><b></b><a href="javascript: void(0)">按价格</a><b></b></dd>
            		<dd class="down" query_type="003"><a href="javascript: void(0)">按评论</a><b></b></dd>
            		<dd class="down" query_type="004"><a href="javascript: void(0)">按时间</a><b></b></dd>
            	</dl>
            	<div class="pagin pagin_m">
            	    <a name="prev" href="javascript: void(0)" class="prev_disabled">上一页<b></b></a>
            		<a name="next" href="javascript: void(0)" class="next_disabled">下一页<b></b></a>
            	</div>
            <div class="total"><span>共<strong>0</strong>个商品</span></div>
            <span class="clr"></span>
            </div>
    	</div>
        <div class="proListDiv">
        	<ul class="proList" id="goods_list">
            	<li id="goods_tpl" style="display: none;">
                	<div class="proImg">
                        <img src='' width='250' height='250' style='cursor: pointer;'/>
                	</div>
                  	<div class="proContent">
                    	<div class="proTitle">
                    		<a name="goods_name" style="font-size:large;font-weight: bold"></a>
                            <p class="p_price">价格:<strong name="base_price">￥0</strong><span style="display: none;">原价：￥<del>0</del></span></p>
                        </div>
                        <div class="proInfo">
                        	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="proTable">
                              <tr>
                                <th>商品描述：</th>
                                <td name="goods_desc">XXXX</td>
                              </tr>
                              <tr>
                                <th>商品参数：</th>
                                <td>XXXX</td>
                              </tr>
                              <tr>
                                <th>上架时间：</th>
                                <td name="putaway_time">2013-12-31 00:00:00</td>
                              </tr>
                              <tr>
                                <th>顾客评价：</th>
                                <td name="comment_num"><span class="star five_star"></span>评论（99999）</td>
                              </tr>
                              <tr>
                                <th>商品销量：</th>
                                <td name="inst_num">已售出(99999)</td>
                              </tr>
                            </table>
                        </div>
                    </div>
                    <div class="proListBtn">
                    	<a name="addCar" href="javascript: void(0)" class="greenBtn" style="width:78px;">加入购物车</a>
                    	<a href="javascript: void(0)" class="grayBtn" style="width:78px; margin-top:10px;">加关注</a>
                    </div>
              	</li>
            </ul>
        </div>
        <div style="display: block;" class="turnPageBottom" id="goods_pager">
            <a href="#" class="page_prev page_disabled"><i class="page_prev_arrow"></i>上一页</a>
            <span class="page_cur">1</span>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <span class="page_break">...</span>
            <a href="#">50</a>
            <a href="#" class="page_next">下一页<i class="page_next_arrow"></i></a>
        </div>
    </div>
</div>
<jsp:include page="../main/footer.jsp" flush="true"></jsp:include>
</body>
</html>
