package com.qimeng.bs.payment;

import chinapay.PrivateKey;
import chinapay.SecureLink;
import com.epaylinks.EpaylinksNotify;
import com.epaylinks.EpaylinksSubmit;
import com.qimeng.bs.common.controller.GenericController;
import com.qimeng.bs.common.service.DcSystemConfigService;
import com.qimeng.bs.login.bean.LoginInfo;
import com.qimeng.bs.market.order.bean.DmTradeLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * User: Simon
 * Date: 14-3-4
 */
@Controller

public class PaymentController extends GenericController {

    @Autowired
    private PaymentService paymentService;
    @Autowired
    private DcSystemConfigService systemConfigService;

    @RequestMapping("/easypay")
    public ModelAndView easypayPage(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
        String partner = systemConfigService.getSystemParamValue("EASYPAY_PARTNER_ID");
//        String partner = "130";  //130测试商户号只能在219.136.207.190 测试服务器上使用
        String key = systemConfigService.getSystemParamValue("EASYPAY_PARTNER_KEY");
        String gatewayUrl = systemConfigService.getSystemParamValue("EASYPAY_GATEWAYURL");
//        String key = "857e6g8y51b5k365f7v954s50u24h14w"; //这是130测试商户密钥
//商户订单号，此处用系统当前毫秒数，商户根据自己情况调整，确保该订单号在商户系统中的全局唯一
        String orderNo = request.getParameter("orderNo"); //这是采用系统毫秒数作为订单号样例
//支付金额
        String amount = request.getParameter("amount");

        LoginInfo currUser = getCurrentLoginUser();
        String memo = String.valueOf(currUser.getUserId());
//        BASE64Encoder encoder = new BASE64Encoder();
//        String base64_memo = encoder.encode(memo.getBytes("ISO-8859-1")).toString();

        request.setAttribute("partner",partner);
        request.setAttribute("key",key);
        request.setAttribute("orderNo",orderNo);
        request.setAttribute("amount",amount);
        request.setAttribute("memo",memo);
        request.setAttribute("gatewayUrl",gatewayUrl);
//币种(目前只支持人民币)
//商户密钥
//接口版本
//        String version = "3.0";
//签名类型
//        String sign_type = "SHA256";
        /*String basePath = request.getScheme() + "://" + request.getServerName();
//交易完成后跳转的URL，用来接收易票联网关的页面转跳即时通知结果
        String return_url = basePath + "/easypay/return";
//接收易票联支付网关异步通知的URL
        String notify_url = basePath + "/easypay/notify";
//直连银行参数（不停留易票联支付网关页面，直接转跳到银行支付页面）
//String pay_id = "zhaohang";  //直连招商银行参数值
        String pay_id = "";*/
//订单备注，该信息使用64位编码提交服务器，并将在支付完成后随支付结果原样返回

/*//支付请求对象
        EpaylinksSubmit epaySubmit = new EpaylinksSubmit(request, response);
//设置商户密钥
        epaySubmit.setKey(key);
//epaySubmit.setGatewayUrl("https://www.epaylinks.cn/paycenter/v2.0/getoi.do");  //生产服务器
        epaySubmit.setGatewayUrl("http://219.136.207.190:80/paycenter/v2.0/getoi.do");   //测试服务器

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
        System.out.println("debugMsg:" + debugMsg);*/
        return new ModelAndView("/pay/easypay/easypayapi.jsp");
    }

    @RequestMapping("/netpay")
    public ModelAndView netpayPage(HttpServletRequest request) {

    /*
    接口版本号
     */
        String Version = "20070129";
    /*
    商户号，长度为15个字节的数字串，由ChinaPay或清算银行分配。
     */
        String MerId = systemConfigService.getSystemParamValue("NETPAY_MERCHENT_ID");
//        String MerId = "808080201303825";
//        String MerId = "880000000001070";
    /*
    订单号，长度为16个字节的数字串，由商户系统生成，失败的订单号允许重复支付。
    在支付版本为20040916中，如果商户为二级商户（即商户号前6位为808080的），订单号从第5位到第9位必须和商户号的第11位到第15位相同
     */
        String ordId = request.getParameter("orderNo");
        String OrdId = getOrdId(ordId, Version, MerId);
    /*
    交易金额，长度为12个字节的数字串，例如：数字串"000000001234"表示12.34元。
     */
        String transAmt = request.getParameter("amount");
        String TransAmt = getTranAmt(transAmt);
    /*
    货币代码, 长度为3个字节的数字串，目前只支持人民币，取值为"156" 。
     */
        String CuryId = "156";
    /*
    交易日期，长度为8个字节的数字串，表示格式为：YYYYMMDD。
     */
        String TransDate = new SimpleDateFormat("yyyyMMdd").format(new Date());
    /*
    交易类型，长度为4个字节的数字串，取值范围为："0001"和"0002"， 其中"0001"表示消费交易
     */
        String TransType = "0001";
    /*
    后台交易接受URL，长度不要超过80个字符
    后台接受应答地址，用于商户记录交易信息和处理。URL不能包含参数，如果需要参数，可以吧参数填写在“商户私有域”（Privl）字段中
    ChinaPay会根据后台发送的http的返回码来判定收费重新发送后台应答流水，以确保后台应答的接收
     */
        String path = request.getScheme() + "://" + request.getServerName();
        String BgRetUrl = path + "/netpay/notify";
    /*
    页面交易接收URL，长度不要超过80个字节
    接收应答地址，用于引导使用者支付后返回商户网站页面
     */
        String PageRetUrl = path + "/netpay/return";//"http://127.0.0.1/chinapayReturn.jsp";
    /*
    支付网关号，可选
    如果填写，支付者将直接进入支付页面，否则进入网关选择页面
     */
        String GateId = "";//"8607";
    /*
    商户私有域，可选，长度不要超过60个字节
    商户通过此字段向Chinapay发送信息，Chinapay将原有填充返回给商户
     */
        LoginInfo currUser = getCurrentLoginUser();
        String Priv1 = String.valueOf(currUser.getMerchantId());
    /*
    即NetPayClient根据上述输入参数生成的商户数字签名，长度为256字节的字符串。
     */
        String ChkValue = "";
    /*
    境外版本还需要使用以下6个数据
     */
        String CountryId = request.getParameter("CountryId");
        String TransTime = request.getParameter("TransTime");
        String TimeZone = request.getParameter("TimeZone");
        String DSTFlag = request.getParameter("DSTFlag");
        String Priv2 = request.getParameter("Priv2");
        String ExtFlag = "00";
        //MerPrK.key 文件校验
        String merPrkPath = systemConfigService.getSystemParamValue("NETPAY_MERKEY_FILEPATH");//"F:\\workshop\\beautyshop\\beautyshop\\key\\MerPrK.key";
        PrivateKey key = new PrivateKey();
        boolean flag = key.buildKey(MerId, 0, merPrkPath);
        if (!flag) {
            System.out.println("build key error!");
            return null;
        }
        //获取签名
        SecureLink sl = new SecureLink(key);
        try {
            if (Version.equalsIgnoreCase("20070129")) {//20070129版本签名方法
                ChkValue = sl.Sign(MerId + OrdId + TransAmt + CuryId + TransDate + TransType + Priv1);
            } else if (Version.equalsIgnoreCase("20100304")) {//防钓鱼版本签名方法
                String ClientIp = null;
                if (request.getHeader("X-Forwarded-For") == null) {
                    ClientIp = request.getRemoteAddr();
                } else {
                    ClientIp = request.getHeader("X-Forwarded-For");
                }
                ChkValue = sl.Sign(MerId + OrdId + TransAmt + CuryId + TransDate + TransType + Priv1 + ClientIp);
            } else if (Version.equalsIgnoreCase("20080515")) {
                // 境外版本签名方法
                ChkValue = sl.Sign(MerId + OrdId + TransAmt + CuryId + TransDate + TransTime + TransType + CountryId + TimeZone + DSTFlag + ExtFlag + Priv1);
            } else {
                // 早期版本签名方法
                ChkValue = sl.signOrder(MerId, OrdId, TransAmt, CuryId, TransDate, TransType);
            }
            /*HttpClient httpClient = new HttpClient();
            httpClient.getParams().setParameter(
                    HttpMethodParams.HTTP_CONTENT_CHARSET, "utf-8");
            postMethod = new PostMethod(url);*/

            request.setAttribute("MerId", MerId);
            request.setAttribute("OrdId", OrdId);
            request.setAttribute("TransAmt", TransAmt);
            request.setAttribute("CuryId", CuryId);
            request.setAttribute("TransDate", TransDate);
            request.setAttribute("TransType", TransType);
            request.setAttribute("Version", Version);
            request.setAttribute("BgRetUrl", BgRetUrl);
            request.setAttribute("PageRetUrl", PageRetUrl);
            request.setAttribute("GateId", GateId);
            request.setAttribute("Priv1", Priv1);
            request.setAttribute("ChkValue", ChkValue);
            request.setAttribute("CountryId", CountryId);
            request.setAttribute("TransTime", TransTime);
            request.setAttribute("TimeZone", TimeZone);
            request.setAttribute("DSTFlag", DSTFlag);
            request.setAttribute("Priv2", Priv2);
            request.setAttribute("ExtFlag", ExtFlag);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return new ModelAndView("/pay/netpay/netpayapi.jsp");
    }


    private String getOrdId(String ordId, String version, String merId) {
        if ("20040916".equals(version)) {
            String subMerId = merId.substring(10, 15);
            StringBuilder ordIdSb = new StringBuilder(ordId);
            ordIdSb.insert(4, subMerId);
            ordId = ordIdSb.toString();
        }
        int ordL = ordId.length();
        for (int i = 0; i < 16 - ordL; i++) {
            ordId = "0" + ordId;
        }
        return ordId;
    }

    private String getTranAmt(String tranAmt) {
        DecimalFormat df = new DecimalFormat("########0.00");
        tranAmt = df.format(Float.parseFloat(tranAmt));
        tranAmt = tranAmt.replace(".", "");
        int taL = tranAmt.length();
        for (int i = 0; i < 12 - taL; i++) {
            tranAmt = "0" + tranAmt;
        }
        return tranAmt;
    }

    @RequestMapping("/netpay/return")
    public ModelAndView netpayReturnPage(HttpServletRequest request) {
        return new ModelAndView("redirect:/order");
    }

    @RequestMapping("/easypay/return")
    public ModelAndView easypayReturnPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
        easypayNotify(request,response);
        return new ModelAndView("redirect:/order");
    }

    @RequestMapping("/easypay/notify")
    public void easypayNotify(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String key = systemConfigService.getSystemParamValue("EASYPAY_PARTNER_KEY");//"857e6g8y51b5k365f7v954s50u24h14w";

        //创建支付应答对象
        EpaylinksNotify notify = new EpaylinksNotify(request, response);
        notify.setKey(key);

        //验证签名
        if (notify.verifySign()) {

            String partner = notify.getParameter("partner");
            String out_trade_no = notify.getParameter("out_trade_no");
            String pay_no = notify.getParameter("pay_no");
            String amount = notify.getParameter("amount");
            String pay_result = notify.getParameter("pay_result");
            String sett_date = notify.getParameter("sett_date");
            String base64_memo = notify.getParameter("base64_memo");
            String version = notify.getParameter("version");
            String sign_type = notify.getParameter("sign_type");
            String sign = notify.getParameter("sign");

            BASE64Decoder decoder = new BASE64Decoder();
            String memo = new String(decoder.decodeBuffer(base64_memo)).toString();
            DmTradeLog log = new DmTradeLog();
            log.setOrderNo(out_trade_no);
            log.setAmount(amount);
            log.setInterfaceType("EASYPAY");
            log.setStartTime(new Date());
            log.setAcceptContent(pay_result);
            if( "1".equals(pay_result)) {
                //处理业务开始
                if(!paymentService.responseAccepted(out_trade_no)){
                    log.setTradeResult("交易成功");
                    paymentService.paymentOK(memo, out_trade_no, log);

                    //后台打印异步通知信息
//                    System.out.println("获取异步通知信息成功!");
//                    System.out.println("<br/>success<br/><br/>");
//                    System.out.println("商家ID："+partner);
//                    System.out.println("商家系统订单号："+out_trade_no);
//                    System.out.println("网关系统支付号："+pay_no);
//                    System.out.println("订单金额："+amount);
//                    System.out.println("支付结果（1表示成功）："+pay_result);
//                    System.out.println("清算日期："+sett_date);
//                    System.out.println("订单备注："+memo);
//                    System.out.println("接口版本："+version);
//                    System.out.println("签名算法："+sign_type);
//                    System.out.println("签名："+sign);
                }
                //注意交易单不要重复处理
                //注意判断返回金额

                //处理业务完毕

            } else {
                if(!paymentService.responseAccepted(out_trade_no)){
                    log.setTradeResult("交易验证失败");
                    paymentService.paymentFail(log);
                }
                //当做不成功处理
//                System.out.println("获取异步通知失败！");
//                System.out.println("商家系统订单号："+out_trade_no);
//                System.out.println("支付结果（0表示未支付，2表示支付失败）："+pay_result);


            }
            //返回Success给易票联网关服务器，表示已经收到后台通知，不必再次发送通知
            notify.responseToGateway("success");

        } else {
            System.out.println("验证签名失败");
        }
//获取debug信息,建议把debug信息写入日志，方便定位问题
        String debugMsg = notify.getDebugMsg();
        System.out.println("debugMsg:" + debugMsg);

    }

    @RequestMapping("/netpay/notify")
    public void netpayNotify(HttpServletRequest request) {
        String TransDate = request.getParameter("transdate");
        String MerId = request.getParameter("merid");
        String OrdId = request.getParameter("orderno");
        String TransType = request.getParameter("transtype");
        String TransAmt = request.getParameter("amount");
        String CuryId = request.getParameter("currencycode");
        String OrderStatus = request.getParameter("status");
        String ChkValue = request.getParameter("checkvalue");
        String status = request.getParameter("status");
        String merchantId = request.getParameter("Priv1");

        chinapay.PrivateKey key = new chinapay.PrivateKey();
        chinapay.SecureLink t;
        boolean flag;
        boolean flag1;
        String msg = "";

        String pubKey = systemConfigService.getSystemParamValue("NETPAY_MERKEY_FILEPATH");
        flag = key.buildKey("999999999999999", 0, pubKey);
        if (flag == false) {
            msg = "build key error!";
            return;
        }

        t = new chinapay.SecureLink(key);
        flag1 = t.verifyTransResponse(MerId, OrdId, TransAmt, CuryId, TransDate, TransType, OrderStatus, ChkValue);

        DmTradeLog log = new DmTradeLog();
        log.setOrderNo(OrdId);
        log.setAmount(TransAmt);
        log.setInterfaceType("NETPAY");
        log.setStartTime(new Date());
        log.setAcceptContent(status);
        if (flag1 == false) {
            System.out.println("交易验证失败!");
            msg = "交易验证失败!";
            log.setTradeResult("交易验证失败");
            paymentService.paymentFail(log);
        } else {
		/* …... 数据库更新等相关处理过程 */
            //验证签名数据通过后，一定要判定交易状态代码是否为"1001"，实现代码请商户自行编写。
            //注意：如果您在提交时同时填写了页面返回地址和后台返回地址，且地址相同，请先做一次数据库查询判断订单状态，以防止重复处理该笔订单
            if ("1001".equals(status)) {
                log.setTradeResult("交易成功");

                paymentService.paymentOK(merchantId, OrdId, log);
            } else {
                paymentService.paymentFail(log);
            }
        }
    }
}
