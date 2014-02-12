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
<script type="text/javascript">
var path = '<%=path%>';
</script>
<script type="text/javascript" src="js/goodsmanager.js"></script>

<style type="text/css">
body {
	font-size: 14px;
}

input {
	vertical-align: middle;
	margin: 0;
	padding: 0
}

.file-box {
	position: relative;
	width: 410px;
}

.txt {
	height: 22px;
	border: 1px solid #cdcdcd;
	width: 180px;
}

.btn {
	background-color: #FFF;
	border: 1px solid #CDCDCD;
	height: 24px;
	width: 70px;
	margin-left:10px;
    vertical-align:middle;
    margin-top:-20px;
}

.file {
	position: absolute;
	top: 0;
	left: 225px;
	right: 80px;
	height: 24px;
	filter: alpha(opacity : 0);
	opacity: 0;
	width: 70px
}
</style>
</head>
<body>
	<div style="margin-top:5px;">
		<div style="float: left; width: 20%;border:1px solid #d5d5d5;">
			<div class="formgrid_title">
				<h2>商品目录树</h2>
			</div>
			<div style="height: 300px; overflow: auto">
				<ul id="catalogTree" class="ztree"></ul>
			</div>
		</div>
		<!-- 查询表单 -->
		<div style="float: right; width: 79%">
			<div class="searchformDiv" width="90%">
				<table width="90%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<!--  <th>商品目录过滤</th>
					    <td>
					      <select id="hasCatalog" name="hasCatalog" class="searchipt" nullable="false">
							<option value="0">无目录</option>
							<option value="1">有目录</option>
						  </select>
					    </td> -->
						<input type="hidden" name="searchCatalogId" id="searchCatalogId" value="-1" class="searchipt" />
						<th>商品名称:</th>
						<td width="250">
							<input type="text" name="searchGoodsName" id="searchGoodsName" class="searchipt" />
						</td>
						<td >
							<a href="javascript: void(0);" id="search_btn" name="search_btn" class="ui_white_btn">
								<span><em>&nbsp;查&nbsp;询&nbsp;</em></span>
							</a>
						</td>
					</tr>
				</table>
			</div>


			<div style="margin-bottom: 10px; margin-top: 10px;">
				<div class="formgrid_title">
					<h2>商品列表</h2>
				</div>
				<!-- 列表 -->
				<div class="grid" id="goodList">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<!-- <th field="goodsId">商品id</th> -->
							<th field="goodsName">商品名称</th>
							<th field="goodsDesc">商品描述</th>
							<th field="createDate">创建时间</th>
							<th field="imageUri">商品图片</th>
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
						<li id="goods" crossBubble="true" class="selected"><span class="word">商品信息</span><span class="bg"></span></li>
						<li id="tagItems" crossBubble="true" onClick="loadTagItems(this)"><span class="word">商品标签绑定</span><span class="bg"></span></li>
						<li id="goodsPlan" crossBubble="true" onClick="loadGoodsPlan(this)" ><span class="word">商品定价列表</span><span class="bg"></span></li>
						<div class="clear"></div>
					</ul>
				</div>
			</h3>
		</div>
		<div>
			<!-- 商品信息tab -->
			<div id="goodsTab" style="margin-top: 10px;">
				<div id="goodsEditorForm" class="formgrid">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<input type="hidden" id="goodsId" name="goodsId" class="ipttxt" />
							<input type="hidden" id="createDate" name="createDate" class="ipttxt" />
							<input type="hidden" id="catalogId" name="catalogId" class="ipttxt" />
							<th><label class="ltxtc">*</label>商品目录：</th>
							<td>
								<input type="text" id="catalogName" name="catalogName" readonly="readonly" nullable="false" onClick="selectCatalog()" class="ipttxt" />
							</td>
							<th><label class="ltxtc">*</label>商品名称：</th>
							<td>
								<input type="text" id="goodsName" name="goodsName" class="ipttxt" nullable="false" max_length="60" />
							</td>
							<th><label class="ltxtc">*</label>商品编号：</th>
							<td>
								<input type="text" id="goodsNo" name="goodsNo" class="ipttxt" nullable="false" max_length="60" />
							</td>
							<th>商品别名：</th>
							<td>
								<input type="text" id="alias" name="alias" class="ipttxt" max_length="60" />
							</td>

						</tr>
						<tr>
							<th><label class="ltxtc">*</label>类型：</th>
							<td>
								<select id="type" name="type" attr_code="ADMIN_GOOD_TYPE" class="searchipt" nullable="false">
								</select>
							</td>
							<th><label class="ltxtc">*</label>基础定价：</th>
							<td>
								<input type="text" id="basePrice" name="basePrice" max_length="40" class="ipttxt" nullable="false" valid_type="double" />
							</td>
							<th><label class="ltxtc">*</label>售卖方式：</th>
							<td>
								<select id="saleWay" name="saleWay" attr_code="ADMIN_GOOD_SALEWAY" class="searchipt" nullable="false">
								</select>
							</td>
							<th><label class="ltxtc">*</label>状态</th>
							<td>
								<select id="state" name="state" attr_code="ADMIN_GOOD_STATE" class="searchipt" nullable="false">
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
							<!-- <th>商品特性：</th> 
							    <td> <input type="text" id="goodsProps" name="goodsProps" class="ipttxt" /></td>  -->
							<!-- <th>上架时间：</th>
								<td><input type="text" id="putawayTime" name="putawayTime" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" class="ipttxt" /></td> -->
							<th valign="top" >商品描述：</th>
							<td  rowspan="3" colspan="3">	
							    <textarea cols="61" rows="3" id="goodsDesc" name="goodsDesc" ></textarea>
							</td>
							<th>温馨提示：</th>
							<td  rowspan="3" colspan="3">
							    <textarea cols="61" rows="3" id="hints" name="hints" ></textarea>
							</td>
							<!-- <th>关注度：</th>
								<td><input type="text" id="viewCount" name="viewCount" class="ipttxt"  /></td> -->
							
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
			<div id="tagItemsTab" style="margin-top: 10px;">
				<div id="tagItemsContain"  style="height: 130px;">
					<div style="margin: 10px 10px 0 10px; width: 45%; float: left;">
						<div class="formgrid_title">
							<h2>标签列表</h2>
						</div>

						<div class="grid" id="tagList">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<!-- <th field="tagGroupId">关系实例id</th>
									<th field="tagId">标签id</th> -->
									<th field="tagName">标签名称</th>
									<th field="tagType" attr_code="ADMIN_TAG_TYPE" >标签分类</th>
								</tr>
							</table>
						</div>
						<dir class="btns" style="text-align: center;">
							<a id="addTags" action="addTags" href="javascript: void(0);" class="resetbtn" style="margin-top:5px;">增加商品标签</a>
							<a id="deleteTags" action="deleteTags" href="javascript: void(0);" class="resetbtn" style="margin-top:5px;">删除商品标签</a>
						</dir>
					</div>

					<div  style="margin: 10px 10px 0 0;  width: 45%; float: right;">
						<div class="formgrid_title">
							<h2>可选标签值列表</h2>
						</div>
						<div class="grid" id="tagItemList">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<th field="checked">选择框</th>
									<!-- <th field="itemId">标签值id</th> -->
									<th field="itemValue">标签值名称</th>
									<th field="itemDesc">标签描述</th>
								</tr>
							</table>
						</div>
						<dir class="btns" style="text-align: center;">
							<a id="updateTagItems" action="updateTagItems" href="javascript: void(0);" class="resetbtn" style="margin-top:5px;">修改</a>
							<a id="sureTagItems" action="sureTagItems" href="javascript: void(0);" class="resetbtn" style="margin-top:5px;">确定</a>
							<a id="cancelTagItems" action="" href="javascript: void(0);" class="resetbtn" style="margin-top:5px;">取消</a>
						</dir>
					</div>
				</div>
			</div>
			<div id="goodsPlanTab" style="margin-top: 10px;">
				<div id="goodsPlanContain"  >
					<div style="margin: 10px 10px 0 10px;">
						<!-- <div class="formgrid_title">
							<h2>标签列表</h2>
						</div> -->
						<div class="grid" id="goodsPlanList">
							<table  width="100%" border="0" cellspacing="0" cellpadding="0">
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
	<div id="popDiv" class="ui_dialog" style="display: none;">
		<div class="ui_dialog_fore">
			<div class="ui_dialog_title">
				<div class="buttons">
					<a class="close_btn" onclick="close_btn()"></a>
				</div>
				<span id="goodsupload_title" style="text-align:center;">标题</span>
			</div>
			<div class="ui_dialog_body" >
				<div class="ui_dialog_content">
					<div style="height: 200px; text-align: center;">
						<div id="imageUrlTd" class="file-box" style="margin-left:40px;">
							<input type="hidden" name="imageUrl" id="imageUrl" class="gimage" value=""> 
							<input type='text' name='textfield' id='textfield' class='txt' /> 
							<input type='button' class='btn' style="margin-top:0;" id="viewButtion" value='浏览...' /> 
							<input type="file" name="gfile" class="file" id="gfile" size="28" style="margin-top:0;"
								onchange="document.getElementById('textfield').value=this.value" /> 
						    <input type="button" id="uploadaButton" class="btn"  value="上 传" onclick="goodImageUpload()" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
