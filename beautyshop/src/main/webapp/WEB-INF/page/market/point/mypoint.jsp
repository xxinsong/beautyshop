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
    <script type="text/javascript" src="<%=path%>/market/point/js/mypoint.js"></script>
</head>
<body>

<jsp:include page="../main/header.jsp" flush="true"></jsp:include>
<jsp:include page="../main/leftmenu.jsp" flush="true"></jsp:include>

<div class="detailR">
    <div class="pers_cen_div mt">
        <div class="pers_cen_title">
            <h3 id="myEffPoint">我的积分</h3><!--有效积分:0 -->
        </div>
        <div class="pers_cen_con">
            <div class="my_point_div">
                <div class="my_point_list clearfix">
                    <table id="point_list" width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr class="th_title">
                            <th>订单编号</th>
                            <th>积分值</th>
                            <th>状态</th>
                            <th>时间</th>
                        </tr>
                        <tr id="point_tpl" style="display:none;" >
                            <td style="width:30%;">
                                <a name="orderNo" href="javascript:void(0)">867247012</a>
                            </td>
                            <td>
                                <p name="point">积分值</p>
                            </td>
                            <td>
                                <p><a class="green_font" name="state">状态</a></p>
                            </td>
                            <td>
                                <p><span class="gray_font" name="gainTime"></span></p>
                            </td>
                        </tr>
                        <!-- <tr id="row_tpl" class="td_first" style="display: none;">
                            <td colspan="5">订单编号：<a name="order_no" href="javascript:void(0)">867247012</a><span name="amount">总金额：￥98.00</span></td>
                        </tr> -->
                    </table>
                </div>
            </div>
            <div id="point_page" style="display: block;" class="turnPageBottom">
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