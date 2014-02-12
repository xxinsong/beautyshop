<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="library" content="easyui,internet,WdatePicker" />
		<title></title>
		<script type="text/javascript" src="<%=path%>/public/core/EasyuiZX.js"></script>
		<script type="text/javascript" src="<%=path%>/admin/security/js/buttonTools.js"></script>
		<script type="text/javascript" src="<%=path%>/admin/security/js/jquery.jqia.dateFormat.js"></script>
		<script type="text/javascript" src="js/notice.js"></script>		
	</head>

	<body>
        <!-- 查询表单 -->
		<div id="queryForm" class="searchformDiv">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<th>标题:</th>
					<td>
						<input type="text" name="textfield" id="qryTitle" class="searchipt" />
					</td>
					<th>发布人:</th>
					<td>
						<input type="text" name="textfield" id="qryPublisher" class="searchipt" />
					</td>
					<th>状态：</th>
					<td>
						<select name="textfield" id="qryState" class="searchipt" attr_code="NOTICE_STATE"></select>
					</td>
					<td style="text-align: center;">
						<a href="javascript: queryData();" class="ui_white_btn"><span><em>&nbsp;查&nbsp;询&nbsp;</em></span></a>
					</td>
				</tr>
			</table>
		</div>

        <!-- tab -->
		<div class="stat_graph mt5">
			<h3>
				<div class="graph_tab">
					<ul>
						<li id="menu" class="selected">
							<span class="word">公告列表</span><span class="bg"></span>
						</li>
						<div class="clear"></div>
					</ul>
				</div>
			</h3>
		</div>

		<div>
			<div id="noticeTab">
				<!-- 列表 -->
				<div class="grid">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th field="noticeTitle">公告标题</th>
							<th field="noticeDest">公告对象</th>
							<th field="noticeContext">公告内容</th>
							<th field="state" attr_code="NOTICE_STATE">状态</th>
							<th field="createDate">创建时间</th>
							<th field="orderId">排序id</th>
							<th field="publisher">发布人</th>
							<th field="publishTime">发布时间</th>
						</tr>
					</table>
				</div>
			</div>
		</div>
		
		<div class="clear"></div>
		<!-- tabs -->
		<div class="stat_graph mt5" style="padding-top:5px;">
			<h3>
				<div class="graph_tab">
					<ul>
						<li id="notices" crossBubble="true" class="selected"><span class="word">公告信息</span><span class="bg"></span></li>
						<div class="clear"></div>
					</ul>
				</div>
			</h3>
		</div>
		<div>
			<!-- 公告信息tab -->
			<div id="noticesTab" style="margin-top: 10px;">
				<div id="noticesEditorForm" class="formgrid">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">						
						<tr>
							<input type="hidden" id="noticeId" name="noticeId" class="ipttxt" />
							<input type="hidden" id="state" name="state" class="ipttxt" />
							<input type="hidden" id="createDate" name="createDate" class="ipttxt" />
							<th><label class="ltxtc">*</label>状态</th>
							<td>
								<select id="state" name="state" attr_code="NOTICE_STATE" class="searchipt" nullable="false">
								</select>
							</td>
							<th><label class="ltxtc">*</label>发布人：</th>
							<td>
								<input type="text" id="publisher" name="publisher" max_length="40" class="ipttxt" nullable="false"/>
							</td>
							<th><label class="ltxtc">*</label>排序id：</th>
							<td>
								<input type="text" id="orderId" name="orderId" max_length="40" class="ipttxt" nullable="false" valid_type="integer" onkeyup="value=value.replace(/[^\d]/g,'') " 
      							onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" />
							</td>
						</tr>
						<tr>
							<th><label class="ltxtc">*</label>公告对象：</th>
							<td>
								<input type="text" id="noticeDest" name="noticeDest" max_length="40" class="ipttxt" nullable="false"/>
							</td>
							<th><label class="ltxtc">*</label>公告标题：</th>
							<td>
								<input type="text" id="noticeTitle" name="noticeTitle" max_length="40" class="ipttxt" nullable="false"/>
							</td>
						</tr>
						<tr>
							<th valign="top" ><label class="ltxtc">*</label>公告内容：</th>
							<td rowspan="3" colspan="3">
							    <textarea cols="90" rows="3" id="noticeContext" name="noticeContext"  nullable="false"></textarea>
							</td>
						</tr>
					</table>

					<div class="btns">
						<a id="add" action="addAction" href="javascript: void(0);" class="resetbtn">增加</a>
						<a id="update" action="updateAction" href="javascript: void(0);" class="resetbtn">修改</a>
						<!-- <a id="delete" action="deleteAction" href="javascript: void(0);" class="resetbtn"   >删除</a> -->
						<a id="sure" action="sure" href="javascript: void(0);" class="resetbtn">确定</a>
						<a id="cancel" action="" href="javascript: void(0);" class="resetbtn">取消</a>
					</div>
				</div>
			</div>
			<!-- 员工信息tab -->			
		</div>
		
        <div id="loading" style="background: url(images/loading.gif) #ecf5ff no-repeat;width: 80px;height: 80px;position: absolute;top: 45%;left: 45%;z-index: 3000;filter:alpha(opacity=80);opacity: 0.8;display: none;">
        </div>		
	</body>
</html>
