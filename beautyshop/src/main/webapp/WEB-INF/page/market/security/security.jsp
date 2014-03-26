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
    	<script type="text/javascript" src="<%=path%>/public/core/EasyuiZX.js"></script>
    	<script type="text/javascript" src="<%=path%>/market/security/js/security.js"></script>
	</head>
	<body>
		<jsp:include page="../main/header.jsp" flush="true"></jsp:include>
		<jsp:include page="../main/leftmenu.jsp" flush="true"></jsp:include>
		<div class="detailR">
     		<div class="pers_cen_div mt">
                <div class="pers_cen_title">
                	<h3>安全中心</h3>
                </div>
            </div>
            <div class="pers_cen_con">
                <div class="saveLevel">
                	安全级别：
                	<span class="saveLevelWarp">
                    	<span id="level">强</span>
                    	<span  id="levelIco" class="saveLevelCon levelStronger"><em></em></span>
                    </span>
                </div> 
                <div class="saveDiv">
                	<%--<div class="m" id="userPhone">
                   		<div class="fore1"><i class="saveico-1" id="userPhone_ioc"></i><span>手机验证</span></div>
               	  		<div class="fore2"><span style="color:#2AB33B;">您已成功验证手机。</span></div>
                        <div class="clear"></div>
                  	</div>--%>
               	  	<div class="m" id="pass">
                   		<div class="fore1"><i class="saveico-1"></i><span>登录密码</span></div>
               	  		<div class="fore2"><span style="color:#999;">互联网帐号存在被盗风险，建议您定期更改密码以保护账户安全。</span></div>
                    	<div class="fore3"><a href="javascript:void(0)" id="updUserPass">修改</a></div>
                        <div class="clear"></div>
                  	</div>
               	  	<div class="m" id="email">
                   		<div class="fore1"><i class="saveico-2" id="email_ioc"></i><span>邮箱验证</span></div>
               	  		<div class="fore2" id="email_msg"><span  style="color:#f16f15;">您尚未验证个人邮箱，建议验证您的个人邮箱，以提高您的账户安全。</span></div>
                    	<div class="fore3"><a href="javascript:void(0)" id="email_oper">验证</a></div>
                        <div class="clear"></div>
                  	</div>
                  	<div class="m" id="pasQues">
                   		<div class="fore1"><i class="saveico-2" id="pasQues_ioc"></i><span>密保问题</span></div>
               	  		<div class="fore2" id="pasQues_msg"><span style="color:#f16f15;">您尚未验证密保问题，建议您验证你的密保问题，以提高您的账户安全。</span></div>
                    	<div class="fore3"><a href="#" id="pasQues_oper" id="pasQues_oper">验证</a></div>
                        <div class="clear"></div>
                  	</div>
                </div>   
            	<div class="saveKey">
                	<div class="keyImg"><img src="<%=path%>/market/main/images/save_key.png" width="90" height="90" /></div>
                  	<div class="keyInfo">
                    	<p class="title"><strong>安全服务提示</strong></p>
                        <p>1.注意防范进入钓鱼网站，不要轻信各种即时通讯工具发送的商品或支付链接，谨防网购诈骗。</p>
                        <p>2.建议您安装杀毒软件，并定期更新操作系统等软件补丁，确保账户及交易安全。 </p>
                    </div>
                </div>        	
          	</div>
        </div>
		<div class="clear"></div>
		<div class="trans_div" style="display: none;" id="userSecurity_bg"></div>
		<div class="login_pop" style="width: 508px; display: none;" id="user_password">
			<h2>
				修改登录密码<a href="javascript: void(0)" class="pop_close" onclick="closeMesBox('user_password')">关闭</a>
			</h2>
			<div class="login_pop_table">
				<table width="80%" border="0" cellspacing="0" cellpadding="0" class="form_table" style="margin: 0px auto;">
					<tr>
						<th style="width: 80px;">当前密码：</th>
						<td>
							<input type="password" name="pass_old" value="" class="ui_ipt bold" style="width: 150px;"/>
						</td>
						<td width="180px"></td>
					</tr>
					<tr>
						<th style="width: 80px;">新 密 码：</th>
						<td>
							<input type="password" name="pass_new" value="" class="ui_ipt bold" style="width: 150px;" nullable="false" />
						</td>
						<td width="180px"></td>
					</tr>
					<tr>
						<th style="width: 80px;">确认密码：</th>
						<td>
							<input type="password" name="pass_new_q" value="" class="ui_ipt bold" style="width: 150px;" nullable="false" />
						</td>
						<td width="180px"></td>
					</tr>
					<%--<tr>
						<th style="width: 80px;">验&nbsp;证&nbsp;码：</th>
						<td>
							<input type="text" name="pass_yz" value="" class="ui_ipt bold" style="width: 70px;" nullable="false" />
							<a href="javascript: void(0);" class="yamBtn02" id="pass_yanzBtn">发送验证码</a>
							<a href="javascript: void(0);" class="yamBtn02" style="display: none;" id="pass_yanzrBtn">重新发送</a>
						</td>
						<td width="180px"></td>
					</tr>--%>
					<tr>
						<td colspan="2" style="text-align: center;">
							<a href="javascript: void(0)" class="orangebtn_m" id="pass_submit" id="pass_sub"><span>提交</span></a>
						</td>
						<td width="180px"></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="login_pop" style="width: 508px; display: none;" id="user_email">
			<h2>
				绑定个人邮箱<a href="javascript: void(0)" class="pop_close" onclick="closeMesBox('user_email')">关闭</a>
			</h2>
			<div class="login_pop_table">
				<table width="80%" border="0" cellspacing="0" cellpadding="0" class="form_table" style="margin: 0px auto;">
					<tr id="old_email" style="display: none;">
						<th style="width: 100px;">当前邮箱：</th>
						<td>
							<input type="text" name="email_old" value="" class="ui_ipt bold" style="width: 150px;" nullable="false" max_length="40" />
						</td>
						<td width="180px"></td>
					</tr>
					<tr>
						<th style="width: 80px;" id="email_new"></th>
						<td>
							<input type="text" name="email_new" class="ui_ipt bold" style="width: 150px;" nullable="false" />
						</td>
						<td width="180px"></td>
					</tr>
					<tr>
						<th style="width: 80px;">验&nbsp;证&nbsp;码：</th>
						<td>
							<input type="text" name="email_yz" value="" class="ui_ipt bold" style="width: 70px;" nullable="false" />
							<a href="javascript: void(0);" class="yamBtn02" id="email_yanzBtn">发送验证码</a>
							<a href="javascript: void(0);" class="yamBtn02" style="display: none;" id="email_yanzrBtn">重新发送</a>
						</td>
						<td width="180px"></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<a href="javascript: void(0)" class="orangebtn_m" id="email_submit" name="email_sub"><span>提交</span></a>
						</td>
						<td></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="login_pop" style="width: 508px; display: none;" id="user_pasQues">
			<h2>
				设置密保问题<a href="javascript: void(0)" class="pop_close" onclick="closeMesBox('user_pasQues')">关闭</a>
			</h2>
			<div class="login_pop_table">
				<table width="80%" border="0" cellspacing="0" cellpadding="0" class="form_table" style="margin: 0px auto;">
					<tr style="display: none;" id="ques_old">
						<th style="width: 80px;">原 问 题：</th>
						<td>
							<input type="text" name="pass_ques_old" class="ui_ipt bold" style="width: 150px;" maxlength="40"/>
						</td>
						<td width="180px"></td>
					</tr>
					<tr style="display: none;" id="answ_old">
						<th style="width: 80px;">问题答案：</th>
						<td>
							<input type="text" name="pass_answ_old" class="ui_ipt bold" style="width: 150px;" maxlength="40"/>
						</td>
						<td width="180px"></td>
					</tr>
					<tr>
						<th style="width: 80px;" id="ques_new"></th>
						<td>
							<input type="text" name="pass_ques_new" class="ui_ipt bold" style="width: 150px;" maxlength="40"/>
						</td>
						<td width="180px"></td>
					</tr>
					<tr>
						<th style="width: 80px;">问题答案：</th>
						<td>
							<input type="text" name="pass_answ_new" class="ui_ipt bold" style="width: 150px;" maxlength="40"/>
						</td>
						<td width="180px"></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<a href="javascript: void(0)" class="orangebtn_m" id="pass_quse_submit">
								<span>提交</span>
							</a>
						</td>
						<td width="180px"></td>
					</tr>
				</table>
			</div>
		</div>
		
	<jsp:include page="../main/footer.jsp" flush="true"></jsp:include>
	</body>
</html>