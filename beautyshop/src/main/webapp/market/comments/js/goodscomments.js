var commentsList;
var goodsId = commonJs.getUrlParam("id");
$(function () {
    $("#img_verf_code").on('click',function(event){
        refreshCode();
    });

    $("[name='star']").on('click',function(event){
        var currStar = event.target;
        $("#score").val($(currStar).attr('value'));
        $(currStar).attr('class','star_curr');
        var preSiblings = $(currStar).prevAll();
        var nextSiblings = $(currStar).nextAll();
        for (var i=0;i<preSiblings.length;i++){
            $(preSiblings[i]).attr('class','star_curr');
        }
        for (var i=0;i<nextSiblings.length;i++){
            $(nextSiblings[i]).attr('class','star_gray');
        }
    });

    $("#all_comments").on('click',function(event){
        switchCommentTab(event);
        queryAllComments(goodsId);
    });
    $("#like_comments").on('click',function(event){
        switchCommentTab(event);
        queryLikeComments(goodsId);
    });
    $("#dislike_comments").on('click',function(event){
        switchCommentTab(event);
        queryDislikeComments(goodsId);
    });

    $("#advantage").on('blur',function(event){
        var $elmt = $(event.target);
        filterWord($elmt.val(),$elmt);
    });

    $("#disadvantage").on('blur',function(event){
        var $elmt = $(event.target);
        filterWord($elmt.val(),$elmt);
    });

    $("#comment").on('blur',function(event){
        var $elmt = $(event.target);
        filterWord($elmt.val(),$elmt);
    });

    $("#verification_code").on('blur',function(event){
        validateVerfCode();
    });

    $("#btn_submit").on('click',function(){
        submitComment();
    });

    commentsList = new QryPager({
        $tpl_scope:$("#comments_list"),
        $tpl_ele:$("#comment_tpl"),
        $pager:$("#comments_page"),
        service:"DmGoodsCommentsController",
        method:"queryCustComments",
        pageIndex:1,
        pageSize:10,
        record_event:function(data,context){commentRender(data,context)},
        afterLoadData : function(data) {
            if(allowComment && allowComment=="T"){
                $("#orderDetailNo").val(commonJs.getUrlParam("cmt"));
                $("#goods_commment").click();
                $("#comment_box").show();
                $("#comment").focus();
            }else{
                $("#comment_box").hide()
            }
        }
    });

    queryGoodsEvaluation(goodsId);
    queryAllComments(goodsId);


})

function queryGoodsEvaluation(goodsId){
    var callback = function(reply){
        var result = reply.getResult();
        if(result){
            var total = result.totalCount;
            var likeCount = result.likeCount;
            var favCount = result.favouriteCount;
            var dislikeCount = result.dislikeCount;
            var avgScore = result.avgScore;
            $("#favour_pct").text(Math.round((favCount/total)*100));
            var likePct = Math.round((likeCount / total) * 100) + '%';
            $("#like_pct").text(likePct);
//            $("#like_pct_bar").attr('w',likePct);
            $("span",$("#like_pct_bar")).attr('style','width:'+likePct);
            var dislikePct = Math.round((dislikeCount / total) * 100) + '%';
            $("#dislike_pct").text(dislikePct);
//            $("#dislike_pct_bar").attr('w',dislikePct);
            $("span",$("#dislike_pct_bar")).attr('style','width:'+dislikePct);
            $("#all_comments").text('全部评价('+total+')');
            $("#like_comments").text('喜欢('+likeCount+')');
            $("#dislike_comments").text('不喜欢('+dislikeCount+')');
            $("#avg_score").html("");
            for(var i=1;i<=avgScore;i++){
                $("<em class='star_b_curr'>").appendTo($("#avg_score"));
            }
        }
    };

    Ajax.getAsy().remoteCall("DmGoodsCommentsController", "queryGoodsEvaluation", [ goodsId], callback);
}

function commentRender(data,context){
    $("[name='merchant_name']",context).text(data.merchantName);
    $("[name='merchant_head']",context).attr("src", (data.headImage!=''&&data.headImage!=null)?commonJs.getWebPath()+data.headImage:commonJs.getWebPath()+'/market/main/images/user_defoult.jpg');
    var $score = $("[name='l_score']", context);
    for(var i=1;i<=data.score;i++){
        $("<em class='star_curr'>").appendTo($score);
    }
    $("[name='l_comment']",context).text(data.custComment);
    $("[name='l_advantage']",context).text(data.advantage);
    $("[name='l_disadvantage']",context).text(data.disadvantage);
    $("[name='l_create_time']",context).text($.format.date(data.createTime,'yyyy-MM-dd HH:mm:ss'));
}

function queryAllComments(goodsId){

    var params = {'goodsId':goodsId,'type':'ALL'};
    commentsList.loadData(params);
}

function queryLikeComments(goodsId){
    var params = {'goodsId':goodsId,'type':'LIKE'};
    commentsList.loadData(params);
}

function queryDislikeComments(goodsId){
    var params = {'goodsId':goodsId,'type':'DISLIKE'};
    commentsList.loadData(params);
}

function submitComment(){
    var params = commonJs.getData($("#form_comment"));
    if(commonJs.validate($("#form_comment"))){
        params.goodsId = goodsId;
        Ajax.getAsy().remoteCall("SensitiveWordFilterController", "filterContent", [params.comment], function(reply){
            if(reply.getResult()){
                var callback = function(reply2){
                    if(reply2.getResult()){
                        queryGoodsEvaluation(goodsId);
                        queryAllComments(goodsId);
                        initCommentForm();
                        refreshCode();
                        $("#comment_box").hide();
                    }else{
                        alert("评论失败！");
                    }
                };
                Ajax.getAsy().remoteCall("DmGoodsCommentsController", "addCustComment", [ params], callback);
            }else{
                $("#comment_hint").html('');
                $("#comment_hint").append("<i class='wrongico'></i>评论内容含有敏感词汇，请重新编辑！！");
            }
        });
    }
}

function filterWord(sentence,elmt){
    if(sentence && sentence.trim()!=''){
        Ajax.getAsy().remoteCall("SensitiveWordFilterController", "filterContent", [sentence], function(reply){
            if(!reply.getResult()){
                $("#comment_hint").html('');
                $("#comment_hint").append("<i class='wrongico'></i>评论内容含有敏感词汇，请重新编辑！！");
            }else{
                $("#comment_hint").html('');
            }
        });
    }
}

function validateVerfCode(){
    var verfCode = $("#verification_code").val();
    if(verfCode.trim()==''){
        return false;
    }
    Ajax.getAsy().remoteCall("VerificationCodeController", "verifyCode", [verfCode], function(reply){
        if(!reply.getResult()){
            $("#verification_code").val('');
            refreshCode();
            return false;
        }else{
            return true;
        }
    });
}

function switchCommentTab(event) {
    $(".pro_pinglun_tab .cur").removeClass();
    $(event.target).parent().addClass("cur");
}

function refreshCode(){
    var src = $("#img_verf_code").attr('src');
    $("#img_verf_code").attr('src',src);
}

function initCommentForm(){
    commonJs.clear($("#form_comment"));
    $("#score").val("5");
    $("[name='star']").attr('class','star_curr');
}