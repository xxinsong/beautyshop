<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="library" content="market,WdatePicker"/>
    <script type="text/javascript" src="<%=path%>/public/core/EasyuiZX.js"></script>
    <script type="text/javascript" src="<%=path%>/market/goods/js/productInfo.js"></script>
    <title>深圳市韩塑美生物医学科技有限公司是一家化妆品面膜垂直电商为一体的分享平台互联网公司</title>
</head>

<body>
<div class="header">


<jsp:include page="../main/header.jsp" flush="true"></jsp:include>
<div class="contaiter">
<%--<div class="positionDiv"><a href="javascript:void(0);">全部分类</a> <span>></span> <a href="javascript:void(0);">手机通讯</a> <span>></span> <a href="javascript:void(0);">手机</a>
</div>--%>
<div class="wrap">
<div class="pro_detail">
    <div class="left_img" id="goods_img">
        <img src='' width='358' height='358' />
    </div>
    <div class="right_info">
        <div class="proTitle">
            <h3 id="goodsName"></h3>
            <input type="hidden" id="goodsId"/>

            <p class="p_price">价格:<strong id="basePrice">￥</strong><span >原价：￥<del id="preBasePrice"></del></span>
            </p>
            <%--<div class="yjShare" id="mapTag">
                <a href="javascript:void(0);"><i></i>地图标注</a>
            </div>--%>
            <input type="hidden" id="circle_id"/>
        </div>
        <%--<jsp:include page="MapSelect.jsp"/>--%>
        <div class="proInfo">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="proTable">
                <tr>
                    <th>商品描述：</th>
                    <td id="goodsDesc"></td>
                </tr>
                <tr>
                    <th>上架时间：</th>
                    <td id="putawayTime">2013-03-29 18:18:55</td>
                </tr>
                <tr>
                    <th>顾客评价：</th>
                    <td id="comment_num"><span class="star fivestar"></span>评论（0）</td>
                </tr>
                <tr>
                    <th>商品销量：</th>
                    <td id="inst_num">已售出(0)</td>
                </tr>
            </table>
        </div>
        <div class="proBuy">
            <%--<ul class="proBuyList">

                <li>
                    <div class="dt">购买标签：</div>
                    <div class="dd">
                        <div class="item" id="goodsTag">

                        </div>
                    </div>
                </li>
            </ul>

            <div class="filer_list" style="height: 50px">

            </div>--%>

            <div class="proBuyBtn">
                <a href="javascript:void(0);" class="tocart">加入购物车</a>
                <%--<a href="javascript:void(0);" class="colectBtn" id="attention"><i class="addico"></i>加关注</a>--%>
                <%--<a href="javascript:void(0);" class="colectBtn" id="myconsult"><i class="addico"></i>商品咨询</a>--%>
                <%--<a href="javascript:void(0);" class="colectBtn"><i class="addico"></i>加关注</a>--%>

            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>
<div class="pro_info_tab_con mt">
    <ul class="pro_info_tab">
        <li id="goods_desc" class="curr" rel_tab="goods_desc">
            <a href="javascript:void(0);"><span>商品描述</span></a>
        </li>
        <li id="goods_commment" rel_tab="goods_commment">
            <a href="javascript:void(0);"><span>商品评价</span></a>
        </li>
        <div class="clear"></div>
    </ul>
</div>
<div class="pro_info_con" rel_tab="goods_desc">
    <div class="pro_info_content" id="goods_detail">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="pro_info_table1">
            <tr>
                <td>商品名称：<span name="goodsName">中兴V965</span></td>
                <td>上架时间：<span name="putawayTime">2013-03-29 18:18:55</span></td>
                <td></td>
            </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="pro_info_table2">
            <tr>
                <th colspan="2">主体</th>
            </tr>
            <tr>
                <td class="td_title">商品编号</td>
                <td name="goodsNo"></td>
            </tr>
            <tr>
                <td class="td_title">使用方法</td>
                <td name="type"></td>
            </tr>
            <tr>
                <td class="td_title">商品特性</td>
                <td name="goodsProps"></td>
            </tr>
            <tr>
                <td class="td_title">温馨提示</td>
                <td name="hints"></td>
            </tr>
        </table>
        <div class="pro_info_service">
            <h3>服务承诺</h3>

            <p>
                本商城向您保证所售商品均为正品行货，自营商品自带机打发票，与商品一起寄送。凭质保证书及本商城发票，可享受全国联保服务（奢侈品、钟表除外；奢侈品、钟表由联系保修，享受法定三包售后服务），与您亲临商场选购的商品享受相同的质量保证。本商城还为您提供具有竞争力的商品价格和运费政策，请您放心购买！</p>

            <p class="p_blue">
                注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！</p>
        </div>
        <div class="pro_info_service">
            <h3>权利声明</h3>

            <p>本商城上的所有商品信息、客户评价、商品咨询、网友讨论等内容，是本商城重要的经营资源，未经许可，禁止非法转载使用。</p>

            <p class="p_blue">注：本站商品信息均来自于厂商，其真实性、准确性和合法性由信息拥有者（厂商）负责。本站不提供任何保证，并不承担任何法律责任。</p>
        </div>
    </div>
</div>
    <%--<div class="content_pop" id="addConsult" style="width:508px;display: none;">
        <h2>商品咨询<a href="#" class="pop_close" onclick="closeMyConsult()">关闭</a></h2>
        <div class="login_pop_table">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="form_table">
                <tr>
                    <th><span name="consultImageUri"></span></th>
                    <td><p class="pro_name" name="consultGoodsName">中兴手机U819 [陶瓷白]</p></td>
                    <th>咨询类型：</th>
                    <td>
                        <select name="select" id="consultSelect" class="ui_select">
                            <option value="1">产品相关</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>咨询内容：</th>
                    <td colspan="3"><textarea name="textarea"  cols="45" rows="7" class="ui_txt" id="consultContent"></textarea></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td colspan="3" id="message"></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td colspan="3"><a href="javascript:void(0);" class="orangebtn_m" onclick="submitMyConsult()"><span>提交我的咨询</span></a></td>
                </tr>
            </table>
        </div>
    </div>--%>
<jsp:include page="../comments/goodscomments.jsp"/>
<jsp:include page="../main/footer.jsp" flush="true"></jsp:include>
</body>
</html>
