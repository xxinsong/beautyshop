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
<script type="text/javascript" src="js/tagsitemmanager.js"></script>
</head>
<body>
	<div>
		<div style="float: left; width: 20%;">
			<div class="formgrid_title">
				<h2>标签树</h2>
			</div>
			<div style="height: 100%; overflow: auto">
				<ul id="tagTree" class="ztree"></ul>
			</div>
		</div>
		<!-- 查询表单 -->
		<div style="float: right; width: 79%">
			<div class="searchformDiv" width="90%">
				<table width="90%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<input type="hidden" name="itemtagId" id="itemtagId" value="-1" class="searchipt" />
						<th>所属标签过滤</th>
						<td>
							<select id="hasTag" name="hasTag" class="searchipt">
								<option value="0">无标签</option>
								<option value="1">有标签</option>
							</select>
						</td>
						<th>标签值:</th>
						<td>
							<input type="text" name="itemValue" id="itemValue" class="searchipt" />
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
					<h2>标签值列表</h2>
				</div>
				<!-- 列表 -->
				<div class="grid">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<!-- <th field="itemId">标签id</th> -->
							<th field="itemValue">标签值</th>
							<th field="itemDesc">标签描述</th>
							<!-- <th field="orderId">排序</th> -->
						</tr>
					</table>
				</div>
			</div>

			<!-- tabs -->
			<div class="stat_graph mt5">
				<h3>
					<div class="graph_tab">
						<ul>
							<li id="tagsitem" class="selected"><span class="word">标签值信息</span><span class="bg"></span></li>
							<div class="clear"></div>
						</ul>
					</div>
				</h3>
			</div>
			<div>
				<!-- 员工信息tab -->
				<div id="tagsitemTab" style="margin-top: 10px;">
					<div class="formgrid">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<input type="hidden" id="tagId" name="tagId" nullable="false" valid_type="integer" class="ipttxt" />
								<input type="hidden" id="itemId" name="itemId" class="ipttxt" />
								<th>标签：</th>
								<td>
									<input type="text" id="tagName" name="tagName" readonly="readonly" onClick="selectTag()" class="ipttxt" />
								</td>
								<th><label class="ltxtc">*</label>标签值：</th>
								<td>
									<input type="text" id="itemValue" max_length="30" name="itemValue" class="ipttxt" nullable="false" />
								</td>

							</tr>
							<tr>
								<th>标签描述：</th>
								<td>
									<input type="text" id="itemDesc" name="itemDesc" class="ipttxt" max_length="200" />
								</td>
								<!--  <th>排序：</th> 
							    <td> <input type="text" id="orderId" name="orderId" class="ipttxt" /></td>  -->
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
			</div>
		</div>
	</div>
	<div id="loading" style="background: url(<%=path%>/public/v20/ui/images/loading.gif) #ecf5ff no-repeat;width: 80px;height: 80px;position: absolute;top: 45%;left: 45%;z-index: 3000;filter:alpha(opacity=80);opacity: 0.8;display: none;"></div>
</body>
</html>
