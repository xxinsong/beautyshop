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
    	<link rel="stylesheet" href="css/style.css" type="text/css" />
    	<%--<link rel="stylesheet" href="<%=request.getContextPath()%>/market/help/css/style.css" type="text/css" />--%>
    	<script type="text/javascript" src="<%=path%>/public/core/EasyuiZX.js"></script>
    	<script type="text/javascript">
            $(function () {
                switchMainMenu($("#kind"));
                switchMenu($("#mnu_kind"));
                $("#sec_mnu").text("正品分类")
            });
    	</script>
	</head>
	<body>
		<jsp:include page="../main/header.jsp" flush="true"></jsp:include>
        <jsp:include page="helpmenu.jsp" flush="true"></jsp:include>
        <%--<div style="border:1px solid #dcdcdc;padding-left:225px;width:1000px">
            <img style="" src="<%=path%>/market/main/images/identify.jpg"/>
        </div>--%>
        <div class="detailR" <%--style="padding-left:225px;width:775px; float:left;"--%>>
            <div class="pers_cen_div mt">
                <div class="pers_cen_title">
                    <h3>正品分类</h3>
                </div>
                <div class="pers_cen_con">
                    <div class="announce_content">
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;韩塑美，是一家由韩国整形专家打造品牌及美妆垂直电商为一体的分享平台。韩塑美坚持自产自销，拥有由韩国整形专家专为亚洲女性研发的韩瘦美品牌以及引进韩国高科技成分和护肤技术的薇真品牌，以为女性提供时尚美容解决方案为主要服务宗旨，致力于创造简单、有趣、创造财富、分享快乐、值得信赖的化妆品购物体验，让消费者拥有良好的服务体验，进而取得消费者的信任。韩塑美拥独创的有完整专业的销售体系，自建渠道、仓储和物流，立志做女性化妆品专业分享型网站。</p>

                        <p>&nbsp;</p>
                        <h2>韩瘦美</h2>
                        <p>您的私人微整形面膜专家</p>
                        <p>让肌肤享受从UV的完美脱变，媲美微整形的瘦脸面膜。</p>
                        <%--<h2>产品分类</h2>--%>
                        <h2>韩瘦美焕颜透白面膜【美白护理】</h2>
                        <p>功效：改善暗沉肤色，维他命B3彻底美白肌肤，抑制黑色素，淡化色斑改善暗沉，打造透白，莹润质感皮肤，活性因子，修护晒后肌肤。</p>
                        <p>&nbsp;</p>
                        <h2>韩瘦美滋养水润面膜【保湿护理】</h2>
                        <p>功效：深层锁水和补充肌肤营养，改善粗糙缺水性肌肤，地中海橄榄油可直接深入皮肤基底层，滋养补水、增加肌肤保湿度和光洁感，让肌肤深度养分，再现水嫩细致，在短时间内获得深度滋养，享受及时保养。</p>
                        <p>&nbsp;</p>
                        <h2>韩瘦美弹滑抗皱面膜【毛孔护理】</h2>
                        <p>功效：改善皱纹，玻尿酸钠锁住肌肤水分，深入肌肤基底，平衡细胞，改变皮肤纹理，多种植物提取物，补充胶原蛋白，让肌肤时刻弹滑，解决缺乏营养问题，从而恢复皮肤弹性，减少皱纹及细纹，实现肌肤脱变之美。</p>
                        <p>&nbsp;</p>
                        <h2>韩瘦美活颜紧致面膜【皱纹护理】</h2>
                        <p>功效：双倍提升、紧致、铺酶Q10是深海子酱成分中提取微量元素，增加肌肤养分，改善浮肿、胶原蛋白恢复皮肤弹力。从而具有水嫩，弹力紧致感，保持肌肤年轻态。</p>
                        <p>&nbsp;</p>
                        <h2>韩瘦美弹力祛痘面膜【祛痘护理】</h2>
                        <p>功效：产品温和，适合敏感性肌肤，洋甘菊平衡皮肤多余油脂的分泌，深度清洁毛孔，减少黑头和白头。调节脆弱肌肤，调节脸部油脂分泌过剩问题，如长期使用，让你的脸保持光滑亮丽更富有润泽弹性，从而实现肌肤华丽转身。</p>


                        <p>&nbsp;</p>
                        <h2>薇真品牌</h2>
                        <p>活化细胞，还颜童肤</p>
                        <p>维护肌肤，给肌肤注入高浓缩营养，改变暗沉、松弛、干燥、无弹力肌肤。
                            是一款针对面部维护产品，你的私人面部V脸专家，塑造灵动美女。
                        </p>
                        <%--<h2>产品分类</h2>--%>
                        <h2>薇真细胞活力羊胎素活化面膜</h2>
                        <p>功效：在小羊胎中提取含有丰富活性物质的细胞，有效的改善人体皮肤状况，羊胎素细胞结构与人体细胞极为相似，全面活性物质，帮助肌肤吸收养分，实现光洁，靓丽，饱满剔透质感，从而若新生。</p>
                        <p>&nbsp;</p>
                        <h2>薇真海洋鱼子水润活化面膜</h2>
                        <p>功效：鱼子中所含微量元素，不仅能有效的滋润营养皮肤，更具有皮肤细腻和润泽的作用，改善肌肤纹理和暗沉从而实现活力质感，让都市女性享受肌肤放松舒服的美好时刻。</p>
                        <p>&nbsp;</p>
                        <h2>薇真胶原蛋白羊胎素活化面膜</h2>
                        <p>功效：胶原蛋白和小羊胚胎中提取活性物质细胞的完美结合，能促进肌肤细胞活化，增加皮肤机理密度，完美结合的活肤养分，加强弹性纤维结构，提高皮肤弹性和支撑力，让肌肤恢复弹性和润泽、健康活力，从而实现肌肤弹性之美感。</p>
                        <p>&nbsp;</p>
                        <h2>薇真玻尿酸深度修护活化面膜</h2>
                        <p>功效：多种植物提取成分，针对脸部水肿排泄不畅，深层清洁毛孔污物，帮助毛孔排除多余水分及废物，紧致肌肤质地柔滑轻盈，从而展现完美娇小玲珑美脸。</p>
                        <p>&nbsp;</p>
                        <h2>薇真银杏活肤紧致活化面膜</h2>
                        <p>功效：银杏等植物提取精华，抗氧化及收敛肌肤，促进脂肪能量转换，增加皮肤弹性，提升紧致肌肤同时，供给肌肤必要的养分，滋养肌肤。为你那张秀气的脸显得更加小巧，明亮动人。</p>

                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <div class="clear"></div>
	<jsp:include page="../main/footer.jsp" flush="true"></jsp:include>
	</body>
</html>