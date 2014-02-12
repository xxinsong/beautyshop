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
    	<script type="text/javascript" src="<%=path%>/public/core/EasyuiZX.js"></script>
    	<script type="text/javascript" src="<%=path%>/market/msg/js/mymessage.js"></script>
	</head>
	<body>
		<jsp:include page="../main/header.jsp" flush="true"></jsp:include>
		<jsp:include page="../main/leftmenu.jsp" flush="true"></jsp:include>
		<div class="detailR">
     		<div class="pers_cen_div mt">
                <div class="pers_cen_title">
                	<h3>我的消息</h3>
                </div>
                <div class="pers_cen_con">                	
                    <div class="my_order_div">
                    	<div class="my_consult_list alignC clearfix">
                    	  	<table id="message_list"  width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr class="th_title">
                                    <th colspan="4" style=" font-weight:bold;"><i class="mailico"></i>我的消息</th>
                                </tr>
                                <tr>
                                	<th style="width:10%;">类型</th>
                                	<th style="width:50%;">内容</th>	
                                	<th>最后更新时间</th>
                                	<th>操作</th>
                                </tr>
                                <tr  id="row_tpl" style="display: none;">
                                    <td name="msg_type">商品评价</td>
                                    <td style="text-align:left; padding-left:10px;" name="msg_content">
                                      您的评价已发布成功
                                  	</td>
                                    <td name="send_time">123123</td>
                                    <td >
                                    	<a name="operation" href="#" class="blue_font" style="display: none;" >删除</a>
                                    	<span name="nooper" style="display: none;">暂无操作</span>
                                    </td>
                                </tr>
                  	    	</table>                        	
                        </div>
                    </div>
                    <div id="order_page" style="display: block;" class="turnPageBottom">
            		</div>
                    <div class="clear"></div>               	
      			</div>
            </div>
        </div>
		<div class="clear"></div>
		<div class="consult_div" id="consult_tpl_answer" style="display: none;">
			<div class="faq"><span name="content"></span><span class="faq_time" name="commit_time"></span></div>
			<div class="answer" name="answer"><span name="reply_content"></span><span class="faq_time" name="reply_time"></span></div>
         </div>
         <div class="consult_div" id="consult_tpl_noanswer" style="display: none;">
			<div class="faq"><span name="content"></span><span class="faq_time" name="commit_time"></span></div>
			<div class="noAnswer" name="noAnswer"></div>
         </div>
	<jsp:include page="../main/footer.jsp" flush="true"></jsp:include>
	</body>
</html>