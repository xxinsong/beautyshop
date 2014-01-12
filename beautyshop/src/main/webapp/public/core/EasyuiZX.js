var path_prefix = '/';//getWebPath();//'/DataMarket/';
var js_path_prefix =  getWebPath();//'/DataMarket/';


EasyuiZX = {
	version : '2.0'
};

EasyuiZX._import = function(type, path, className, lang) {
	if (type == "js") {
		document.write("<script type='text/javascript' src='" + path_prefix + path + "' " + (lang ? "charset='" + lang + "'" : "") + "></script>");
	} else if (type == "css") {
		document.write("<link type='text/css' rel='stylesheet' href='" + path_prefix + path + "'/>");
	} else if (type == "behavior") {
		document.write('<style>' + className + '{behavior:url(' + path_prefix + path + '); }</style>');
	} else if (type == "namespace") {
		document.write('<?import namespace="' + className + '" implementation="' + path_prefix + path + '" />');
	} else if (type == "text") {
		document.write('<script language="JavaScript">' + path + '</script>');
	}
};

EasyuiZX.importLib = function(lib) {

	switch (lib) {
	       case "kernel" : {
	    	   this._import("js", "public/jquery/jquery-1.9.1.min.js");
	    	   this._import("js", "dwr/engine.js");
	    	   this._import("js", "public/ajax/Ajax.js");
	    	   this._import("js", "public/core/Base.js");
	    	   this._import("js", "public/core/LAB.min.js");
	    	   this._import("js", "public/core/VTypes.js");
	    	   this._import("js", "public/core/html.js");
	    	   this._import("js", "public/easyui/v4/common.js");
	    	   this._import("js", "public/jquery/jquery.form.js");
	    	   this._import("js", "public/jquery/jquery.easing.min.js");
	    	   this._import("js", "public/jquery/jquery-dateFormat.min.js");
	    	   this._import("js", "public/jquery/jquery.browser.js");

			   break; 
	       }
	       case "internet" : {
	    	   this._import("css", "public/v20/ui/css/reset.css");
	    	   this._import("css", "public/v20/ui/css/style.css");
	    	   this._import("css", "public/v20/ui/css/pager.css");
	    	   this._import("css", "public/v20/ui/css/common.css");
               
	    	   this._import("js", "public/v20/ui/js/common.js");
	    	   this._import("js", "public/v20/ui/js/pager.js");
	    	   this._import("js", "public/v20/ui/js/tab.js");
	    	   this._import("js", "public/v20/ui/js/messager.js");
			   
			   break;
	       }
	       case "market": {
	    	   this._import("css", "market/main/css/reset.css");
	    	   this._import("css", "market/main/css/style.css");
	    	   this._import("js", "public/easyui/jquery.easyui.min.js");
	    	   this._import("js", "public/v20/ui/js/common.js");
	    	   this._import("js", "public/v20/ui/js/msg.js");
	    	   this._import("css", "market/main/css/common.css");
	    	   this._import("js", "public/core/pager.js");
		       break;
	       }
	       case "easyui" : {
	    	   this._import("js", "public/easyui/jquery.easyui.min.js");
	    	   this._import("js", "public/easyui/dwrloader.js");
	    	   this._import("js", "public/easyui/dwrEasyext.js");
	    	   this._import("css", "public/easyui/themes/default/easyui.css");
	    	   this._import("css", "public/easyui/themes/icon.css");
		       break;
	       }
	       case "WdatePicker" : {
	    	   this._import("js", "public/widgets/date/My97DatePicker/WdatePicker.js");
		       break;
	       }
	       case "zTree" : {
	    	   this._import("css", "public/widgets/zTree/css/zTreeStyle/zTreeStyle.css");
	    	   this._import("js", "public/widgets/zTree/js/jquery.ztree.core-3.5.js");
		       break;
	       }
	}
};

(function() {
	EasyuiZX.importLib('kernel');
	var metas = document.getElementsByTagName("META");
	for ( var i = 0; i < metas.length; i++) {
		if (metas[i].httpEquiv == "library") {
			var libraries = metas[i].content.split(",");
			for ( var i = 0; i < libraries.length; i++) {
				if (libraries[i] != "kernel") {
					EasyuiZX.importLib(libraries[i]);
				}
			}
			break;
		}
	}
})();

function getWebPath() {
    return "/";
    /*var strFullPath = window.document.location.href;
    var strPath = window.document.location.pathname;
    var pos = strFullPath.indexOf(strPath);
    var prePath = strFullPath.substring(0, pos);
    var postPath = strPath.substring(0, strPath.substr(1).indexOf('/') + 2);
    return (prePath + postPath);*/
}