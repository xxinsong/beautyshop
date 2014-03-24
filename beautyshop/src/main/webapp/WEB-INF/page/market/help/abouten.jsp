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
//                switchMainMenu($("#service"));
                switchMenu($("#mnu_abouten"));
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
                    <h3>About us</h3>
                </div>
                <div class="pers_cen_con">
                    <div class="announce_content">
                        <p >Korean plastic beauty, is an orthopedic specialist from South Korea to build the brand and Beauty vertically integrated electricity suppliers sharing platform. Korean plastic beauty insists homegrown , owned by the South Korean orthopedic specialists developed specifically for Asian women skinny Korean beauty brand and the introduction of Korean high-tech components and technologies Wei really care brand that offers fashion and beauty solutions to women as the main purpose, commitment create simple, fun , create wealth , share the joy and trusted cosmetic shopping experience , so that consumers have a good service experience , and thus obtain the trust of consumers . US- owned Korean original plastic complete professional sales system , self-built channels , warehousing and logistics , determined to make women's cosmetics professional sharing type sites.</p>
                        <br>
                        <p >Korean plastic beauty mask : South Korean experts for Asian women -specific activation of a cell , but also Yan Tong skin , deep moisturizing mask tech .</p>
                        <br>
                        <p >US- South Korea Plastic Corporation will continue to look for new product lines , and constantly create new sales system so that everyone has the opportunity to stand on top of sales system, to get more benefits. New products can be referred by member ( Recommend who can arrange the topmost priority in the system, the distribution of benefits ) , by companies looking for new products, or direct manufacturers introduce new products . New products to meet the green, environmentally friendly , low-cost consumer goods , housing, clothing, or life .</p>
                        <br>
                        <p >한국어 플라스틱 아름다움 , 브랜드와 미 (美) 플랫폼을 공유하는 수직 통합 된 전력 공급 을 구축하기 위해 한국의정형 외과 전문가입니다. 한국어 플라스틱 아름다움 아시아 여자 여위는 한국어 뷰티 브랜드와 웨이 정말 주요 목적 , 노력 으로 여성에게 패션과 뷰티 솔루션을 제공하고 브랜드 상관 한국어 첨단 기술 의 구성 요소 및 기술의 도입 을 위해 특별히 개발 된 한국의 정형 외과 전문가에 의해 소유 , 자체 개발 을 주장 , 부를 창조 의 기쁨을 공유하고 화장품 쇼핑 경험을 신뢰할 수있는 , 소비자가 좋은 서비스 경험 을 할 수 있도록 하고, 따라서 소비자 의 신뢰를 얻을 , 재미, 간단하게 만들 수 있습니다. 미국 소유의 본래 한국 플라스틱 완전한 전문 판매 시스템 , 자체 내장 된 채널, 창고 및 여성의 화장품 전문 공유 형 사이트를 만들 하기로 결정 물류 .</p>
                        <br>
                        <p >한국어 플라스틱 뷰티 마스크 : 아시아 여성 특정세포 의 활성화 뿐만 아니라, 연 통 의 피부에 깊은 보습 마스크 기술 에 대한 한국 전문가 .</p>
                        <br>
                        <p >한미 플라스틱 회사는 새로운 제품 라인 을 찾기 위해 계속해서 , 모든 사람들이 더 많은 혜택 을 얻을 수 , 판매 시스템 의 꼭대기에 서 할 수있는 기회를 가질 수 있도록 지속적으로 새로운 판매 시스템 을 만들 것입니다. 새로운 제품은 새로운 제품을 찾고 , 또는 직접 제조 업체는 새로운 제품을 소개하는 회사 , 회원 ( 누가 , 시스템의 혜택의 분배를 최상위 우선 순위 를 이용하실 수 있습니다 추천 ) 에 의해 참조 할 수 있습니다. 녹색 , 친환경 , 저가 소비재 , 주택, 의류, 또는 생활을 충족하기 위해 새로운 제품 .</p>
                        <br>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <div class="clear"></div>
	<jsp:include page="../main/footer.jsp" flush="true"></jsp:include>
	</body>
</html>