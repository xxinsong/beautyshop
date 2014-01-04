/**
 * dwrloader - jQuery EasyUI
 * 
 * Licensed under the GPL:
 *   http://www.gnu.org/licenses/gpl.txt
 *
 * Copyright 2012 stworthy [ stworthy@gmail.com ] 
 * 
 */
(function($){
	/**
	 * get default json loader
	 */
	function getJsonLoader(pluginName){
		return function(param, success, error){
			var opts = $(this)[pluginName]('options');
			if (!opts.url) return false;
			$.ajax({
				type: opts.method,
				url: opts.url,
				data: param,
				dataType: 'json',
				success: function(data){
					success(data);
				},
				error: function(){
					error.apply(this, arguments);
				}
			});
		}
	}
	
	/**
	 * get dwr data loader
	 */
	function getDwrLoader(pluginName){
		return function(param, success, error){
			var opts = $(this)[pluginName]('options');
			if (!opts.url) return false;
			
			var callBack = function(reply) {
				var data = reply.getResult();
				data.rows = data.rows || [];
				data.total = data.total || 0;
				opts.onBeforeSuccess && opts.onBeforeSuccess(data);
				success(data);
			}
			var post = opts.url.indexOf(".");
			var serviceName = opts.url.substring(0, post);
			var methodName = opts.url.substring(post + 1, opts.url.length);
			Ajax.getSy().remoteCall(serviceName, methodName, [ param ], callBack);
			
//			var dwrFunc = eval(opts.url);
//			dwrFunc(param, {
//				callback : function(data) {
//					success(data);
//				},
//				exceptionHandler : function() {
//					error.apply(this, arguments);
//				}
//			});
		}
	}
	
	$.fn.combobox.defaults.loader = getDwrLoader('combobox');
	$.fn.tree.defaults.loader = getDwrLoader('tree');
	$.fn.treegrid.defaults.loader = getDwrLoader('treegrid');
	$.fn.datagrid.defaults.loader = getDwrLoader('datagrid');
})(jQuery);
