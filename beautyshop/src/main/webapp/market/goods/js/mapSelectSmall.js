var VIEW_TYPE = "CHN_ORG_VIEW";
var orgTree = null;
var curTreeNode = null;
var crmMap = null;
var map_mode = "";//mark_chn(标注网点),repos_chn(调整位置)
var tempMarker = null;
var dragMarkers = {};
var tempPolyon = null;
var dragPolyons = {};
var search_empty = "请输入网点名称/网点编码";
var cur_e_types = ",BIZ_HALL_SELF,";
var cur_o_types = "-1";//运营商
var cur_prov_sup_channel_types = "-1";//省内大类
var cur_prov_channel_types = "-1";//省内小类
var cur_prov_channel_subtypes = "-1";//省内子类
var cur_claim_states = "-1";
var cur_query_content = "";
var cur_date_type = "";
var cur_mission_rule = "";
var cur_date = "";
var cur_min_lat = NaN;
var cur_max_lat = NaN;
var cur_min_lng = NaN;
var cur_max_lng = NaN;

var cur_zoom = 0;

var level1 = new Array();//省级
var level2 = new Array();//市级
var level3 = new Array();//县级

var zoomToOrgLevel = {};
zoomToOrgLevel['6'] = '1';
zoomToOrgLevel['7'] = '2';
zoomToOrgLevel['8'] = '2';
zoomToOrgLevel['9'] = '3';
zoomToOrgLevel['10'] = '3';

var clickListener = null;//选定区域状态下的地图点击事件
var moveListener = null;//选定区域状态下的地图鼠标移动事件
var cur_rect = null;
var cur_clickCircle = null;//当前选择的商圈

jQ(function () {

    if (crmMap == null && !jQ("#map_frame").attr("src")) {
        initMap();
    }

});


/**
 * 关闭网点分类框
 * @param dom
 */
function closeTip(dom) {
    jQ(dom).parent().parent().hide();
}

function getElementWidth(dom) {
    return dom.offsetWidth;
}

function getAbsoluteLeft(dom) {
    oLeft = dom.offsetLeft;
    while (dom.offsetParent != null) {
        oParent = dom.offsetParent;
        oLeft += oParent.offsetLeft;
        dom = oParent;
    }
    return oLeft;
}

function getAbsoluteTop(dom) {
    oTop = dom.offsetTop;
    while (dom.offsetParent != null) {
        oParent = dom.offsetParent;
        oTop += oParent.offsetTop;
        dom = oParent;
    }
    return oTop;
}


/**
 * 根据checkbox过虑网点
 */
function filtrChannel() {
    if (crmMap != null) {
        for (var a in crmMap.CRMMarkerMap_) {
            var crmMarker = crmMap.CRMMarkerMap_[a];
            if (channelFilter(cur_e_types, cur_o_types, cur_prov_sup_channel_types, cur_prov_channel_types, cur_prov_channel_subtypes, cur_claim_states, crmMarker.eType_, crmMarker.oType_, crmMarker.provSupChannelType_, crmMarker.provChannelType_, crmMarker.provChannelSubtype_, crmMarker.staffId_) == true) {
                crmMarker.marker_.setMap(null);
            }
            else {
                if (crmMarker.marker_.getMap() == null) {
                    crmMarker.marker_.setMap(crmMap.map_);
                }
            }
        }

        for (var a in crmMap.CRMStatMap_) {
            var crmStat = crmMap.CRMStatMap_[a];
            if (channelFilter(cur_e_types, cur_o_types, cur_prov_sup_channel_types, cur_prov_channel_types, cur_prov_channel_subtypes, cur_claim_states, crmStat.eType_, crmStat.oType_, crmStat.provSupChannelType_, crmStat.provChannelType_, crmStat.provChannelSubtype_, crmStat.staffId_) == true) {
                crmStat.setMap(null);
            }
            else {
                if (crmStat.getMap() == null) {
                    crmStat.setMap(crmMap.map_);
                }
            }
        }
    }
}

/**
 * 移除电信网点
 */
function removeTelChn() {
    if (crmMap == null) {
        return;
    }

    for (var a in crmMap.CRMMarkerMap_) {
        var crmMarker = crmMap.CRMMarkerMap_[a];
        if (crmMarker.eType_ == "BIZ_HALL_SELF") {
            crmMarker.removeFromMap();
        }
    }

    for (var a in crmMap.CRMStatMap_) {
        var crmStat = crmMap.CRMStatMap_[a];
        if (crmStat.eType_ == "BIZ_HALL_SELF") {
            crmStat.removeFromMap();
        }
    }

    cur_min_lat = NaN;
    cur_max_lat = NaN;
    cur_min_lng = NaN;
    cur_max_lng = NaN;
}

/**
 * 查询内容框
 */
function initQueryContent() {
    jQ("#query_content").focus(function () {
        if (jQ(this).val() == search_empty) {
            jQ(this).val("").removeClass("input_empty");
        }
    }).blur(function () {
            if (!jQ(this).val()) {
                jQ(this).addClass("input_empty").val(search_empty);
            }
        });
}


/**
 * 初始化地图
 */
function initMap() {
    Ajax.getSy().remoteCall("MapService", "getMapInfoById", ["2001"], function (reply) {
        var result = reply.getResult();

//		if(curTreeNode){
        //		if(curTreeNode.map_init_zoom){
//				result.init_zoom = curTreeNode.map_init_zoom;
//			}
//			
        //		if(curTreeNode.map_position){
        //			var latLng = curTreeNode.map_position.split(",");
        //			if(latLng.length > 1){
        //				result.center_lat = latLng[0];
        //				result.center_lng = latLng[1];
        //			}
        //		}
//		}
        //result.init_zoom =9;
        //	result.center_lat = 29.68805 ;
        //	result.center_lng =  106.5815 ;
        result.edit_mode = "showinfo";
        crmMap = init(result);

        crmMap.map_.setOptions({panControlOptions: {position: google.maps.ControlPosition.RIGHT_TOP}, zoomControlOptions: {position: google.maps.ControlPosition.RIGHT_TOP}});

        setTimeout(function () {
            crmMap.addListener("click", onMapClcik);

            crmMap.addListener("dragend", function () {
                loadMgrChannels(cur_query_content, false);
            });

            crmMap.addListener("idle", function () {
                onZoomChange();
            });

            loadBizCircles();
        }, 0);
    });
}

/**
 * 加载网点
 * @param query_content
 * @param is_center
 */
function loadMgrChannels(query_content, is_center, crmPolyon) {
    if (crmMap == null) {
        return;
    }

    //11级以上才加载网点
    var zoom = crmMap.map_.getZoom();
    if (zoom < 13) {
        return;
    }

    var bounds = crmMap.map_.getBounds();
    var min_lat = bounds.getSouthWest().lat();
    var max_lat = bounds.getNorthEast().lat();
    var min_lng = bounds.getSouthWest().lng();
    var max_lng = bounds.getNorthEast().lng();

    if (!isOutOfBounds(bounds)) {
        return;
    }

    if (jQ("#biz_stats").is(":checked")) {
        Ajax.getAsy().remoteCall("ChnMgrMapService", "loadMgrChannelsStats", [query_content, min_lat, max_lat,
            min_lng, max_lng, crmMap.loadMode_, cur_date_type, cur_mission_rule, cur_date], function (reply) {
            var map_zoom = crmMap.map_.getZoom();
            if (map_zoom < 11) {
                return;
            }

            var data = jQ.parseJSON(reply.getResult());
            crmMap.loadElements(data, {e_types: cur_e_types, o_types: cur_o_types, prov_sup_channel_types: cur_prov_sup_channel_types, prov_channel_types: cur_prov_channel_types,
                prov_channel_subtypes: cur_prov_channel_subtypes, claim_states: cur_claim_states, is_center: is_center, is_stats: true, dateType: cur_date_type, bizType: cur_mission_rule, date: cur_date});

            if (crmPolyon) {
                onPolyonClick(crmPolyon);
            }
        });
    }
//	else if( jQ("#biz_base").is(":checked") ) {
    else if (true) { //默认加载基站
        Ajax.getAsy().remoteCall("ChnMgrMapService", "loadMgrChannels", [query_content, min_lat, max_lat, min_lng, max_lng, crmMap.loadMode_], function (reply) {
            var map_zoom = crmMap.map_.getZoom();
            if (map_zoom < 13) {
                return;
            }

            var data = jQ.parseJSON(reply.getResult());
            crmMap.loadElements(data, {e_types: cur_e_types, o_types: cur_o_types, prov_sup_channel_types: cur_prov_sup_channel_types, prov_channel_types: cur_prov_channel_types,
                prov_channel_subtypes: cur_prov_channel_subtypes, claim_states: cur_claim_states, is_center: is_center, is_stats: false});

            if (crmPolyon) {
                onPolyonClick(crmPolyon);
            }
        });
    }
}

/**
 * 判断当前可视范围是否已经加载过网点
 * @param bounds
 * @returns {Boolean}
 */
function isOutOfBounds(bounds) {
    if (bounds) {
        var min_lat = bounds.getSouthWest().lat();
        var max_lat = bounds.getNorthEast().lat();
        var min_lng = bounds.getSouthWest().lng();
        var max_lng = bounds.getNorthEast().lng();

        if (isNaN(cur_min_lat) || isNaN(cur_max_lat) || isNaN(cur_min_lng) || isNaN(cur_max_lng)) {
            cur_min_lat = min_lat;
            cur_max_lat = max_lat;
            cur_min_lng = min_lng;
            cur_max_lng = max_lng;

            return true;
        }

        if (min_lat >= cur_min_lat && max_lat <= cur_max_lat && min_lng >= cur_min_lng && max_lng <= cur_max_lng) {
            return false;
        }
        else {
            cur_min_lat = min_lat < cur_min_lat ? min_lat : cur_min_lat;
            cur_max_lat = max_lat > cur_max_lat ? max_lat : cur_max_lat;
            cur_min_lng = min_lng < cur_min_lng ? min_lng : cur_min_lng;
            cur_max_lng = max_lng > cur_max_lng ? max_lng : cur_max_lng;

            return true;
        }
    }

    return true;
}

/**
 * 地图级别改变事件
 */
function onZoomChange() {
    var zoom = crmMap.map_.getZoom();

    if ((zoom == 8 && cur_zoom == 7) || (zoom == 7 && cur_zoom == 8)) {
        cur_zoom = zoom;
        return;
    }

    if ((zoom == 10 && cur_zoom == 9) || (zoom == 9 && cur_zoom == 10)) {
        cur_zoom = zoom;
        return;
    }

    if (zoom >= 11 && cur_zoom >= 11) {
        cur_zoom = zoom;
        loadMgrChannels(cur_query_content, false);
        return;
    }

    if (zoom == 6) {
        if (zoom == cur_zoom) {
            return;
        }

        hideLevel2();
        hideLevel3();
        hideChannel();
        hideCircle();

        if (level1.length < 1) {
            loadMgrChnCount(zoom);
        }
        else {
            showLevel1();
        }
    }
    else if (zoom == 7 || zoom == 8) {
        if (zoom == cur_zoom) {
            return;
        }

        hideLevel1();
        hideLevel3();
        hideChannel();
        hideCircle();

        if (level2.length < 1) {
            loadMgrChnCount(zoom);
        }
        else {
            showLevel2();
        }
    }
    else if (zoom == 9 || zoom == 10) {
        if (zoom == cur_zoom) {
            return;
        }

        hideLevel1();
        hideLevel2();
        hideChannel();
        hideCircle();

        if (level3.length < 1) {
            loadMgrChnCount(zoom);
        }
        else {
            showLevel3();
        }
    }
    else if (zoom >= 11) {
        hideLevel1();
        hideLevel2();
        hideLevel3();

        showChannel();
        showCircle();

        loadMgrChannels(cur_query_content, false);
    }

    cur_zoom = zoom;
}

/**
 * 加载组织网点数(省、市、县)
 * @param zoom
 */
function loadMgrChnCount(zoom) {
    //省、市、县级不重复加载
    if ((zoom == 6 && level1.length > 0) || ((zoom == 7 || zoom == 8) && level2.length > 0) || ((zoom == 9 || zoom == 10) && level3.length > 0) || zoom >= 11) {
        return;
    }

    var curLevel = getCurLevel(zoom);
    if (curLevel == null) {
        return;
    }

    Ajax.getAsy().remoteCall("ChnMgrMapService", "loadMgrChnCount", [zoom], function (reply) {
        var result = reply.getResult();
        if (result && result.length > 0) {
            for (var i = 0; i < result.length; i++) {
                var attr = result[i];
                var org_level = attr.org_level;
                var map_zoom = crmMap.map_.getZoom();//数据加载完后地图大小级别可能变了
                if (zoomToOrgLevel[map_zoom + ''] != org_level) {
                    continue;//同一批数据的org_level都是相同的
                }

                var options = {
                    position: attr.lat_lng,
                    count: attr.count,
                    crmObjId: attr.obj_id,
                    crmObjName: attr.obj_name,
                    crmObjType: attr.obj_type,
                    hasCache: true
                };

                var crmStat = crmMap.createStat(options);
                curLevel.push(crmStat);
            }
        }
    });
}

/**
 * 获取地图级别对应的组织级别
 * @param zoom
 * @returns
 */
function getCurLevel(zoom) {
    if (zoom == 6) {
        return level1;
    }
    else if (zoom == 7 || zoom == 8) {
        return level2;
    }
    else if (zoom == 9 || zoom == 10) {
        return level3;
    }

    return null;
}

/**
 * 隐藏省级网点数
 */
function hideLevel1() {
    for (var i = 0; i < level1.length; i++) {
        var crmStat = level1[i];
        crmStat.hide();
    }
}

/**
 * 隐藏市级网点数
 */
function hideLevel2() {
    for (var i = 0; i < level2.length; i++) {
        var crmStat = level2[i];
        crmStat.hide();
    }
}

/**
 * 隐藏县级网点数
 */
function hideLevel3() {
    for (var i = 0; i < level3.length; i++) {
        var crmStat = level3[i];
        crmStat.hide();
    }
}

/**
 * 隐藏网点
 */
function hideChannel() {
    if (crmMap == null) {
        return;
    }

    for (var a in crmMap.CRMMarkerMap_) {
        var crmMarker = crmMap.CRMMarkerMap_[a];
        crmMarker.setMap(null);
    }

    for (var a in crmMap.CRMStatMap_) {
        var crmStat = crmMap.CRMStatMap_[a];
        crmStat.hide();
    }
}

/**
 * 隐藏商圈
 */
function hideCircle() {
    if (crmMap == null) {
        return;
    }

    for (var a in crmMap.CRMPolyonMap_) {
        crmMap.CRMPolyonMap_[a].polyon_.setMap(null);
    }
}

/**
 * 显示省级网点数
 */
function showLevel1() {
    if (crmMap == null) {
        return;
    }

    for (var i = 0; i < level1.length; i++) {
        var crmStat = level1[i];
        crmStat.show();
    }
}

/**
 * 显示市级网点数
 */
function showLevel2() {
    if (crmMap == null) {
        return;
    }

    for (var i = 0; i < level2.length; i++) {
        var crmStat = level2[i];
        crmStat.show();
    }
}

/**
 * 显示县级网点数
 */
function showLevel3() {
    if (crmMap == null) {
        return;
    }

    for (var i = 0; i < level3.length; i++) {
        var crmStat = level3[i];
        crmStat.show();
    }
}

/**
 * 显示网点
 */
function showChannel() {
    if (crmMap == null) {
        return;
    }

    for (var a in crmMap.CRMMarkerMap_) {
        var crmMarker = crmMap.CRMMarkerMap_[a];
        crmMarker.setMap(crmMap.map_);
    }

    for (var a in crmMap.CRMStatMap_) {
        var crmStat = crmMap.CRMStatMap_[a];
        crmStat.show();
    }


}

/**
 * 显示商圈
 */
function showCircle() {
    if (crmMap == null) {
        return;
    }

    if (jQ("#biz_circle").is(":checked")) {
        for (var a in crmMap.CRMPolyonMap_) {
            crmMap.CRMPolyonMap_[a].polyon_.setMap(crmMap.map_);
        }
    }
}

/**
 * 加载商圈
 */
function loadBizCircles() {
    Ajax.getAsy().remoteCall("ChnMgrMapService", "loadBizCircles", [], function (reply) {
        var data = jQ.parseJSON(reply.getResult());
        crmMap.loadElements(data);
        //在商圈上注册click事件，实现商圈上网点标注;
        for (var a in crmMap.CRMPolyonMap_) {
            crmMap.CRMPolyonMap_[a].addListener("click", onMapClcik);
        }
    });
}

/**
 * 查询按钮事件
 */
function searchChannels() {
    if (crmMap != null) {
        clearMarkers();
    }

    var query_content = jQ("#query_content").val();
    cur_query_content = query_content == search_empty ? "" : jQ.trim(query_content);

    if (crmMap.getZoom() < 13) {
        crmMap.setZoom("13");
    }

    loadMgrChannels(cur_query_content);
}

/**
 * 清空网点
 */
function clearMarkers() {
    if (crmMap != null) {
        crmMap.clearMarkers();
        crmMap.clearStats();

        cur_min_lat = NaN;
        cur_max_lat = NaN;
        cur_min_lng = NaN;
        cur_max_lng = NaN;
    }
}


var locateOreFullPath = new Array();


/**
 * 地图点击事件
 * @param event
 */
function onMapClcik(event) {
    if (crmMap == null) {
        return;
    }

    if (crmMap.curMarker_ && map_mode != "mark_chn") {
        crmMap.curMarker_.stopBounce();
    }

    if (map_mode == "mark_chn") {
        if (tempMarker == null) {
            Ajax.getSy().remoteCall("ChnMgrMapService", "getMarkerImg", [""], function (reply) {
                var result = reply.getResult();
                if (result && result.channel_id) {
                    var options = {
                        crmObjId: result.channel_id,
                        crmObjName: result.channel_name,
                        imgFileName: result.icon_img,
                        position: event.latLng
                    };

                    var crmMarker = crmMap.createMarkerByOptions(options);
                    if (crmMarker) {
                        tempMarker = crmMarker;
                        crmMarker.startBounce();
                    }
                }
                else {
                    alert("该网点数据异常，可能该组织没有关联的网点数据，请取消标注网点操作");
                }
            });
        }
    }
    else if (map_mode == "mark_circle") {
        if (tempPolyon && tempPolyon.polyon_.getPath().length < 3) {
            tempPolyon.draw(event.latLng);
        }
    }
}

/**
 * 地图上[标注网点/保存标注]按钮事件
 * @returns
 */
function onMarkChnClick() {
    if (map_mode && map_mode != "mark_chn") {
        alert("请先取消其他操作再进行标注网点");
        return "";
    }

    if (map_mode == "mark_chn") {
        if (tempMarker == null) {
            alert("请在地图上标注网点的位置后再保存，或者点击取消按钮");
            return "";
        }

        Ajax.getAsy().remoteCall("ChnMgrMapService", "saveChnPosition", [tempMarker.crmObjId_, tempMarker.crmObjName_, tempMarker.getPositionStr(), crmMap.loadMode_], function (reply) {
            var data = reply.getResult();
            crmMap.loadElements(jQ.parseJSON(data), {e_types: "-1", o_types: "-1", prov_sup_channel_types: "-1", prov_channel_types: "-1", prov_channel_subtypes: "-1", claim_states: "-1", is_center: false});
        });

        crmMap.removeMarkerById(tempMarker.id_);

        tempMarker = null;
        map_mode = "";
        crmMap.editMode_ = "showinfo";

        return "标注网点";
    }
    else {
        if (crmMap != null && crmMap.curMarker_) {
            crmMap.curMarker_.stopBounce();
        }


        var hasPosition = false;


        if (hasPosition) {
            alert("当前网点已经存在位置信息，如需要调整位置请点击“调整位置”按钮");
            return null;
        }

        map_mode = "mark_chn";
        crmMap.editMode_ = "edit";
        crmMap.closeAllInfoBubble();

        return "保存标注";//改变按钮text
    }
}

/**
 * 地图上[调整网点/保存位置]按钮事件
 * @returns {String}
 */
function onReposChnClick() {
    if (map_mode && map_mode != "repos_chn") {
        alert("请先取消其他操作再进行调整位置");
        return "";
    }

    if (map_mode == "repos_chn") {
        if (!jQ.isEmptyObject(dragMarkers)) {
            var markerPosArr = [];
            for (var a in dragMarkers) {
                var crmMarker = dragMarkers[a];

                var markerPos = {};
                markerPos.e_id = crmMarker.id_;
                markerPos.position = crmMarker.getPositionStr();
                markerPosArr.push(markerPos);
            }

            Ajax.getAsy().remoteCall("ChnMgrMapService", "saveChnsPosition", [markerPosArr], function (reply) {

            });
        }

        for (var a in crmMap.CRMMarkerMap_) {
            var crmMarker = crmMap.CRMMarkerMap_[a];
            if (crmMarker.eType_ == "BIZ_HALL_SELF") {//电信网点
                crmMarker.marker_.setDraggable(false);
            }
        }

        dragMarkers = {};
        map_mode = "";
        crmMap.editMode_ = "showinfo";

        return "调整网点";
    }
    else {
        map_mode = "repos_chn";
        crmMap.editMode_ = "edit";
        crmMap.closeAllInfoBubble();

        dragMarkers = {};
        for (var a in crmMap.CRMMarkerMap_) {
            var crmMarker = crmMap.CRMMarkerMap_[a];
            if (crmMarker.eType_ == "BIZ_HALL_SELF") {//电信网点
                crmMarker.marker_.setDraggable(true);
                crmMarker.addListener("dragend", function (event, target) {
                    if (target && target.id_) {
                        dragMarkers[target.id_] = target;
                    }
                }, crmMarker);
            }
        }

        return "保存位置";
    }
}

/**
 * 取消网点的标注
 * @returns
 */
function onRmvMarkClick() {
    if (crmMap.curMarker_) {

        if (crmMap != null && crmMap.curMarker_) {
            crmMap.curMarker_.stopBounce();
        }


        var org_name = crmMap.curMarker_.crmObjName_;// curTreeNode.name;
        org_name = org_name ? org_name : "";

        var index = org_name.indexOf(".");
        org_name = index != -1 ? org_name.substr(index + 1) : org_name;

        if (!confirm("确定清空 位置信息？")) {
            return;
        }


        var e_id = crmMap.curMarker_.id_;//curTreeNode.map_e_id; sd

        Ajax.getAsy().remoteCall("ChnMgrMapService", "rrmoveChnPosition", [e_id], function (reply) {
            var result = reply.getResult();
            if (result) {
                var crmMarker = crmMap.CRMMarkerMap_[e_id];
                if (crmMarker) {
                    crmMarker.removeFromMap();
                    //	delete curTreeNode.map_e_id;
                    //	delete curTreeNode.map_position;
                    //	delete curTreeNode.map_init_zoom;
                }
            }
        });
    } else if (crmMap.curPolyon_) {
        var name = crmMap.curPolyon_.crmObjName_;
        var e_id = crmMap.curPolyon_.id_;
        if (!e_id) {
            alert("当前没有选择对象，不需要取消标注");
        }

        if (!confirm("确定清空 ？")) {
            return;
        }


        Ajax.getAsy().remoteCall("ChnBizCircleService", "deleteCircle", [e_id], function (reply) {
            var result = reply.getResult();
            if (result) {
                var cRMPolyon = crmMap.CRMPolyonMap_[e_id];
                if (cRMPolyon) {
                    cRMPolyon.removeFromMap();
                    crmMap.curPolyon_ = null;
                    window.parent && window.parent.clearCircle();
                }
            }
        });
    } else {
        alert("当前没有选择对象，不需要取消标注");
    }
}

/**
 * 地图上[标注商圈/保存标注]按钮事件
 * @returns
 */
function onMarkCircleClick() {
    if (map_mode && map_mode != "mark_circle") {
        alert("请先取消其他操作再进行标注商圈");
        return "";
    }

    if (map_mode == "mark_circle") {
        if (tempPolyon == null) {
            alert("请在地图上标注商圈的范围后再保存，或者点击取消按钮");
            return "";
        }

        if (tempPolyon.polyon_.getPath().length < 3) {
            alert("商圈最少需要三个点组成");
            return "";
        }
        var circle_id = tempPolyon.crmObjId_;
        var circle_name = tempPolyon.crmObjName_;
        var path = tempPolyon.getPathStr();

        Ajax.getAsy().remoteCall("ChnMgrMapService", "saveCirclePath", [circle_id, circle_name, path], function (reply) {
            var data = reply.getResult();
            //更新基站情况
            upldateCircleCel(tempPolyon);
            tempPolyon.removeFromMap();
            tempPolyon = null;
            crmMap.loadElements(jQ.parseJSON(data));
//            crmMap.curPolyon_ = null;
            parent.addCircleId && parent.addCircleId(circle_id);
        });


        map_mode = "";
        crmMap.editMode_ = "showinfo";

        return "标注商圈";
    }
    else {
        var params = {};
        params.mark_state = "unmark";//只查询已标注地图范围的商圈


        if (window.parent.isHaveCircle()) {
            alert("已画营销区域!");
            return;
        }
        var result = "";
        var callback = function (reply) {
            result = reply.getResult();

        }
        Ajax.getSy().remoteCall("DmGoodsInstController", "insertDmBizCircle", [
            { }
        ], callback);


        if (result) {
            if (crmMap != null) {
                var options = {
                    crmObjId: result.circleId,
                    crmObjName: "营销范围",
                    editable: true
                };

                tempPolyon = crmMap.createPolyonByOptions(options);

                map_mode = "mark_circle";
                crmMap.editMode_ = "edit";
                crmMap.closeAllInfoBubble();

                return "保存标注";
            }
        }
    }
}

/**
 * 更新商圈基站情况
 */
function upldateCircleCel(crmPolyon) {
    if (crmMap == null || !crmPolyon) {
        return;
    }

    var cellIds = [];
    if (jQ("#biz_stats").is(":checked")) {
        for (var a in crmMap.CRMStatMap_) {
            var crmStat = crmMap.CRMStatMap_[a];
            if (crmPolyon.containsLocation(crmStat.position)) {
                cellIds.push(crmStat.crmObjId_);
            }
        }
    }
    else {
        for (var a in crmMap.CRMMarkerMap_) {
            var crmMarker = crmMap.CRMMarkerMap_[a];
            if (crmPolyon.containsLocation(crmMarker.getPosition())) {
                cellIds.push(crmMarker.crmObjId_);
            }
        }
    }

    var e_id = crmPolyon.id_;
    var circle_id = crmPolyon.crmObjId_;
    var param = {};
    param.circle_id = circle_id;
    param.cellIds = cellIds;
    //二次测试临时添加的商圈业务量统计
    Ajax.getAsy().remoteCall("MapService", "upldateCircleCel", [param], function (reply) {
        var result = reply.getResult();

    });
}

/**
 * 地图上[调整商圈/保存商圈]按钮事件
 * @returns {String}
 */
function onReposCircleClick() {
    if (map_mode && map_mode != "repos_circle") {
        alert("请先取消其他操作再进行调整商圈");
        return "";
    }

    if (map_mode == "repos_circle") {
        if (!jQ.isEmptyObject(dragPolyons)) {
            var polyonPathArr = [];
            for (var a in dragPolyons) {
                var crmPolyon = dragPolyons[a];

                var polyonPath = {};
                polyonPath.e_id = crmPolyon.id_;
                polyonPath.path = crmPolyon.getPathStr();
                polyonPathArr.push(polyonPath);
            }

            Ajax.getAsy().remoteCall("ChnMgrMapService", "saveCirclesPath", [polyonPathArr], function (reply) {

            });

            for (var a in dragPolyons) {
                var crmPolyon = dragPolyons[a];
                //更新商圈的基站
                upldateCircleCel(crmPolyon);
            }
        }

        for (var a in crmMap.CRMPolyonMap_) {
            var crmPolyon = crmMap.CRMPolyonMap_[a];
            crmPolyon.polyon_.setEditable(false);
        }

        dragPolyons = {};
        map_mode = "";
        crmMap.editMode_ = "showinfo";

        return "调整商圈";
    }
    else {
        map_mode = "repos_circle";
        crmMap.editMode_ = "edit";
        crmMap.closeAllInfoBubble();

        dragPolyons = {};
        for (var a in crmMap.CRMPolyonMap_) {
            var crmPolyon = crmMap.CRMPolyonMap_[a];
            crmPolyon.polyon_.setEditable(true);
            crmPolyon.addListener("mousedown", function (event, target) {
                if (target && target.id_) {
                    dragPolyons[target.id_] = target;
                }
            }, crmPolyon);
        }

        return "保存商圈";
    }
}

function onRectChooseClick() {
    if (map_mode && map_mode != "rect_choose") {
        alert("请先取消其他操作再进行选定区域");
        return "";
    }

    if (map_mode == "rect_choose") {
        if (cur_rect != null) {
            cur_rect.setMap(null);
            cur_rect = null;
        }

        if (clickListener != null) {
            crmMap.removeListener(clickListener);
            clickListener = null;
        }

        if (moveListener != null) {
            crmMap.removeListener(moveListener);
            moveListener = null;
        }

        map_mode = "";
        return "选定区域";
    }
    else {
        map_mode = "rect_choose";

        if (cur_rect == null) {
            var options = {
                strokeColor: "#798BF0",
                strokeOpacity: 0.8,
                strokeWeight: 1,
                fillColor: "#798BF0",
                fillOpacity: 0.35,
                map: crmMap.map_,
                clickable: false
            };
            cur_rect = crmMap.createRectangle(options);
        }

        var beginlatlng = "";//记录起始点坐标
        var endlatlng = "";//记录结束点坐标
        var click_count = 0;//点击次数

        clickListener = crmMap.addListener("click", function (event) {
            var begin = event.latLng;
            click_count++;
            if (click_count == 1) {
                moveListener = crmMap.addListener("mousemove", function (e) {
                    beginlatlng = begin;
                    endlatlng = e.latLng;
                    var min_lat = Math.min(beginlatlng.lat(), endlatlng.lat());
                    var min_lng = Math.min(beginlatlng.lng(), endlatlng.lng());
                    var max_lat = Math.max(beginlatlng.lat(), endlatlng.lat());
                    var max_lng = Math.max(beginlatlng.lng(), endlatlng.lng());
                    var sw = crmMap.createLatLng(min_lat, min_lng);
                    var ne = crmMap.createLatLng(max_lat, max_lng);
                    cur_rect.setOptions({bounds: crmMap.createBounds(sw, ne)});
                });
            }
            else {
                crmMap.removeListener(moveListener);
                click_count = 0;

                jQ("#rect_choose").click();
                computeRectChn(cur_rect);
            }
        });

        return "取消选定";
    }
}

/**
 * 地图上[取消]按钮事件
 */
function onCancelClick() {
    if (map_mode == "mark_chn") {
        if (tempMarker) {
            crmMap.removeMarkerById(tempMarker.id_);
            tempMarker = null;
        }
    }
    else if (map_mode == "repos_chn") {
        if (!jQ.isEmptyObject(dragMarkers)) {
            clearMarkers();
            loadMgrChannels(cur_query_content, false);

            dragMarkers = {};
        }
        else {
            for (var a in crmMap.CRMMarkerMap_) {
                var crmMarker = crmMap.CRMMarkerMap_[a];
                crmMarker.marker_.setDraggable(false);
            }
        }
    }
    else if (map_mode == "mark_circle") {
        if (tempPolyon) {
            if (crmMap && crmMap.curPolyon_ == tempPolyon) {
                crmMap.curPolyon_ = null;
            }

            tempPolyon.removeFromMap();
            tempPolyon = null;
        }
    }
    else if (map_mode == "repos_circle") {
        if (!jQ.isEmptyObject(dragPolyons)) {
            crmMap.clearPolyons();
            loadBizCircles();

            dragPolyons = {};
        }
        else {
            for (var a in crmMap.CRMPolyonMap_) {
                var crmPolyon = crmMap.CRMPolyonMap_[a];
                crmPolyon.polyon_.setEditable(false);
            }
        }
    }
    else if (map_mode == "rect_choose") {
        onRectChooseClick();
    }

    map_mode = "";
    crmMap.editMode_ = "showinfo";
}


/**
 * 刷新业务量
 */
function refreshStats() {
    cur_date_type = jQ("#date_type").combobox("getValue");
    cur_mission_rule = jQ("#mission_rule").combobox("getValue");
    cur_date = jQ("#date").val();

    if (!cur_date) {
        alert("统计时间不能为空");
        return;
    }

    removeTelChn();

    loadMgrChannels(cur_query_content, false);
}

/**
 * 网点点击事件(CRMElement.onElementClick中调用此方法)
 * @param channel_id
 */
function onMarkerClick(channel_id) {

}


/**
 * 取得当前选择的商圈
 * @returns {___anonymous44822_44823}
 */
function getClickCircle() {
    return cur_clickCircle;
}


/**
 * 清空商圈
 */
function clear_circle_name_onClcik() {
    jQ("#circle_id").val("");
    jQ("#circle_name").val("");
}

/**
 * 商圈点击事件
 */
function onPolyonClick(crmPolyon) {
    if (!crmPolyon) {
        return;
    }
    cur_clickCircle = {};//清空之前选择的商圈
    var circle_id = crmPolyon.crmObjId_;
    if (circle_id) {

        parent.addCircleId && parent.addCircleId(circle_id);

    }

    return;
}
 
 
 
 