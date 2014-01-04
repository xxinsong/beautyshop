function ButtonTools() {
	this.currentAction = "";
	this.btnType = {
		"surePre" : "sure",//确定按钮
		"deletePre" : "delete",//删除
		"addPre" : "add",//添加
		"cancelPre" : "cancel",//取消
		"updatePre" : "update"//更新
	};
}

$.extend(ButtonTools.prototype, {
	isSureBtn : function(btn) {
		var ret = false;
		if (btn.id)
			ret = btn.id.indexOf(this.btnType.surePre) == 0;
		return ret;
	},
	isDeleteBtn : function(btn) {
		var ret = false;
		if (btn.id)
			ret = btn.id.indexOf(this.btnType.deletePre) == 0;
		return ret;
	},
	isUpdateBtn : function(btn) {
		var ret = false;
		if (btn.id)
			ret = btn.id.indexOf(this.btnType.updatePre) == 0;
		return ret;
	},
	isCancelBtn : function(btn) {
		var ret = false;
		if (btn.id)
			ret = btn.id.indexOf(this.btnType.cancelPre) == 0;
		return ret;
	},
	isAddBtn : function(btn) {
		var ret = false;
		if (btn.id)
			ret = btn.id.indexOf(this.btnType.addPre) == 0;
		return ret;
	},
	statusReflesh : function(btn) {
		//        	$(btn).siblings().attr("disabled",false);
		if (this.isSureBtn(btn)) {
			//点击确定，确定与取消按钮diable
			$(btn).parent().find('a[id^=' + this.btnType.surePre + '],' + 'a[id^=' + this.btnType.cancelPre + ']').attr("disabled", true);
		} else if (this.isAddBtn(btn)) {
			//点击添加，更新与删除按钮diable
			$(btn).parent().find('a[id^=' + this.btnType.updatePre + '],' + 'a[id^=' + this.btnType.deletePre + ']').attr("disabled", true);
		} else if (this.isUpdateBtn(btn)) {
			//点击更新，添加与删除按钮diable
			$(btn).parent().find('a[id^=' + this.btnType.addPre + '],' + 'a[id^=' + this.btnType.deletePre + ']').attr("disabled", true);
		} else if (this.isDeleteBtn(btn)) {
			//点击删除，确定与取消按钮disable
			$(btn).parent().find('a[id^=' + this.btnType.surePre + '],' + 'a[id^=' + this.btnType.cancelPre + ']').attr("disabled", true);
		} else if (this.isCancelBtn(btn)) {
			//点击取消，确定与曲线按钮disable
			$(btn).parent().find('a[id^=' + this.btnType.surePre + '],' + 'a[id^=' + this.btnType.cancelPre + ']').attr("disabled", true);
		}
	},
	setCurrentAction : function(action) {
		this.currentAction = action;
	},

	/***************************************************************************
	 html template
	<div class="btns">
		<a id="add"  action="addAction" href="javascript: void(0);"  class="resetbtn"  >增加</a>
		<a id="update" action="updateAction" href="javascript: void(0);" class="resetbtn"  >修改</a>
		<a id="delete" action="deleteAction" href="javascript: void(0);" class="resetbtn"   >删除</a>
		<a id="sure"  action="sure" href="javascript: void(0);" class="resetbtn"   >确定</a>
		<a id="cancel"  action=""  href="javascript: void(0);" class="resetbtn"   >取消</a>
	    <..../a>
	</div>
	argus:btn
	1：在按钮点击事件进行操作判断，传入按钮对象参数
	2：在非按钮点击时，不用传入参数，进行操作判断
	3：按钮触发点击与后台交互完成后要设置currentAction为空
	 ******************************************************************************/
	confirmAction : function(btn) {
		//如果是非按钮操作，且当前动作不是空""则返回false
		if (!btn) {
			if (this.currentAction) {
				messager.alert("提示", "当前数据状态不可操作！请先取消当前操作或对当前操作进行确定保存");
				return false;
			} else {
				return true;
			}
		}
		var myAction = $(btn).attr("action");
		if (this.isCancelBtn(btn)) {//如果点击取消按钮，直接设置当前状态为取消状态
			this.setCurrentAction(myAction);
			return true;
		} else {
			if (this.currentAction) {//处于非取消状态

				if (this.isSureBtn(btn)) {
					return true;//允许确定
				} else {
					messager.alert("提示", "当前数据状态不可操作！请先取消当前操作或对当前操作进行确定保存");
					return false;//不同操作，不允许操作
				}
			} else {
				if (this.isSureBtn(btn)) {//直接点击确定没意思
					messager.alert("提示", "请先选择操作");
					return false;
				} else {//当前处于取消状态，且当前按钮是非确定按钮
					if (!this.isDeleteBtn(btn)) {
						this.setCurrentAction(myAction);
					}
					return true;
				}
			}
		}
	}
});
