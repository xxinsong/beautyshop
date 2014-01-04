(function() {
	var Pager = Base.extend( {
		$table : null,
		$pager : null,
		fields : [],
		columns : [],
		service : "",
		method : "",
		pageIndex : 1,
		pageSize : 10,
		pageCount : 1,
		params : {},
		constructor : function() {
			this.version = "1.0";
			
			var me = this;

			//列属性
			this.$table.find("tr:first-child > th").each(function() {
				var $jq = $(this);
				var column = {};
				column['title'] = $jq.text();
				$jq.attr("field") && eval("column['field'] = $jq.attr('field')");
				$jq.attr("checkbox") && eval("column['checkbox'] = $jq.attr('checkbox');me.checkbox=true;");
				$jq.attr("attr_code") && eval("column['attr_code'] = $jq.attr('attr_code')");
				me.columns.push(column);
			});
			
			//重新生成头部
			this.renderHeader();
			
			//初始化部分事件
			this.$table.delegate("tr,td", "click", function() {
				if ($(this).has("th").length == 1 || $(this).closest("tr").has("th").length == 1) {
					return;
				}
				if (this.tagName == "TR") {
					if (me.onBeforeClickRow($(this).data("data"))) {
						if (me.checkbox) {
							$("input[type='checkbox']:checked", this).size() > 0 ? $(this).addClass("curr") : $(this).removeClass("curr");
						} else {
							$(this).siblings().removeClass("curr");
							$(this).addClass("curr");
						}
						me.onClickRow($(this).data("data"));
					}
				} else {
					me.onClickCell($(this).data("field"), $(this).data("value"));
				}
			});
			this.$table.delegate("tr,td", "dblclick", function() {
				if ($(this).has("th").length == 1 || $(this).closest("tr").has("th").length == 1) {
					return;
				}
				if (this.tagName == "TR") {
					if (me.onBeforeClickRow($(this).data("data"))) {
						if (me.checkbox) {
							$("input[type='checkbox']:checked", this).size() > 0 ? $(this).addClass("curr") : $(this).removeClass("curr");
						} else {
							$(this).siblings().removeClass("curr");
							$(this).addClass("curr");
						}
						me.onDblClickRow($(this).data("data"));
					}
				} else {
					me.onDblClickCell($(this).data("field"), $(this).data("value"));
				}
			});
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
			me.loading();
			Ajax.getAsy().remoteCall(this.service, this.method, [this.params, this.pageIndex, this.pageSize], function(reply) {
				var data = reply.getResult();
				me.renderTable(data.rows);
				me.renderPage(data);
				me.initEvent();
				me.afterLoadData();
				me.hideLoading();
			}, function(msg, exc) {
				me.hideLoading();
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
		renderHeader : function() {
			var me = this;
			this.$table.html("");
			var html = [];
			html.push("<tr>");
			for ( var i = 0; i < this.columns.length; i++) {
				html.push("<th>");
				if (this.columns[i].checkbox == "true") {
					html.push("<input type='checkbox'></input>");
				} else {
					html.push(this.columns[i].title);
				}
				html.push("</th>");
			}
			html.push("</tr>");
			var $header = $(html.join(""));
			$header.find("input[type='checkbox']").click(function() {
				if (this.checked) {
					me.$table.find("input[type='checkbox']").attr("checked", "true");
					$header.siblings().addClass("curr");
				} else {
					me.$table.find("input[type='checkbox']").removeAttr("checked");
					$header.siblings().removeClass("curr");
				}
			});
			this.$table.append($header);
			
		},
		clearRows : function() {
			this.$table.find("tr:first-child").nextAll().remove();
		},
		renderTable : function(data) {
			this.$table.find("tr:first-child").nextAll().remove();
			var html = [];
			for ( var i = 0; i < data.length; i++) {
				html.push("<tr>");
				for ( var j = 0; j < this.columns.length; j++) {
					html.push("<td>");
					var value = this.translate(this.columns[j], data[i][this.columns[j].field]);
					if (this.columns[j].checkbox == "true") {
						//html.push("<input type='checkbox'></input>");
						html.push(this.renderColumn(this.columns[j].field, "<input type='checkbox'></input>", data[i]));
					} else {
						html.push(this.renderColumn(this.columns[j].field, value, data[i]));
					}
					html.push("</td>");
				}
				html.push("</tr>");
			}
			this.$table.append(html.join(""));
			
			if (this.checkbox) {
				this.$table.find("tr:first-child").nextAll().each(function() {
					if ($("input[type='checkbox']:checked", this).size() > 0) {
						$(this).addClass("curr");
					}
				});
			} else {
				//默认选中第一条记录
				this.$table.find("tr:first-child").next().addClass("curr");
			}
			
			this.bindData(data);
		},
		translate : function(column, value) {
			if (column.attr_code) {
				var attrData = Attr.getAttrData(column.attr_code, false);
				for ( var i = 0; i < attrData.length; i++) {
					if (attrData[i].attrValue == value) {
						return attrData[i].attrValueDesc;
					}
				}
			}
			return value;
		},
		bindData : function(data) {
			var rows = this.$table.find("tr:first-child").nextAll();
			for ( var i = 0; i < rows.length; i++) {
				$(rows[i]).data("data", data[i]);
				var cells = $(rows[i]).find("td");
				for ( var j = 0; j < cells.length; j++) {
					$(cells[j]).data("field", this.columns[j].field);
					$(cells[j]).data("value", data[i][this.columns[j].field]);
				}
			}
		},
		renderPage : function(data) {
			var me = this;
			var pageIndex = data.pageIndex;
			var pageCount = data.pageCount;
			this.pageCount = data.pageCount;
			
			var html = [];
			if (this.$pager == null) {
				html.push("<div style='display: block;' class='pager'>");
				html.push("	   <a href='javascript: void(0);' class='page_prev page_disabled'><i class='page_prev_arrow'></i>上一页</a>");
				html.push("    <a href='javascript: void(0);' class='page_next page_disabled'>下一页<i class='page_next_arrow'></i></a>");
				html.push("    <span class='pageOp go'>跳转至 <input type='text' name='jumpto'></input>页<button name='jumptopage'>GO</button></span>");
				html.push("</div>");
				html.push("<div class='clear'></div>");
				
				var $grid = this.$table.closest("div.grid");
				$grid.after(html.join(""));
				this.$pager = $grid.next();
				
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
				this.$pager.find("button").click(function() {
					var number = /^\d+$/;
					var $jumpto = me.$pager.find("input[name='jumpto']");
					var pi = $.trim($jumpto.val());
					if (!number.test(pi) || parseInt(pi) <= 0 || parseInt(pi) > me.pageCount) {
						showRed($jumpto);
						return;
					}
					me.pageIndex = parseInt(pi);
					me.loadPage();
				});
			}
			
			var $prev = this.$pager.find("a.page_prev");
			var $next = this.$pager.find("a.page_next");
			if (pageIndex != 1) {
				$prev.hasClass("page_disabled") && $prev.removeClass("page_disabled");
			} else {
				!$prev.hasClass("page_disabled") && $prev.addClass("page_disabled");
			}
			if (pageIndex != pageCount && pageCount != 0) {
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
			
			$prev.nextUntil("a.page_next").remove();
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
			if (this.checkbox) {
				var data = [];
				this.$table.find("tr.curr").each(function() {
					data.push($(this).data("data"));
				});
				return data;
			} else {
				return this.$table.find("tr.curr").data("data");
			}
		},
		insertRow : function(data) {
			var html = [];
			html.push("<tr>");
			for ( var i = 0; i < this.columns.length; i++) {
				html.push("<td>");
				var value = this.translate(this.columns[i], data[this.columns[i].field]);
				if (this.columns[i].checkbox == "true") {
					html.push("<input type='checkbox'></input>");
				} else {
					html.push(this.renderColumn(this.columns[i].field, value, data));
				}
				html.push("</td>");
			}
			html.push("</tr>");
			var $row = $(html.join(""));
			this.$table.append($row);
			
			$row.data("data", data);
			var cells = $row.find("td");
			for ( var i = 0; i < cells.length; i++) {
				$(cells[i]).data("field", this.columns[i].field);
				$(cells[i]).data("value", data[this.columns[i].field]);
			}
		},
		deleteRow : function() {
			var data = [];
			this.$table.find("tr.curr").each(function() {
				data.push($(this).data("data"));
				$(this).remove();
			});
			return data;
		},
		afterLoadData : function() {
		}
	});
	
	var TableGrid = function(options) {
		$.extend(options, { columns : [] });
		return new (Pager.extend(options))();
	}
	window.TableGrid = TableGrid;
})(window)