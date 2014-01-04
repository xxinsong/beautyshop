<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="library" content="date,progressbar">
		<title>网点管理地图</title>
		<%--<link rel="stylesheet" type="text/css" href="<%=path%>/agent/css/style.css">--%>
		<link rel="stylesheet" type="text/css" href="css/CircleManage.css">
		<link rel="stylesheet" type="text/css" href="css/style.css">
		 <meta http-equiv="library" content="market"/>
     
		
		<script type="text/javascript">
            var js_path_prefix ="<%=request.getContextPath()%>";
        </script>
        <script type="text/javascript" src="<%=path%>/public/core/EasyuiZX.js"></script>
		<script type="text/javascript" src="<%=path%>/mappub/google/mapapi3.8.6.js"></script>
		<script type="text/javascript" src="<%=path%>/mappub/3rd/infobox/1.1.9/src/infobox.js"></script>
		<script type="text/javascript" src="<%=path%>/mappub/3rd/extdraggableobject/1.0/src/ExtDraggableObject.js"></script>
		<script type="text/javascript" src="<%=path%>/mappub/3rd/markermanager/1.0/src/markermanager_packed.js"></script>
		<script type="text/javascript" src="<%=path%>/mappub/3rd/infobubble/src/infobubble.js"></script>
		<script type="text/javascript" src="<%=path%>/public/core/json2.js"></script>
		<script type="text/javascript" src="<%=path%>/mappub/ztesoft/common.js"></script>
		<script type="text/javascript" src="<%=path%>/mappub/ztesoft/mapType.js"></script>
		<script type="text/javascript" src="<%=path%>/mappub/ztesoft/CRMMap.js"></script>
		<script type="text/javascript" src="<%=path%>/mappub/ztesoft/CRMControlBar.js"></script>
		<script type="text/javascript" src="<%=path%>/mappub/ztesoft/CRMCaption.js"></script>
		<script type="text/javascript" src="<%=path%>/mappub/ztesoft/CRMTitle.js"></script>
		<script type="text/javascript" src="<%=path%>/mappub/ztesoft/CRMInfoBox.js"></script>
		<script type="text/javascript" src="<%=path%>/mappub/ztesoft/CRMElement.js"></script>
		<script type="text/javascript" src="<%=path%>/mappub/ztesoft/CRMCircle.js"></script>
		<script type="text/javascript" src="<%=path%>/mappub/ztesoft/CRMPolyon.js"></script>
		<script type="text/javascript" src="<%=path%>/mappub/ztesoft/CRMPolyline.js"></script>
		<script type="text/javascript" src="<%=path%>/mappub/ztesoft/CRMMarker.js"></script>
		<script type="text/javascript" src="<%=path%>/mappub/ztesoft/CRMInfoBubble.js"></script>
		<script type="text/javascript" src="<%=path%>/mappub/ztesoft/CRMStat.js"></script>
		<script type="text/javascript" src="<%=path%>/mappub/ztesoft/CRMArrowLine.js"></script>
		<script type="text/javascript" src="<%=path%>/mappub/ztesoft/CRMPosition.js"></script>
		<script type="text/javascript" src="<%=path%>/mappub/ztesoft/map.js"></script>
		<%--<script type="text/javascript" src="<%=path%>/public/components/localAction.js"></script>--%>
		<%--<script type="text/javascript" src="<%=path%>/public/components/buffalo.js"></script>--%>
		<script type="text/javascript" src="js/mapSelectSmall.js"></script>
		<script type="text/javascript">
	        var contextPath = "<%=request.getContextPath()%>";
        </script>
	</head>
	<body>
 

		<div class="div_body" style="height: 400px;">
			<div class="main" style="height: 100%;">
				<div id="map" class="main_map">
					<div id="map_canvas" style="width: 100%; height: 100%; border-left: 60px;"></div>
				</div>
			</div>
		</div>
	</body>
</html>