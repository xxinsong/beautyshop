<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="library" content="market" />
<title>数据超市</title>
<script type="text/javascript" src="<%=path%>/public/core/EasyuiZX.js"></script>
<script type="text/javascript" src="<%=path%>/market/notice/js/dmnotice.js"></script>
</head>
<body>
<jsp:include page="../main/header.jsp" flush="true"></jsp:include>
<div class="contaiter">
  <div class="w m2 mt">
    <div class="checkout">
      <div class="checkout_steps">
	    <div class="steps step_complete" style="display:block;">
          <div class="step_title">
	        <div class="step_right"></div>
	        <strong>公告标题</strong>
	      </div>
		  <div class="step_content">
		    <div class="sbox_wrap consignee">
		      <div class="sbox">
                <div class="form">
                  <div class="consignee_list">
                    <div class="item">
                      <label id="contact_info">
                      </label>
                    </div>
                    <div style="display:block" class="invoice_note">
                    	<p>尊敬的用户：
                    	<br/>
		                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您好，因中国工商银行借记卡快捷渠道进行优化升级维护，自1月9日起，工行借记卡快捷支付渠道将暂停服务，如给您带来了不便，敬请谅解。维护完毕会及时开通，具体开通时间以实际公告为准，请您多留意易购公告栏
		           		</p>
		           		<p>商户营销平台</p>
		           		<p>2014年1月4日</p>
                    </div>		
                  </div>		
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
	</div>
  </div>
</div>
<jsp:include page="../main/footer.jsp" flush="true"></jsp:include>
</body>
</html>
