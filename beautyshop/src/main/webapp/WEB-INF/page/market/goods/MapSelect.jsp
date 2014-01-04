<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 
 
 <div name="positionTriggerInfo"   style="width: 700px;display: none;background-color: #E4E4E4;z-index: 9999;position: absolute;">
	<div style="padding: 0px;z-index: 9999" >
		<div  >
		    <div id="selectedPosition" style="font: bold 20px '宋体';color: #666;cursor: pointer;padding: 0px 5px 7px 5px;border: #c2c2c2 0px solid;height: 20px;position: absolute;top: 3px;right: 130px;">
			</div>
			<div style="position: absolute;width: 30px;top: 3px;right: 10px;font-weight: normal;">
			    <a name="confirmBtn" href="javascript: void(0);" class="ui_blue_btn" style="width: 30px;"><span style="text-indent: 0px;width: 40px;"><em style="line-height: 28px;font-weight: normal;">&nbsp;确&nbsp;定&nbsp;</em></span></a>
			</div>
		
		</div>
			<span>地图标注</span>
		<div  >
			<div  style="padding: 0px;z-index: 9999">
				<div style="height: 420px;overflow-y: auto;">
					<div>
						<div style="margin-top: 10px;">
							<div style="">
								<div name="map_region" style="border: #c0c0c0 0px solid; width: 95%; height: 400px; text-align: center; overflow-x: auto; overflow-y: hidden; margin: 0px auto;">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
 
