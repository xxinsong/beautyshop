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
    <script type="text/javascript" src="<%=path%>/market/order/js/myorder.js"></script>
</head>
<body>

<jsp:include page="../main/header.jsp" flush="true"></jsp:include>
<jsp:include page="../main/leftmenu.jsp" flush="true"></jsp:include>

<div class="detailR">
    <div class="pers_cen_div mt">
        <div class="pers_cen_title">
            <h3>我的订单</h3>
        </div>
        <div class="pers_cen_con">
            <div class="my_order_tab_con">
                <ul class="my_order_tab">
                    <li class="curr">
                        <a id="showall" href="javascript:void(0);"><span>全部</span></a>
                    </li>
                    <li>
                        <a id="showprocessing" href="javascript:void(0);"><span>进行中</span></a>
                    </li>
                    <li>
                        <a id="showdone" href="javascript:void(0);"><span>已结束</span></a>
                    </li>
                    <li>
                        <a id="showcancel" href="javascript:void(0);"><span>已取消</span></a>
                    </li>
                    <div class="clear"></div>
                </ul>
                <div class="my_order_search" style="padding-right:0px;">
                    <div class="my_order_search_ipt">
                        <span class="my_order_search_ic"></span>
                        <input type="text" id="cond" />
                        <a id="search" href="javascript:void(0);" class="graybtn">筛选</a>
                    </div>
                </div>
            </div>
            <div class="my_order_div">
                <div class="my_order_list clearfix">
                    <table id="order_list" width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr class="th_title">
                            <th>订单信息</th>
                            <th>金额</th>
                            <th>
                                <select name="time_filter" id="time_filter" class="ui_select">
                                    <option value="ALL">全部时间</option>
                                    <option value="1M">最近一月</option>
                                    <option value="6M">最近半年</option>
                                </select>
                            </th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                        <tr id="goods_tpl" style="display:none;" >
                            <td style="width:30%;">
                                <div class="favs_content">
                                    <img name="image_uri" src="" width="60" height="60" />
                                </div>
                            </td>
                            <td>
                                <p name="price">￥0.00</p>
                                <p name="payment_type">在线支付</p>
                            </td>
                            <td>
                                <p><span class="gray_font" name="create_time"></span></p>
                            </td>
                            <td>
                                <p><a class="green_font" name="state">进行中</a></p>
                            </td>
                            <td>
                                <p>
                                    <a href="javascript:void(0);" class="blue_font" name="btn_view">查看</a>
                                    <a href="javascript:void(0);" class="blue_font" name="btn_cancel">取消</a>
                                    <a href="javascript:void(0);" class="blue_font" name="btn_comment">评价</a>
                                </p>
                                <p><a href="javascript:void(0);" name="btn_buy" class="graybtn_s"><span><i class="add_to"></i>还要买</span></a></p>
                            </td>
                        </tr>
                        <tr id="row_tpl" class="td_first" style="display: none;">
                            <td colspan="5">订单编号：<a name="order_no" href="javascript:void(0)"></a><span name="amount">总金额：￥98.00</span></td>
                        </tr>

                    </table>
                </div>
            </div>
            <div id="order_page" style="display: block;" class="turnPageBottom">
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
<div class="clear"></div>
</div>
</div>
<jsp:include page="../main/footer.jsp" flush="true"></jsp:include>

</body>
</html>