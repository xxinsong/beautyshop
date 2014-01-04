<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="library" content="internet,WdatePicker" />
		<title></title>
		<script type="text/javascript" src="../../core/EasyuiZX.js"></script>
		<script type="text/javascript" src="js/TestUI.js"></script>
		<script type="text/javascript">
	       $(function() {
	           $("#overlayerBtn").click(function() {
	               overlay();
	               $("#overlayer").bind("click", function() {
	                   closeOverlay();
	                   $(".ui_dialog").hide();
	                   $("#loading").hide();
	               });
	           });
	           
	           $("#loadingBtn").click(function() {
	               $("#overlayerBtn").click();
	               $("#loading").show();
	           });
	           
	           $("#loading").click(function() {
	               $("#loading").hide();
	               closeOverlay();
	           });
	           
	           $("#popBtn").click(function() {
	               $("#overlayerBtn").click();
	               $("#popDiv").show();
	           });
	           
	           $("#cautionBtn").click(function() {
	               messager.alert("提示", "测试消息");
	           });
	           
	           $("#confirmBtn").click(function() {
	               messager.confirm("提示", "测试消息", function(reply) {
	                    alert(reply);
	               });
	           });
	           
	           $(".close_btn", ".ui_dialog").click(function() {
	               $("#overlayer").click();
	           });
	           $(".ui_dialog").draggable({handle:".ui_dialog_title"});
	           
	           $(".ui_pop > i").click(function() {
	               $("#popBtn").click();
	           });
	       })
	       
        </script>
	</head>

	<body>

        <!-- 查询表单 -->
		<div class="searchformDiv">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<th>分销商编码:</th>
					<td>
						<input type="text" name="textfield" id="textfield" class="searchipt" />
					</td>
					<th>分销商名称:</th>
					<td>
						<input type="text" name="textfield2" id="textfield2" class="searchipt" />
					</td>
					<th>分销商名称:</th>
					<td>
						<input type="text" name="textfield3" id="textfield3" class="searchipt" />
					</td>
					<td style="text-align: center;">
						<a href="javascript: void(0);" class="ui_white_btn"><span><em>&nbsp;查&nbsp;询&nbsp;</em></span></a>
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
							<span class="word">菜单列表</span><span class="bg"></span>
						</li>
						<li id="test1" class="">
							<span class="word">列表1</span><span class="bg"></span>
						</li>
						<li id="test2" class="">
							<span class="word">列表2</span><span class="bg"></span>
						</li>
						<div class="clear"></div>
					</ul>
				</div>
			</h3>
		</div>

		<div>
			<div id="menuTab">
				<!-- 列表 -->
				<div class="grid">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th field="menuId">菜单ID</th>
							<th field="menuCode">菜单编码</th>
							<th field="menuName">菜单名称</th>
							<th field="targetName">菜单链接</th>
							<th field="systemId" attr_code="SYSTEM_ID">系统标识</th>
						</tr>
					</table>
				</div>
			</div>
		    <div id="test1Tab" style="height: 100px;"></div>
			<div id="test2Tab" style="height: 100px;"></div>
		</div>

		<!-- 表单 -->
		<div class="formgrid">
			<div class="formgrid_title">
				<h2>表单标题</h2>
			</div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<th>输入框：</th>
					<td><input type="text" class="ipttxt" nullable="false" valid_type="integer"/></td>
					<th>时间：</th>
					<td><input type="text" class="ipttxt" onClick="WdatePicker();" /></td>
					<th>下拉框：</th>
					<td><select name="select" id="select" class="searchipt" attr_code="PRIVILEGE_TYPE"></select></td>
				</tr>
				<tr>
					<th>文本框：</th>
					<td>
						<div class="" style="position: relative;width: 150px;height: 20px;">
							<textarea name="textarea1" rows="5" cols="20" class="ui_common_textarea" animate="true" NWidth="550" NHeight="200" nullable="false"></textarea>
						</div>
					</td>
					<th>弹出框：</th>
					<td>
						<div class="ui_pop">
							<input type="text" class="ipttxt rw"/>
							<i></i>
						</div>
					</td>
					<th>测试：</th>
					<td>
						<input type="radio" name="sex" value="male" /> Male<input type="radio" name="sex" value="female" /> Female
					</td>
				</tr>
			</table>
			<div class="btns">
				<a href="javascript: void(0);" class="submitbtn">确定</a>
				<a id="resetBtn" href="javascript: void(0);" class="resetbtn">重置</a>
				<a id="modifyBtn" href="javascript: void(0);" class="resetbtn">编辑</a>
				<a id="cancelBtn" href="javascript: void(0);" class="resetbtn">取消</a>
				<a id="setBtn" href="javascript: void(0);" class="resetbtn">设值</a>
			</div>
		</div>

		<!-- 分割线 -->
		<div class="btns" style="margin-top: 50px;text-align: center;">
			<a id="overlayerBtn" href="javascript: void(0);" class="ui_blue_btn"><span><em>遮罩层</em></span></a>
			<a id="loadingBtn" href="javascript: void(0);" class="ui_blue_btn"><span><em>加载</em></span></a>
			<a id="popBtn" href="javascript: void(0);" class="ui_blue_btn"><span><em>弹出层</em></span></a>
			<a id="cautionBtn" href="javascript: void(0);" class="ui_blue_btn"><span><em>caution</em></span></a>
			<a id="confirmBtn" href="javascript: void(0);" class="ui_blue_btn"><span><em>confirm</em></span></a>
		</div>
		
        <div id="loading" style="background: url(images/loading.gif) #ecf5ff no-repeat;width: 80px;height: 80px;position: absolute;top: 45%;left: 45%;z-index: 3000;filter:alpha(opacity=80);opacity: 0.8;display: none;">
        </div>
        
        <!-- 弹出层 -->
		<div id="popDiv" class="ui_dialog" style="display: none;">
			<div class="ui_dialog_fore">
				<div class="ui_dialog_title">
					<div class="buttons">
						<a class="close_btn"></a>
					</div>
					<span>标题</span>
				</div>
				<div class="ui_dialog_body">
					<div class="ui_dialog_content">
						<div style="height: 200px;">
							content
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</body>
</html>
