<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="library" content="easyui,internet,WdatePicker,zTree" />
<title>深圳市韩塑美生物医学科技有限公司是一家化妆品面膜垂直电商为一体的分享平台互联网公司</title>
<script type="text/javascript" src="<%=path%>/public/core/EasyuiZX.js"></script>
<script type="text/javascript" src="<%=path%>/admin/security/js/buttonTools.js"></script>
<script type="text/javascript" src="<%=path%>/admin/security/js/jquery.jqia.dateFormat.js"></script>
<script type="text/javascript" src="<%=path%>/public/ajax/ajaxfileupload.js"></script>
<script type="text/javascript" src="js/goodplanmanager.js"></script>
</head>
<body>
	<!-- 查询表单 -->
	<div class="searchformDiv" width="100%" style="margin-top:5px;">
		<table width="360" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<th>定价计划名称:</th>
				<td width="180" style="padding-left:5px;">
					<input type="text" name="searchPlanName" id="searchPlanName" class="searchipt" />
				</td>
				<td style="text-align: center;">
					<a href="javascript: void(0);" id="search_btn" name="search_btn" class="ui_white_btn">
						<span><em>&nbsp;查&nbsp;询&nbsp;</em></span>
					</a>
				</td>
			</tr>
		</table>
	</div>


	<div style="margin-bottom: 10px; margin-top: 10px;">
		<div class="formgrid_title">
			<h2>定价计划列表</h2>
		</div>
		<!-- 列表 -->
		<div class="grid" id="planList">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<th field="planName">定价计划名称</th>
					<th field="goodName">商品/商品包</th>
					<th field="goodsType" attr_code="ADMIN_GOODPLAN_GOODSTYPE">商品类型</th>
					<!--<th field="planType" attr_code="ADMIN_GOODPLAN_TYPE">计划类型</th>
					 <th field="planIntro">定价计划说明</th> -->
					<th field="planDesc">定价计划描述</th>
					<th field="state">状态切换</th>
					
				</tr>
			</table>
		</div>
	</div>

	<div id="planEditorForm" class="formgrid">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<input type="hidden" id="planId" name="planId" class="ipttxt" />
				<input type="hidden" id="goodsId" name="goodsId" class="ipttxt" />
				<th ><label class="ltxtc">*</label>定价名称：</th>
				<td width="25%">
					<input type="text" id="planName" name="planName" class="ipttxt" nullable="false" max_length="40" />
				</td>
				<th ><label class="ltxtc">*</label>定价价格</th>
				<td  width="25%">
					<input type="text" id="planPrice" name="planPrice" valid_type="double" class="ipttxt" nullable="false" max_length="40" />
				</td>
				<th ><label class="ltxtc">*</label>				  定价显示价格：</th>
				<td >
					<input type="text" id="planShowPrice" name="planShowPrice" valid_type="double" class="ipttxt" nullable="false" max_length="40" />
				</td>
				
			</tr>
			<tr>
				<th><label class="ltxtc">*</label>生效时间：</th>
				<td>
					<input type="text" id="effDate" name="effDate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" class="ipttxt" nullable="false" />
				</td>
				<th><label class="ltxtc">*</label>
				失效时间:</th>
				<td>
					<input type="text" id="expDate" name="expDate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" class="ipttxt" nullable="false" />
				</td>
				<th><label class="ltxtc">*</label>商品/商品包</th>
				<td>
					   <input type="text" id="goodName" readonly="readonly" name="goodName" class="ipttxt" onclick="selectGoodOrPackage()" nullable="false" max_length="40" />
				</td>
				<!-- <th>状态时间：</th>
				<td>
					<input type="text" id="stateDate" name="stateDate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" class="ipttxt" />
				</td> -->
			</tr>
			<tr>
				<th><label class="ltxtc">*</label>状态</th>
				<td>
					<select id="state" name="state" attr_code="ADMIN_GOODPLAN_STATE" class="searchipt" nullable="false">
					</select>
				</td>
				<!-- <th><label class="ltxtc">*</label>计划类型：</th>
				<td>
				    <select id="planType" name="planType" attr_code="ADMIN_GOODPLAN_TYPE" class="searchipt" nullable="false">
					</select>
				</td> -->
				<th><label class="ltxtc">*</label>商品类型：</th>
				<td >
				    <select id="goodsType" name="goodsType" attr_code="ADMIN_GOODPLAN_GOODSTYPE" class="searchipt" nullable="false">
					</select>
				</td>
			</tr>
            <tr>
                <th>描述：</th>
				<td colspan="3">
				<textarea id="planDesc" name="planDesc"   max_length="450" style="width:450px;">
				</textarea></td>
		    </tr>
		</table>
		<div class="btns">
			<a id="add" action="addAction" href="javascript: void(0);" class="resetbtn">增加</a>
			<a id="update" action="updateAction" href="javascript: void(0);" class="resetbtn">修改</a>
			<a id="delete" action="deleteAction" href="javascript: void(0);" class="resetbtn">删除</a>
			<a id="sure" action="sure" href="javascript: void(0);" class="resetbtn">确定</a>
			<a id="cancel" action="" href="javascript: void(0);" class="resetbtn">取消</a>
		</div>
	</div>
	<div id="loading" style="background: url(<%=path%>/public/v20/ui/images/loading.gif) #ecf5ff no-repeat;width: 80px;height: 80px;position: absolute;top: 45%;left: 45%;z-index: 3000;filter:alpha(opacity=80);opacity: 0.8;display: none;"></div>
</body>
</html>
