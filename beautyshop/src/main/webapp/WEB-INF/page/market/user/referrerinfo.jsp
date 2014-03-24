<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="library" content="market"/>
    <title>韩塑美-您的美容专柜</title>
    <script type="text/javascript" src="<%=path%>/public/core/EasyuiZX.js"></script>
    <script type="text/javascript" src="<%=path%>/public/jquery/jquery.cxselect.min.js"></script>
    <script type="text/javascript" src="<%=path%>/public/ajax/ajaxfileupload.js"></script>
    <script type="text/javascript" src="<%=path%>/market/user/js/referrerinfo.js"></script>
</head>

<body>
<jsp:include page="../main/header.jsp" flush="true"></jsp:include>
<jsp:include page="../main/leftmenu.jsp" flush="true"></jsp:include>

<div class="detailR">
    <div class="pers_cen_div mt">
        <div class="pers_cen_title">
            <h3><span>我的余额（</span>
                <span style="padding-left: 15px;" id="totalReferrer"></span>
                <span style="padding-left: 15px;" id="totalGain"></span>
                <span style="padding-left: 15px;" id="blance"></span>
                <span>）</span>
            </h3>
        </div>
        <div class="pers_cen_con">
            <div class="my_order_div">
                <div class="my_order_list clearfix">
                    <table id="referrer_list" width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr class="th_title">
                            <th>推荐用户</th>
                            <th>推荐时间</th>
                        </tr>
                        <tr id="row_tpl" style="display:none;">
                            <td style="width:30%;">
                                <p name="presenteeName"></p>
                            </td>
                            <td>
                                <p name="createTime"></p>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="referrer_page" style="display: block;" class="turnPageBottom">
            </div>
            <div class="clear"></div>
        </div>
</div>
<div class="clear"></div>
</div>
</div>

<jsp:include page="../main/footer.jsp" flush="true"></jsp:include>
</body>
</html>
