(function($) {
	var Pager = Base.extend( {
		$tpl_scope : null,
		$tpl_ele : null,
		$pager : null,
		service : "",
		method : "",
		pageIndex : 1,
		pageSize : 10,
		pageCount : 1,
		params : {},
		constructor : function() {
			this.version = "1.0";
		},
		loadData : function(params) {
			this.pageIndex = 1;
			this.loadPage(params);
		},
		loadPage : function(params) {
			if (params) {
				this.params = params;
			}
			var me = this;
			Ajax.getAsy().remoteCall(this.service, this.method, [this.params, this.pageIndex, this.pageSize], function(reply) {
				var data = reply.getResult();
				me.renderTable(data.rows);
				me.renderPage(data);
				me.initEvent();
				me.afterLoadData(data);
			}, function(msg, exc) {
				me.exceptionHandler(msg, exc);
			});
		},
		exceptionHandler : function(msg, exc) {
			Ajax.getAsy().exceptionHandler(msg, exc);
		},
		loading : function() {
			if (!this.zindex) {
				var $parent = this.$table.parent();
				var number = /^\d+$/;
				while ($parent.size() > 0 && ($parent.get(0).tagName.toLowerCase() != 'body')) {
					if (number.test($parent.css("z-index")) && $parent.css("z-index") > 0) {
						this.zindex = $parent.css("z-index");
						break;
					}
					$parent = $parent.parent();
				}
			}
			this.zindex = this.zindex || 100;
			if ($("#pager_loading").size() == 0) {
				$("body").append("<div id='pager_loading' style='background: url(" + path_prefix + "public/v20/ui/images/loading.gif) #ecf5ff no-repeat;width: 80px;height: 80px;position: absolute;top: 45%;left: 45%;z-index: " + (this.zindex + 1) + ";filter:alpha(opacity=80);opacity: 0.8;display: none;'></div>");
			}
			if ($("#pager_loading_overlayer").size() == 0) {
				$("body").append("<div id='pager_loading_overlayer' style='background-color: #333;opacity: 0.18;position: fixed;z-index: " + this.zindex + ";top: 0px;left:0px;width: 100%;height: 100%;filter:alpha(opacity=18);display: none;'></div>");
			}
			$("#pager_loading").show();
			$("#pager_loading_overlayer").show();
		},
		hideLoading : function() {
			$("#pager_loading").hide().remove();
			$("#pager_loading_overlayer").hide().remove();
		},
		renderTable : function(data) {
			this.$tpl_ele.nextAll().remove();
			var html = [];
            if(data){
                for ( var i = 0; i < data.length; i++) {
                    var $clone = this.$tpl_ele.clone();
                    this.$tpl_scope.append($clone);
                    this.record_event(data[i], $clone);
                    $clone.data("data", data[i]);
                    $clone.show();
                }
            }
		},
		record_event : function(data, $jq) {
		},
		translate : function(column, value) {
			return value;
		},
		renderPage : function(data) {
			var me = this;
			var pageIndex = data.pageIndex;
			var pageCount = data.pageCount;
			this.pageCount = data.pageCount;
			
			var html = [];
			if (this.$pager != null) {
				
				html.push("<a href='javascript: void(0);' class='page_prev page_disabled'><i class='page_prev_arrow'></i>上一页</a>");
				html.push("<a href='javascript: void(0);' class='page_next page_disabled'>下一页<i class='page_next_arrow'></i></a>");
				this.$pager.html(html.join(""));
				
				this.$pager.find("a.page_prev").click(function() {
					if (!$(this).hasClass("page_disabled")) {
						me.pageIndex = parseInt(me.$pager.find("a.page_cur").text()) - 1;
						me.loadPage();
					}
				});
				this.$pager.find("a.page_next").click(function() {
					if (!$(this).hasClass("page_disabled")) {
						me.pageIndex = parseInt(me.$pager.find("a.page_cur").text()) + 1;
						me.loadPage();
					}
				});
			}
			
			var $prev = this.$pager.find("a.page_prev");
			var $next = this.$pager.find("a.page_next");
			if (pageIndex != 1) {
				$prev.hasClass("page_disabled") && $prev.removeClass("page_disabled");
			} else {
				!$prev.hasClass("page_disabled") && $prev.addClass("page_disabled");
			}
			if (pageIndex != pageCount) {
				$next.hasClass("page_disabled") && $next.removeClass("page_disabled");
			} else {
				!$next.hasClass("page_disabled") && $next.addClass("page_disabled");
			}
			
			html.splice(0, html.length);		
			if (pageIndex >= 7) {
				for ( var i = 6; i >= 0; i--) {
					if (i == 6) {
						html.push("<a href='javascript: void(0);'>1</a>");
					} else if (i == 5) {
						html.push("<span class='page_break'>...</span>");
					} else {
						html.push("<a href='javascript: void(0);' " + ((pageIndex == (pageIndex - i)) ? "class='page_cur'" : "") + ">" + (pageIndex - i) + "</a>");
					}
				}
			} else {
				for ( var i = 1; i <= pageIndex; i++) {
					html.push("<a href='javascript: void(0);' " + ((pageIndex == i) ? "class='page_cur'" : "") + ">" + i + "</a>");
				}
			}
			if (pageCount - pageIndex >= 6) {
				for ( var i = 1; i <= 6; i++) {
					if ( i == 5) {
						html.push("<span class='page_break'>...</span>");
					} else if (i == 6) {
						html.push("<a href='javascript: void(0);'>" + pageCount+ "</a>");
					} else {
						html.push("<a href='javascript: void(0);'>" + (pageIndex + i) + "</a>");
					}
				}
			} else {
				for ( var i = 1; i <= (pageCount - pageIndex); i++) {
					html.push("<a href='javascript: void(0);'>" + (pageIndex + i) + "</a>");
				}
			}
			
			$prev.after(html.join(""));
		},
		initEvent : function() {
			var me = this;
			var $prev = this.$pager.find("a.page_prev");
			var $next = this.$pager.find("a.page_next");
			$prev.nextUntil("a.page_next").each(function() {
				if(this.tagName == "A") {
					$(this).click(function() {
						me.pageIndex = parseInt($(this).text());
						me.loadPage();
					});
				}
			});	
		},
		onBeforeClickRow : function(data) {
			return true;
		},
		onClickRow : function(data) {
		},
		onDblClickRow : function(data) {
		},
		onClickCell : function(field, value) {
		},
		onDblClickCell : function(field, value) {
		},
		renderColumn : function(field, value, data) {
			return value;
		},
		getSelected : function() {
		},
		getPager : function() {
			return this.$pager;
		},
		insertRow : function(data) {
		},
		deleteRow : function() {
		},
		clear : function() {
		},
		afterLoadData : function(data) {
		}
	});
	
	var QryPager = function(options) {
		return new (Pager.extend(options))();
	}
	window.QryPager = QryPager;
})(jQuery);