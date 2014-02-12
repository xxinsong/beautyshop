<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="library" content="easyui,internet,WdatePicker,zTree" />
<title></title>
<script type="text/javascript" src="<%=path%>/public/core/EasyuiZX.js"></script>
<script type="text/javascript" src="<%=path%>/admin/security/js/buttonTools.js"></script>
<script type="text/javascript" src="<%=path%>/admin/security/js/jquery.jqia.dateFormat.js"></script>
<script type="text/javascript" src="<%=path%>/public/ajax/ajaxfileupload.js"></script>
<script type="text/javascript" src="js/goodpackagemanager.js"></script>
</head>
<body>
	<!-- 查询表单 -->
	<div class="searchformDiv" width="100%" style="margin-top: 5px;">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<th>商品包名称:</th>
				<td>
					<input type="text" name="searchPackageName" id="searchPackageName" class="searchipt" />
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
			<h2>商品包列表</h2>
		</div>
		<!-- 列表 -->
		<div class="grid" id="packageList">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<th field="packageName">商品包名称</th>
					<th field="packageCode">商品包编码</th>
					<th field="packageDesc">商品描述</th>
					<th field="state" attr_code="ADMIN_PACKAGE_STATE">状态</th>
				</tr>
			</table>
		</div>
	</div>

	<div class="clear"></div>
	<!-- tabs -->
	<div class="stat_graph mt5">
		<h3>
			<div class="graph_tab">
				<ul>
					<!--  onClick="loadTabPackage(this)" onClick="loadTabGoodWraps(this)" -->
					<li id="package" crossBubble="true" class="selected"><span class="word">商品包信息</span><span class="bg"></span></li>
					<li id="goodwrap" crossBubble="true" onClick="loadTabGoodWraps(this)"><span class="word">商品打包</span><span class="bg"></span></li>
					<li id="goodsPlan" crossBubble="true" onClick="loadGoodsPlan(this)"><span class="word">商品包定价列表</span><span class="bg"></span></li>
					<div class="clear"></div>
				</ul>
			</div>
		</h3>
	</div>
	<div>
		<!-- 商品信息tab -->
		<div id="packageTab" style="margin-top: 10px;">
			<div id="packageEditorForm" class="formgrid">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<input type="hidden" id="packageId" name="packageId" class="ipttxt" />
						<input type="hidden" id="createDate" name="createDate" class="ipttxt" />
						<th><label class="ltxtc">*</label>商品包名称：</th>
						<td width="150">
							<input type="text" id="packageName" name="packageName" class="ipttxt" nullable="false" max_length="40" />
						</td>
						<th><label class="ltxtc">*</label>商品包编号：</th>
						<td width="150">
							<input type="text" id="packageCode" name="packageCode" class="ipttxt" nullable="false" max_length="40" />
						</td>
						<th><label class="ltxtc">*</label>状态</th>
						<td style="padding-right: 20px;">
							<select id="state" name="state" attr_code="ADMIN_PACKAGE_STATE" class="searchipt" nullable="false">
							</select>
						</td>
					</tr>
					<tr>
						<th>生效时间：</th>
						<td>
							<input type="text" id="effDate" name="effDate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" class="ipttxt" />
						</td>
						<th>失效时间：</th>
						<td>
							<input type="text" id="expDate" name="expDate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" class="ipttxt" />
						</td>
					</tr>
					<tr>
						<th>描述：</th>
						<td colspan="3">
							<textarea id="packageDesc" name="packageDesc" rows="7" cols="120" max_length="250" style="padding: 5px;">
								</textarea>
						</td>
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
		</div>
		<div id="goodwrapTab" style="margin-top: 10px;">
			<div id="goodListContain" class="formgrid" style="height: 200px;">

				<div class="formgrid" style="margin-bottom: 10px; margin-top: 10px;">
					<div class="formgrid_title">
						<h2>商品列表</h2>
					</div>
					<div class="grid" id="goodList">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<!--  <th field="goodsId">商品id</th> -->
								<th field="goodsName">商品名称</th>
								<th field="goodsNo">商品编码</th>
							</tr>
						</table>
					</div>
					<dir class="btns">
						<a id="addGoods" action="addGoods" href="javascript: void(0);" class="resetbtn">增加商品</a>
						<a id="deleteGoods" action="deleteGoods" href="javascript: void(0);" class="resetbtn">删除商品</a>
					</dir>
				</div>
				<!--	
						<div class="formgrid" style="margin-bottom: 10px;  margin-top: 10px; width:48%;float: right;">
							<div class="formgrid_title">
								<h2>
									可选标签值列表
								</h2>
							</div>
							<div class="grid" id="tagItemList">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
									    <th  field="checked">选择框</th>
										<th  field="itemId">标签值id</th>
										<th field="itemValue">标签值名称</th>
									</tr>
								</table>
							</div>
							<dir class="btns">
							   <a id="updateTagItems"  action="updateTagItems" href="javascript: void(0);"  class="resetbtn"  >修改</a>
							   <a id="sureTagItems"  action="sureTagItems" href="javascript: void(0);" class="resetbtn"   >确定</a>
							   <a id="cancelTagItems"  action=""  href="javascript: void(0);" class="resetbtn"   >取消</a>
							</dir>
						</div>  -->
			</div>
		</div>
		<div id="goodsPlanTab" style="margin-top: 10px;">
			<div id="goodsPlanContain">
				<div style="margin: 10px 10px 0 10px;">
					<div class="grid" id="goodsPlanList">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<th field="planName">定价计划名称</th>
								<th field="goodName">商品/商品包</th>
								<th field="goodsType" attr_code="ADMIN_GOODPLAN_GOODSTYPE">商品类型</th>
								<!-- <th field="planType" attr_code="ADMIN_GOODPLAN_TYPE">计划类型</th> -->
								<th field="state" attr_code="ADMIN_GOODPLAN_STATE">状态</th>
								<th field="planDesc">定价计划描述</th>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<div id="loading" style="background: url(<%=path%>/public/v20/ui/images/loading.gif) #ecf5ff no-repeat;width: 80px;height: 80px;position: absolute;top: 45%;left: 45%;z-index: 3000;filter:alpha(opacity=80);opacity: 0.8;display: none;"></div>
</body>
</html>
