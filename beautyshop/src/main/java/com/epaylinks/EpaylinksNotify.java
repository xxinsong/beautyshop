package com.epaylinks;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
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
 * 请求应答协助类
 * @author fenghanhao
 *
 */
public class EpaylinksNotify {

    /** 商户密钥 */
    private String key;

    /** 应答的参数 */
    private SortedMap parameters;

    /** 调试信息 */
    private String debugMsg;

    private HttpServletRequest request;

    private HttpServletResponse response;

    private String urlEncoding;

    /**
     * 构造函数
     *
     * @param request
     * @param response
     */
    public EpaylinksNotify(HttpServletRequest request,
                           HttpServletResponse response)  {
        this.request = request;
        this.response = response;

        this.key = "";
        this.parameters = new TreeMap();
        this.debugMsg = "";

        this.urlEncoding = "";

        Map m = this.request.getParameterMap();
        Iterator it = m.keySet().iterator();
        while (it.hasNext()) {
            String k = (String) it.next();
            String v = ((String[]) m.get(k))[0];
            this.setParameter(k, v);
        }

    }

    /**
     *获取密钥
     */
    public String getKey() {
        return key;
    }

    /**
     *设置密钥
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
     * 使用SHA256算法验证签名。规则是:按参数名称a-z排序,遇到空值的参数不参加签名。
     * @return boolean
     */
    public boolean verifySign() {
        StringBuffer sb = new StringBuffer();
        Set es = this.parameters.entrySet();
        Iterator it = es.iterator();
        while(it.hasNext()) {
            Map.Entry entry = (Map.Entry)it.next();
            String k = (String)entry.getKey();
            String v = (String)entry.getValue();
            if(!"sign".equals(k) && null != v && !"".equals(v)) {
                sb.append(k + "=" + v + "&");
            }
        }

        sb.append("key=" + this.getKey());

        //算出摘要
        String enc = ToolUtil.getCharacterEncoding(this.request, this.response);
        String sign = SHA256Util.SHA256Encode(sb.toString(), enc).toLowerCase();

        String tenpaySign = this.getParameter("sign").toLowerCase();

        //debug信息
        this.setDebugMsg(sb.toString() + " => sign:" + sign +
                " epaylinksSign:" + tenpaySign);

        return tenpaySign.equals(sign);
    }

    /**
     * 返回处理结果给支付网关服务器。
     * @param msg: Success or fail。
     * @throws IOException
     */
    public void responseToGateway(String msg) throws IOException {
        String strHtml = msg;
        PrintWriter out = this.getHttpServletResponse().getWriter();
        out.println(strHtml);
        out.flush();
        out.close();

    }

    /**
     * 获取uri编码
     * @return String
     */
    public String getUrlEncoding() {
        return urlEncoding;
    }

    /**
     * 设置url编码
     * @param uriEncoding
     * @throws UnsupportedEncodingException
     */
    public void setUrlEncoding(String uriEncoding)
            throws UnsupportedEncodingException {
        if (!"".equals(uriEncoding.trim())) {
            this.urlEncoding = uriEncoding;

            // 编码转换
            String enc = ToolUtil.getCharacterEncoding(request, response);
            Iterator it = this.parameters.keySet().iterator();
            while (it.hasNext()) {
                String k = (String) it.next();
                String v = this.getParameter(k);
                v = new String(v.getBytes(uriEncoding.trim()), enc);
                this.setParameter(k, v);
            }
        }
    }

    /**
     *获取调试信息
     */
    public String getDebugMsg() {
        return debugMsg;
    }

    /**
     *设置调试信息
     */
    protected void setDebugMsg(String debugInfo) {
        this.debugMsg = debugInfo;
    }

    protected HttpServletRequest getHttpServletRequest() {
        return this.request;
    }

    protected HttpServletResponse getHttpServletResponse() {
        return this.response;
    }

}
