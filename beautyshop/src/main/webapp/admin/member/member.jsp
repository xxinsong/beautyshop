<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="library" content="easyui,internet,WdatePicker" />
		<title>深圳市韩塑美生物医学科技有限公司是一家化妆品面膜垂直电商为一体的分享平台互联网公司</title>
		<script type="text/javascript" src="<%=request.getContextPath()%>/public/core/EasyuiZX.js"></script>
		<script type="text/javascript" src="js/member.js"></script>
	</head>

	<body>
        <!-- 查询表单 -->
		<div id="queryForm" class="searchformDiv">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<th>会员号码:</th>
					<td>
						<input type="text" name="qryLogonName" id="qryLogonName" class="searchipt" />
					</td>
                    <th>会员等级:</th>
                    <td>
                        <input type="text" name="qryLevel" id="qryLevel" class="searchipt" />
                    </td>
					<td style="text-align: center;">
						<a href="javascript: queryData();" class="ui_white_btn"><span><em>&nbsp;查&nbsp;询&nbsp;</em></span></a>
					</td>
				</tr>
			</table>
		</div>

        <!-- tab -->
		<%--<div class="stat_graph mt5">
			<h3>
				<div class="graph_tab">
					<ul>
						<li id="menu" class="selected">
							<span class="word">会员列表</span><span class="bg"></span>
						</li>
						<div class="clear"></div>
					</ul>
				</div>
			</h3>
		</div>--%>
        <%--<div class="formgrid" style="margin-bottom: 10px;">
            <div class="formgrid_title">
                <h2>权限树</h2>
            </div>
            <div style="height: 300px; overflow: auto">
                <table id="treegrid">
                </table>
            </div>
        </div>--%>
		<div style="width:60%;float: left;padding-left: 10px;">
			<div id="memberTab">
				<!-- 列表 -->
				<div class="grid">
					<table id="member" width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th field="logon_name">会员号码</th>
							<%--<th field="userName">用户姓名</th>--%>
							<th field="level">会员等级</th>
							<th field="referrer">推荐人</th>
							<th field="state" attr_code="MERCHANT_STATE">状态</th>
							<%--<th field="merchantCode" attr_code="MERCHANT_LEVEL">商户编码</th>
							<th field="merchantName">商户名称</th>--%>
							<%--<th field="operator">操作人</th>--%>
						</tr>
					</table>
				</div>
			</div>
            <div class="formgrid" id="member_edit_form">
                <div class="formgrid_title">
                    <h2>会员编辑</h2>
                </div>
                <input type="hidden" name="privilegeId" class="ipttxt" />
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <th>会员号码：</th>
                        <td>
                            <input type="hidden" id="userId" name="userId" class="ipttxt" />
                            <input type="text" readonly="readonly" id="logonName" name="logonName" class="ipttxt" />
                        </td>
                        <th><label class="ltxtc">*</label>推荐人号码：</th>
                        <td>
                            <input type="text" id="referrer_no" name="referrer_no" valid_type="mobile" max_length="11" nullable="false" class="ipttxt" />
                        </td>

                    </tr>
                    <tr style="display: none">
                        <th>会员等级：</th>
                        <td>
                            <input type="text" id="level" name="level" readonly="readonly" class="ipttxt" />
                        </td>
                        <th>状态：</th>
                        <td>
                            <select id="state" name="state" attr_code="MERCHANT_STATE" class="searchipt" >
                            </select>
                        </td>
                    </tr>
                </table>
                <div class="btns" style="margin-top: 10px;text-align: center;">
                    <a id="btnEdit" style="display: none" href="javascript: mdfyReferrer();" class="ui_blue_btn"><span><em>修改推荐人</em></span></a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <%--<a id="noIssue" href="javascript: noIssue();" class="ui_blue_btn"><span><em>取消出具发票</em></span></a>--%>
                </div>
            </div>
		</div>

        <div style="width:35%;float: right;padding-right: 10px;">
            <div id="presenteeTab">
                <!-- 列表 -->
                <div class="grid">
                    <table id="presentee" width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <th field="logon_name">下级会员</th>
                            <%--<th field="userName">用户姓名</th>--%>
                            <th field="level">会员等级</th>
                            <%--<th field="referrer">推荐人</th>--%>
                            <th field="state" attr_code="MERCHANT_STATE">状态</th>
                            <%--<th field="merchantCode" attr_code="MERCHANT_LEVEL">商户编码</th>
                            <th field="merchantName">商户名称</th>--%>
                            <%--<th field="operator">操作人</th>--%>
                        </tr>
                    </table>
                </div>
            </div>
        </div>


        <div id="loading" style="background: url(/market/main/images/loading.gif) #ecf5ff no-repeat;width: 80px;height: 80px;position: absolute;top: 45%;left: 45%;z-index: 3000;filter:alpha(opacity=80);opacity: 0.8;display: none;">
        </div>		
	</body>
</html>
