function showRed(x) {
    var w = "warn_color", n = 2;

    if (x.hasClass("datetxtctrl")) {
        w = "datetxtctrl_warn";
    }

    var r = 0, p = x.attr("class") + " ", u = "";
    var v = setInterval(function () {
        r++;
        u = r % 2 ? p + w : p;
        x.attr("class", u);
        if (r == 2 * n) {
            clearInterval(v);
            x.removeClass(w)
        }
    }, 300);
    x.focus();
}

function overlay() {
    if ($("#overlayer").size() == 0) {
        $("body").append("<div id='overlayer' style='background-color: #333;opacity: 0.18;position: fixed;z-index: 100;top: 0px;left:0px;width: 100%;height: 100%;filter:alpha(opacity=18);display: none;'></div>");
    }
    $("#overlayer").show();
}

function closeOverlay() {
    $("#overlayer").hide();
}

function loading() {
    if ($("#loading").size() == 0) {
        $("body").append("<div id='loading' style='background: url(/iuba/v20/ui/images/loading.gif) #ecf5ff no-repeat;width: 80px;height: 80px;position: absolute;top: 45%;left: 45%;z-index: 3000;filter:alpha(opacity=80);opacity: 0.8;display: none;'></div>")
    }
    if ($("#loadingOverlayer").size() == 0) {
        $("body").append("<div id='loadingOverlayer' style='background-color: #333;opacity: 0.18;position: fixed;z-index: 100;top: 0px;left:0px;width: 100%;height: 100%;filter:alpha(opacity=18);display: none;'></div>");
    }
    $("#loading").show();
    $("#loadingOverlayer").show();
}

function hideLoading() {
    $("#loading").remove();
    $("#loadingOverlayer").remove();
}

var Attr = {
    attrlist: [],
    init: function () {
        var self = this;
        $("select[attr_code]").each(function () {
            var attr_code = $(this).attr("attr_code");
            var me = this;
            self.getAttrData(attr_code, true, function (reply) {
                self.render($(me), reply);
            })
        });
    },
    getAttrData: function (attr_code, async, callBack) {
        for (var i = 0; i < this.attrlist.length; i++) {
            if (this.attrlist[i].attr_code == attr_code) {
                callBack && callBack(this.attrlist[i].data);
                return this.attrlist[i].data;
            }
        }
        return this.loadAttrData(attr_code, async, callBack);
    },
    loadAttrData: function (attr_code, async, callBack) {
        var me = this;
        if (typeof(async) == "undefined") {
            async = true;
        }
        if (async) {
            Ajax.getAsy().remoteCall("StaticDataController", "getStaticData", [attr_code], function (reply) {
                var data = reply.getResult();
                me.attrlist.push({ attr_code: attr_code, data: data });

                callBack && callBack(me.attrlist[me.attrlist.length - 1].data || []);
            });
        } else {
            Ajax.getSy().remoteCall("StaticDataController", "getStaticData", [attr_code], function (reply) {
                var data = reply.getResult();
                me.attrlist.push({ attr_code: attr_code, data: data });
            });
            return this.attrlist[this.attrlist.length - 1].data || [];
        }
    },
    render: function ($jq, data) {
        var html = [];
        html.push("<option value=''></option>");
        for (var i = 0; i < data.length; i++) {
            html.push("<option value='" + data[i].attrValue + "'>" + data[i].attrValueDesc + "</option>");
        }
        $jq.html(html.join("")).data("init", 1);
    }
}

var commonJs = {
    getContext: function (context) {
        context = context || $("body");
        if (typeof (context) == "string") {
            context = $(context);
        }
        return context;
    },
    setData: function (context, data) {
        context = this.getContext(context);
        $("input[type='text'],input[type='hidden'],input[type='password'],input[type='file'],textarea", context).each(function () {
            this.value = data[this.name] || "";
        });
        $("input[type='checkbox']", context).each(function () {
            if (data[this.name]) {
                this.checked = data[this.name] == "1" ? true : false;
            }
        });
        $("input[type='radio']", context).each(function () {
            if (data[this.name] && (this.value == data[this.name])) {
                this.checked = true;
            }
        });
        $("select", context).each(function () {
            this.value = data[this.name] || "";
            var me = this;
            var $jq = $(this);
            if ($jq.attr("attr_code") && $jq.data("init") != 1) {
                var v = setInterval(function () {
                    if ($jq.data("init") == 1) {
                        me.value = data[me.name] || "";
                        clearInterval(v);
                    }
                }, 200);
            }
        });
    },
    getData: function (context) {
        context = this.getContext(context);
        var data = {};
        $("input[type='text'],input[type='hidden'],input[type='password'],input[type='file'],textarea", context).each(function () {
            if (this.name) {
                data[this.name] = this.value;
            }
        });
        $("input[type='checkbox']", context).each(function () {
            if (this.name) {
                data[this.name] = this.checked ? "1" : "0";
            }
        });
        $("input[type='radio']", context).each(function () {
            if (this.name && this.checked) {
                data[this.name] = this.value;
            }
        });
        $("select", context).each(function () {
            //alert(this.options[this.selectedIndex].text);
            if (this.name) {
                data[this.name] = this.value;
            }
        });
        return data;
    },
    disabled: function (context) {
        context = this.getContext(context);
        $("input,select,textarea", context).attr("disabled", true);
    },
    enable: function (context) {
        context = this.getContext(context);
        $("input,select,textarea", context).removeAttr("disabled");
    },
    clear: function (context) {
        context = this.getContext(context);
        $("input[type='text'],input[type='hidden'],input[type='password'],input[type='file'],textarea", context).each(function () {
            this.value = "";
        });
        $("input[type='checkbox'],input[type='radio']", context).each(function () {
            this.checked = false;
        });
        $("select", context).each(function () {
            this.value = "";
        });
    },
    validate: function (context) {
        context = this.getContext(context);
        var flag = true;
        $("[nullable='false']", context).each(function () {
            var $jq = $(this);
            if ($.trim($jq.val()) == "") {
                flag = false;
                showRed($jq);
                return false;
            }
        });
        if (flag) {
            $("[valid_type]", context).each(function () {
                var $jq = $(this);
                if ($.trim($jq.val()) == "") {
                    return true;
                }
                if (!EasyuiZX.VTypes[$jq.attr("valid_type")]($jq.val())) {
                    flag = false;
                    showRed($jq);
                    messager.pop($jq, EasyuiZX.VTypes[$jq.attr("valid_type") + "Text"]);
                    return false;
                }
            });
        }
        if (flag) {
            $("[max_length]", context).each(function () {
                var $jq = $(this);
                if ($.trim($jq.val()) == "") {
                    return true;
                }
                if (len($jq.val()) > parseInt($jq.attr("max_length"))) {
                    flag = false;
                    showRed($jq);
                    messager.pop($jq, "不能超过" + $jq.attr("max_length") + "个字符！");
                    return false;
                }
            });
        }

        return flag;
    },
    getWebPath: function () {
        var strFullPath = window.document.location.href;
        var strPath = window.document.location.pathname;
        var pos = strFullPath.indexOf(strPath);
        var prePath = strFullPath.substring(0, pos);
        var postPath = strPath.substring(0, strPath.substr(1).indexOf('/') + 1);
        return (prePath + postPath);
    },
    getUrlParams: function (url) {
        var params = {};
        var index = url.indexOf("?");
        if (index > 0) {
            var search = url.substring(index + 1, url.length)
            var searchs = search.split("&");
            for (var i = 0; i < searchs.length; i++) {
                if (searchs[i] == "") {
                    continue;
                }
                var arr = searchs[i].split("=");
                params[arr[0]] = arr[1];
            }
        }
        return params;
    },
    getUrlParam: function (paramName) {
        var url = location.href;
        if (reMatch = url.match(/\?([^#]+)#?/)) {
            var querystring = reMatch[1];
            var args = querystring.split(/&|=/);
            var arg = {};
            for (i = 0; i < args.length; i += 2) {
                arg[args[i]] = args[i + 1];
            }
            return arg[paramName];
        }
    },
    param: function (params) {
        var result = [];
        for (var obj in params) {
            if (params[obj]) {
                result.push(obj + "=" + params[obj]);
            }
        }
        return result.join("&");
    }
}

function initTab(attr_name, class_name, context, callBack) {
    context = context || $("body");
    if (typeof(context) == "string") {
        context = $("#" + context);
    }
    $("[" + attr_name + "]", context).click(function () {
        setTab(attr_name, class_name, context, $(this));
        callBack && callBack($(this));
    });
}

function setTab(attr_name, class_name, context, $jq) {
    $jq.siblings("[" + attr_name + "]").removeClass(class_name || "curr");
    $jq.addClass(class_name || "curr");
    $("div[" + attr_name + "='" + $jq.attr(attr_name) + "']").siblings("div[" + attr_name + "]").hide();
    $("div[" + attr_name + "='" + $jq.attr(attr_name) + "']").show();
}

$(function () {
    Attr.init();

    //弹出层可拖放
    $(".ui_dialog").draggable({handle: ".ui_dialog_title"});

    //弹出层窗口最大化、最小化
    $("a.win_btn", ".ui_dialog").click(function () {
        var $jq = $(this);
        var $dialog = $jq.closest(".ui_dialog");
        var $dialog_title = $jq.closest(".ui_dialog_title");
        var $dialog_content = $dialog.find(".ui_dialog_content");
        if ($jq.hasClass("big")) {
            $jq.removeClass("big").addClass("small");
            $dialog.data("old_width", $dialog.css("width")).data("old_height", $dialog.css("height"));
            $dialog.data("old_top", $dialog.css("top")).data("old_left", $dialog.css("left"));
            $dialog.css({
                "top": "0px",
                "left": "0px",
                "width": document.documentElement.clientWidth,
                "height": document.documentElement.clientHeight
            });
            $dialog_content.data("old_height", $dialog_content.css("height"));
            $dialog_content.css("height", document.documentElement.clientHeight - $dialog_title.height() - 5);
        } else if ($jq.hasClass("small")) {
            $jq.removeClass("small").addClass("big");
            $dialog.css({
                "top": $dialog.data("old_top"),
                "left": $dialog.data("old_left"),
                "width": $dialog.data("old_width"),
                "height": $dialog.data("old_height")
            });
            $dialog_content.css("height", $dialog_content.data("old_height"));
        }
    });

    //文本框效果
    $(".ui_common_textarea").one("mouseover",function () {
        if ($(this).attr("animate") == "true") {
            $(this).data("width", $(this).width());
            $(this).data("height", $(this).height());
        }
    }).hover(function () {

        },function () {
            if ($(this).attr("animate") == "true") {
                $(this).animate({
                    width: $(this).data("width") || $(this).width(),
                    height: $(this).data("height") || $(this).height()
                }, {
                    easing: 'easeInOutQuad',
                    duration: 500,
                    complete: function () {
                        $(this).css({
                            "position": "static",
                            "overflow": "hidden"
                        });

                        $(this).parent().css("z-index", "");
                    }
                });
            }
        }).click(function () {
            if ($(this).attr("animate") == "true") {

                //ie7的bug，子元素要覆盖父元素的同级元素，父元素必须设置定位属性、z-index
                $(this).parent().css("z-index", "1");

                var NWidth = $(this).attr("NWidth") || $(this).width();
                var NHeight = $(this).attr("NHeight") || $(this).height();
                $(this).css({
                    "position": "absolute",
                    "z-index": "1000",
                    "overflow": "auto"
                }).animate({
                        width: NWidth,
                        height: NHeight
                    }, {
                        easing: 'easeInOutQuad',
                        duration: 500
                    });
            }
        });
})

function accAdd(arg1, arg2) {
    var r1, r2, m;
    try {
        r1 = arg1.toString().split(".")[1].length
    } catch (e) {
        r1 = 0
    }
    try {
        r2 = arg2.toString().split(".")[1].length
    } catch (e) {
        r2 = 0
    }
    m = Math.pow(10, Math.max(r1, r2))
    return (arg1 * m + arg2 * m) / m
}

function subtr(arg1, arg2) {
    var r1, r2, m, n;
    try {
        r1 = arg1.toString().split(".")[1].length
    } catch (e) {
        r1 = 0
    }
    try {
        r2 = arg2.toString().split(".")[1].length
    } catch (e) {
        r2 = 0
    }
    m = Math.pow(10, Math.max(r1, r2));
    //动态控制精度长度
    n = (r1 >= r2) ? r1 : r2;
    return ((arg1 * m - arg2 * m) / m).toFixed(n);
}
