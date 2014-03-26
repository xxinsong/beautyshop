<%@ page import="sun.misc.BASE64Encoder" %>
<%@ page import="com.epaylinks.EpaylinksSubmit" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<%
    //易票联支付网关支付请求示例
//商户号
    String partner = (String) request.getAttribute("partner");
//    String partner = "130";  //130测试商户号只能在219.136.207.190 测试服务器上使用
//商户订单号，此处用系统当前毫秒数，商户根据自己情况调整，确保该订单号在商户系统中的全局唯一
    String out_trade_no = (String) request.getAttribute("orderNo"); //这是采用系统毫秒数作为订单号样例
//支付金额
    String total_fee = (String) request.getAttribute("amount");
//币种(目前只支持人民币)
    String currency_type = "RMB";
//创建订单的客户端IP（消费者电脑公网IP）
    String order_create_ip = request.getRemoteAddr();  //创建订单的客户端IP（消费者电脑公网IP，用于防钓鱼支付）
//商户密钥
    String key = (String) request.getAttribute("key");
//    String key = "857e6g8y51b5k365f7v954s50u24h14w"; //这是130测试商户密钥
//接口版本
    String version = "3.0";
//签名类型
    String sign_type = "SHA256";
    Integer port = request.getServerPort();
    String basePath = request.getScheme() + "://" + request.getServerName()+(port!=null?(":"+port):"");
//交易完成后跳转的URL，用来接收易票联网关的页面转跳即时通知结果
    String return_url = basePath + "/easypay/return";
//接收易票联支付网关异步通知的URL
    String notify_url = basePath + "/easypay/notify";

    System.out.println("return_url:"+return_url);
//直连银行参数（不停留易票联支付网关页面，直接转跳到银行支付页面）
//String pay_id = "zhaohang";  //直连招商银行参数值
    String pay_id = "";
//订单备注，该信息使用64位编码提交服务器，并将在支付完成后随支付结果原样返回
    String memo = (String) request.getAttribute("memo");
    BASE64Encoder encoder = new BASE64Encoder();
    String base64_memo = encoder.encode(memo.getBytes("ISO-8859-1")).toString();

//支付请求对象
    EpaylinksSubmit epaySubmit = new EpaylinksSubmit(request, response);
//设置商户密钥
    epaySubmit.setKey(key);
    String gatewayUrl = (String) request.getAttribute("gatewayUrl");
//epaySubmit.setGatewayUrl("https://www.epaylinks.cn/paycenter/v2.0/getoi.do");  //生产服务器
    epaySubmit.setGatewayUrl(gatewayUrl);   //测试服务器 "http://219.136.207.190:80/paycenter/v2.0/getoi.do"

//设置支付请求参数
    epaySubmit.setParameter("partner", partner);		        //商户号
    epaySubmit.setParameter("out_trade_no", out_trade_no);		//商家订单号
    epaySubmit.setParameter("total_fee", total_fee);			//商品金额,以元为单位
    epaySubmit.setParameter("return_url", return_url);		    //交易完成后跳转的URL
    epaySubmit.setParameter("notify_url", notify_url);		    //接收后台通知的URL
    epaySubmit.setParameter("currency_type", currency_type);	//货币种类
    epaySubmit.setParameter("order_create_ip",order_create_ip); //创建订单的客户端IP（消费者电脑公网IP，用于防钓鱼支付）
    epaySubmit.setParameter("version", version);				//接口版本
    epaySubmit.setParameter("sign_type", sign_type);			//签名算法（暂时只支持SHA256）

//可选参数
    epaySubmit.setParameter("pay_id", pay_id);	        		//直连银行参数，例子是直接转跳到招商银行时的参数
    epaySubmit.setParameter("base64_memo", base64_memo);		//订单备注的BASE64编码

//获取提交到网关的请求地址
    String requestUrl = epaySubmit.getRequestURL();

//获取调试信息
    String debugMsg = epaySubmit.getDebugMsg();

    System.out.println("requestUrl:" + requestUrl);
    System.out.println("debugMsg:" + debugMsg);
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="library" content="market"/>
    <title>深圳市韩塑美生物医学科技有限公司是一家化妆品面膜垂直电商为一体的分享平台互联网公司</title>
    <script type="text/javascript" src="<%=path%>/public/core/EasyuiZX.js"></script>
    <script type="text/javascript" src="<%=path%>/pay/easypay/easypay.js"></script>
</head>
<body>

<div style="display: 'none';">
    <%--<a target="_blank" href="<%=requestUrl %>">易票联支付</a>--%>
    <form id="easypayForm" name="easypayForm" action="<%=requestUrl %>" method="POST">
        <input type="hidden" name="partner" value="<%=partner%>">
        <input type="hidden" name="total_fee" value="<%=total_fee%>">
        <input type="hidden" name="out_trade_no" value="<%=out_trade_no%>">
        <input type="hidden" name="currency_type" value="<%=currency_type%>">
        <input type="hidden" name="order_create_ip" value="<%=order_create_ip%>">
        <input type="hidden" name="return_url" value="<%=return_url%>">
        <input type="hidden" name="notify_url" value="<%=notify_url%>">
        <input type="hidden" name="version" value="<%=version%>">
        <input type="hidden" name="base64_memo" value="<%=base64_memo%>">
    </form>
</div>
</body>
</html>