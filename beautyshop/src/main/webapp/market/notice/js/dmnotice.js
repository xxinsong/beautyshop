var noticeId;
$(function() {
	noticeId = commonJs.getUrlParam("id");	
	queryNotice();
})

function queryNotice() {
	Ajax.getAsy().remoteCall("DmNoticeController", "queryNoticeById",[ noticeId ], function(reply) {
		var notices = reply.getResult();
		if(notices) {
			$("#notice_title").html(notices.noticeTitle);
			var title_time = $.format.date(notices.publishTime, 'yyyy-MM-dd hh:mm:ss');
			$("#title_time").append(title_time);
			$("#nt_dest").html(notices.noticeDest+":");
			$("#nt_context").append(notices.noticeContext);
			$("#nt_publisher").html(notices.publisher);
			var publishtime = $.format.date(notices.publishTime, 'yyyy年MM月dd日');
			$("#nt_publishtime").html(publishtime);			
		}
	});
}

