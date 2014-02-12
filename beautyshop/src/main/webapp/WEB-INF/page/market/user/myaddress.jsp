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
    <script type="text/javascript" src="<%=path%>/market/user/js/myaddress.js"></script>
</head>

<body>
<jsp:include page="../main/header.jsp" flush="true"></jsp:include>
<jsp:include page="../main/leftmenu.jsp" flush="true"></jsp:include>

<div class="detailR">
    <div class="pers_cen_div mt">
        <div class="pers_cen_title">
            <h3>我的收货地址</h3>
        </div>
        <div class="pers_cen_con">
            <div class="my_order_div">
                <div class="my_order_list clearfix">
                    <table id="address_list" width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr class="th_title">
                            <th>收货人</th>
                            <th>电话</th>
                            <th>地址</th>
                            <th>邮编</th>
                            <th>默认</th>
                            <th>操作</th>
                        </tr>
                        <tr id="row_tpl" style="display:none;">
                            <td style="width:30%;">
                                <p name="contact_person"></p>
                            </td>
                            <td>
                                <p name="mobile_phone"></p>
                            </td>
                            <td>
                                <p name="full_address"></p>
                            </td>
                            <td>
                                <p name="zip_code"></p>
                            </td>
                            <td>
                                <p><input type="radio" name="is_default"/></p>
                            </td>
                            <td>
                                <p>
                                    <a href="javascript:void(0);" class="blue_font" name="btn_del">删除</a>
                                    <a href="javascript:void(0);" class="blue_font" name="btn_mod">修改</a>
                                </p>
                            </td>
                        </tr>

                    </table>
                </div>
            </div>
            <div id="address_page" style="display: block;" class="turnPageBottom">
            </div>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td style="text-align: center;">
                        <a id="btn_add" href="javascript:void(0);" class="orangebtn"><span>&nbsp;新&nbsp;增&nbsp;</span></a>
                    </td>
                </tr>
            </table>
            <div class="clear"></div>
        </div>
</div>
<div class="clear"></div>
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
                <td colspan="2" style="text-align: center;"><a id="btn_submit" href="javascript: void(0)"
                                                               class="orangebtn_m"><span>提交</span></a></td>
            </tr>
        </table>
    </div>
</div>
<jsp:include page="../main/footer.jsp" flush="true"></jsp:include>
</body>
</html>
