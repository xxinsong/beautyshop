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
    	<link rel="stylesheet" href="css/style.css" type="text/css" />
    	<%--<link rel="stylesheet" href="<%=request.getContextPath()%>/market/help/css/style.css" type="text/css" />--%>
    	<script type="text/javascript" src="<%=path%>/public/core/EasyuiZX.js"></script>
    	<script type="text/javascript">
            $(function () {
//                switchMainMenu($("#service"));
                switchMenu($("#mnu_privacy"));
            });
    	</script>
	</head>
	<body>
		<jsp:include page="../main/header.jsp" flush="true"></jsp:include>
        <jsp:include page="helpmenu.jsp" flush="true"></jsp:include>
        <%--<div style="border:1px solid #dcdcdc;padding-left:225px;width:1000px">
            <img style="" src="<%=path%>/market/main/images/identify.jpg"/>
        </div>--%>
        <div class="detailR"<%-- style="padding-left:225px;width:775px; float:left;"--%>>
            <div class="pers_cen_div mt">
                <div class="pers_cen_title">
                    <h3>隐私条款</h3>
                </div>
                <div class="pers_cen_con">
                    <div class="announce_content">
                        <h2>韩塑美保护用户隐私条款</h2>
                        <p >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;韩塑美承诺尊重您的隐私和您的个人信息安全。韩塑美并且承诺尽可能地为您提供最佳的服务。比如，韩塑美会利用通过网站运作而收集到的这些信息， 来制定您的个性化沟通方式和购物经历、也可以更好地对您的客户服务调查做出反应、对您的订单和帐户信息及客户服务需求与您进行沟通、就韩塑美网站中的商品和活动与您进行沟通以及为了其他推广宣传目的、优化管理、促销、调查等其他本网站的特别项目使用这些信息。韩塑美也可以用这样的信息来阻止可能的被禁止项目和非法活动，用以加强使用规则和条款的实施，并用以解决争议和保护其合法的私有财产权益及解决涉及韩塑美的交易活动而产生的问题。</p>

                        <br>
                        <p >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;韩塑美不可以向任何其他人出售或出租您的个人信息。但如果是为经营目的需要的，韩塑美可以将信息交付给一些服务提供商只在为韩塑美的经营来使 用。例如，他们负责处理韩塑美的装运业务、数据管理业务、电子邮件发送业务、市场调查业务、信息分析业务和促销管理业务。买卖韩塑美网站上的商品， 查阅数据资料、销售信函、市场调查、分析报告和促销手段。韩塑美提供给其服务提供商的个人信息的前提是他们需要这些信息来完成其服务并同时承诺尽可 能保护您的个人信息。</p>
                        <br>
                        <p >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在极少数情况下，韩塑美可以透露特定的信息，例如，政府机构请求、法院调查令等法律规定的情况，以及为执行本网站的政策或保护他人的权益、财产 和安全。韩塑美也会和那些协助进行诈骗防范和调查的公司共享信息。下在法律范围内响应法院指令，以便加强本网站的管理政策或保护他人的权利、财产或 保险。韩塑美同时与公司分享信息协助保护或调查。韩塑美不会提供信息给那些推销和商业目的公司或代理机构行。
                        </p>
                        <p >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;韩塑美会将非常认真地保护您的个人信息。然而，尽管韩塑美已经尽力了，但是仍有第三方通过非法手段在中途截取发送的信息的风险。这在所有互联网 使用中都是真实存在的。以至于韩塑美无法完全保证您传送的任何信息的安全。发送任何信息的风险都您都须承担。特别是，韩塑美将采取所有合理的预防措 施来确保您的订购和付款详细信息的安全，除非韩塑美存在疏忽，否则韩塑美将不承担因您提供的信息被非法侵入而造成您和第三方的相应损失。</p>
                        <br>
                        <p >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;韩塑美决不会发送电子邮件来向您索要登录帐户和密码。如果您接收了这样的电子邮件，绝对不要回复。为了帮助我们与这些诈骗行动做斗争，请将该原 始的电子邮件转发到531824869@qq.com以便我们对它进行调查。</p>
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