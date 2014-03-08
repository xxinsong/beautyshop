package com.epaylinks;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.epaylinks.util.SHA256Util;
import com.epaylinks.util.ToolUtil;

/**
 * 提交请求协助类
 * @author fenghanhao
 *
 */
public class EpaylinksSubmit {

    /** 网关url地址 */
    private String gatewayUrl;

    /** 商户密钥 */
    private String key;

    /** 请求的参数 */
    private SortedMap parameters;

    /** 调试信息 */
    private String debugMsg;

    private HttpServletRequest request;

    private HttpServletResponse response;

    /**
     * 构造函数
     * @param request
     * @param response
     */
    public EpaylinksSubmit(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.gatewayUrl = "https://www.epaylinks.cn/paycenter/v2.0/getoi.do";
        this.key = "";
        this.parameters = new TreeMap();
        this.debugMsg = "";
    }

    /**
     *获取入口地址,不包含参数值
     */
    public String getGatewayUrl() {
        return gatewayUrl;
    }

    /**
     *设置入口地址,不包含参数值
     */
    public void setGatewayUrl(String gatewayUrl) {
        this.gatewayUrl = gatewayUrl;
    }

    /**
     *获取商户密钥
     */
    public String getKey() {
        return key;
    }

    /**
     *设置商户密钥
     */
    public void setKey(String key) {
        this.key = key;
    }

    /**
     * 获取参数值
     * @param parameter 参数名称
     * @return String
     */
    public String getParameter(String parameter) {
        String s = (String)this.parameters.get(parameter);
        return (null == s) ? "" : s;
    }

    /**
     * 设置参数值
     * @param parameter 参数名称
     * @param parameterValue 参数值
     */
    public void setParameter(String parameter, String parameterValue) {
        String v = "";
        if(null != parameterValue) {
            v = parameterValue.trim();
        }
        this.parameters.put(parameter, v);
    }

    /**
     * 返回所有的参数
     * @return SortedMap
     */
    public SortedMap getAllParameters() {
        return this.parameters;
    }

    /**
     *获取调试信息
     */
    public String getDebugMsg() {
        return debugMsg;
    }

    /**
     * 获取请求的URL地址，此地址包含参数和签名串
     * @return String
     * @throws UnsupportedEncodingException
     */
    public String getRequestURL() throws UnsupportedEncodingException {

        this.buildRequestSign();

        StringBuffer sb = new StringBuffer();
        String enc = ToolUtil.getCharacterEncoding(this.request, this.response);
        Set es = this.parameters.entrySet();
        Iterator it = es.iterator();
        while(it.hasNext()) {
            Map.Entry entry = (Map.Entry)it.next();
            String k = (String)entry.getKey();
            String v = (String)entry.getValue();
            sb.append(k + "=" + URLEncoder.encode(v, enc) + "&");
        }

        //去掉最后一个&
        String reqPars = sb.substring(0, sb.lastIndexOf("&"));

        return this.getGatewayUrl() + "?" + reqPars;

    }

    public void doSend() throws UnsupportedEncodingException, IOException {
        this.response.sendRedirect(this.getRequestURL());
    }

    /**
     * 使用SHA256算法生成签名结果,规则是:按参数名称a-z排序,遇到空值的参数不参加签名。
     */
    public void buildRequestSign() {
        StringBuffer sb = new StringBuffer();
        Set es = this.parameters.entrySet();
        Iterator it = es.iterator();
        while(it.hasNext()) {
            Map.Entry entry = (Map.Entry)it.next();
            String k = (String)entry.getKey();
            String v = (String)entry.getValue();
            if(null != v && !"".equals(v)
                    && !"sign".equals(k) && !"key".equals(k)) {
                sb.append(k + "=" + v + "&");
            }
        }
        sb.append("key=" + this.getKey());

        String enc = ToolUtil.getCharacterEncoding(this.request, this.response);
        String sign = SHA256Util.SHA256Encode(sb.toString(), enc).toLowerCase();

        this.setParameter("sign", sign);

        //调试信息
        this.setDebugMsg(sb.toString() + " => sign:" + sign);

    }

    /**
     *设置调试信息
     */
    protected void setDebugMsg(String debugMsg) {
        this.debugMsg = debugMsg;
    }

    protected HttpServletRequest getHttpServletRequest() {
        return this.request;
    }

    protected HttpServletResponse getHttpServletResponse() {
        return this.response;
    }

}
