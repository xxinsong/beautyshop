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
		<script type="text/javascript" src="js/intemanager.js"></script>		
	</head>

	<body>
        <!-- 查询表单 -->
		<div id="queryForm" class="searchformDiv">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<th>接口名称:</th>
					<td>
						<input type="text" name="textfield" id="qryName" class="searchipt" />
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
							<span class="word">接口列表</span><span class="bg"></span>
						</li>
						<div class="clear"></div>
					</ul>
				</div>
			</h3>
		</div>

		<div>
			<div>
				<!-- 列表 -->
				<div class="grid" id="intGrid">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th field="interfaceCode">接口编码</th>
							<th field="interfaceName">接口名称</th>
							<th field="interfaceType" attr_code="INTERFACE_TYPE">接口类型</th>
							<th field="url">URL</th>
							<th field="state" attr_code="INTERFACE_STATE">状态</th>
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
						<li id="interface" crossBubble="true" class="selected"><span class="word">接口信息</span><span class="bg"></span></li>
						<li id="intParams" crossBubble="true" onClick="loadIntParams(this)"><span class="word">接口参数</span><span class="bg"></span></li>
						<div class="clear"></div>
					</ul>
				</div>
			</h3>
		</div>
		<div>
			<!-- 接口信息tab -->
			<div id="interfaceTab" style="margin-top: 10px;">
				<div id="interfaceEditForm" class="formgrid">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">						
						<tr>
							<input type="hidden" id="interfaceId" name="interfaceId" class="ipttxt"/>
							<th><label class="ltxtc">*</label>接口编码：</th>
							<td>
								<input type="text" id="interfaceCode" name="interfaceCode" max_length="40" class="ipttxt" nullable="false"/>
							</td>
							<th><label class="ltxtc">*</label>接口名称：</th>
							<td>
								<input type="text" id="interfaceName" name="interfaceName" max_length="40" class="ipttxt" nullable="false"/>
							</td>							
							<th><label class="ltxtc">*</label>接口类型：</th>
							<td>
								<select id="interfaceType" name="interfaceType" attr_code="INTERFACE_TYPE" class="searchipt" nullable="false">
								</select>
							</td>
						</tr>
						<tr>
							<th><label class="ltxtc">*</label>URL：</th>
							<td>
								<input type="text" id="url" name="url" class="ipttxt" nullable="false"/>
							</td>
							<th><label class="ltxtc">*</label>状态</th>
							<td>
								<select id="state" name="state" attr_code="INTERFACE_STATE" class="searchipt" nullable="false">
								</select>
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
			<div id="intParamsTab" style="margin-top: 10px;display:none;">
				<div id="intParamsContain"  style="height: 130px;">					
					<div style="margin: 10px 10px 0 10px; width: 45%; float: left;">
						<div class="formgrid_title">
							<h2>参数列表</h2>
						</div>
  					
						<div class="grid" id="paramList">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<th field="paramCode">参数编码</th>
									<th field="paramValue">参数值</th>
									<th field="paramDesc">参数描述</th>
								</tr>
							</table>
						</div>
							
					</div>
					<div  style="margin: 10px 10px 0 0;  width: 45%; float: right;">
						<div class="formgrid_title">
							<h2>参数配置</h2>
						</div>
						<div style="margin-top: 10px;">
							<div class="formgrid" id="paramEditForm">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<input type="hidden" id="id" name="id" class="ipttxt" />
										<input type="hidden" id="interfaceId" name="interfaceId" class="ipttxt" />									
										<th><label class="ltxtc">*</label>参数编码：</th>
										<td>
											<input type="text" id="paramCode" name="paramCode" max_length="60" class="ipttxt" nullable="false"/>
										</td>
									</tr>
									<tr>
										<th><label class="ltxtc">*</label>参数值：</th>
										<td>
											<input type="text" id="paramValue" name="paramValue" max_length="60" class="ipttxt" nullable="false"/>
										</td>
									</tr>
									<tr>
										<th><label class="ltxtc"></label>参数描述：</th>
										<td>
											<input type="text" id="paramDesc" name="paramDesc" max_length="100" class="ipttxt" />
										</td>
									</tr>
								</table>
							</div>
							<div class="btns" style="text-align: center;">
								<a id="addParam" action="addParam" href="javascript: void(0);" class="resetbtn" style="margin-top:5px;">增加</a>
								<a id="updateParam" action="updateParam" href="javascript: void(0);" class="resetbtn" style="margin-top:5px;">修改</a>
								<a id="deleteParam" action="deleteParam" href="javascript: void(0);" class="resetbtn" style="margin-top:5px;">删除</a>
								<a id="sureParam" action="sureParam" href="javascript: void(0);" class="resetbtn" style="margin-top:5px;">确定</a>
								<a id="cancelParam" action="" href="javascript: void(0);" class="resetbtn" style="margin-top:5px;">取消</a>
							</div>
						</div>
					</div>				
				</div>
			</div>
						
		</div>
		
        <div id="loading" style="background: url(images/loading.gif) #ecf5ff no-repeat;width: 80px;height: 80px;position: absolute;top: 45%;left: 45%;z-index: 3000;filter:alpha(opacity=80);opacity: 0.8;display: none;">
        </div>		
	</body>
</html>
