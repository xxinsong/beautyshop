package com.qimeng.bs.market.comments.service;

import com.qimeng.common.Page;
import com.qimeng.bs.market.comments.bean.DmCustComment;
import com.qimeng.bs.market.comments.bean.DmGoodsEvaluation;
import com.qimeng.bs.market.comments.dao.DmCustCommentMapper;
import com.qimeng.bs.market.comments.dao.DmGoodsEvaluationMapper;
import com.qimeng.bs.market.order.bean.DmSubCustOrder;
import com.qimeng.bs.market.order.dao.DmSubCustOrderMapper;
import org.apache.commons.collections.MapUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * User: Simon
 * Date: 13-12-16
 */
@Service
public class DmGoodsCommentsService {

    @Autowired
    private DmGoodsEvaluationMapper dmGoodsEvaluationMapper;
    @Autowired
    private DmCustCommentMapper dmCustCommentMapper;
    @Autowired
    private DmSubCustOrderMapper dmSubCustOrderMapper;

    public DmGoodsEvaluation queryGoodsEvaluation(int goodsId){
        return dmGoodsEvaluationMapper.queryEvaluationByGoodsId(goodsId);
    }

    public Page queryCustComments(Map params, int pageIndex, int pageSize) {
        Page page = new Page(pageIndex,pageSize);
        page.setParams(params);
        List<DmCustComment> list = dmCustCommentMapper.queryCustCommentsByGoodsId(page);
        page.setRows(list);
        return page;
    }

    public boolean addCustComment(DmCustComment comment) {
        DmGoodsEvaluation evaluation = queryGoodsEvaluation(comment.getGoodsId());
        if(evaluation==null){
            evaluation = new DmGoodsEvaluation();
            evaluation.setGoodsId(comment.getGoodsId());
            calcEvaluationScore(comment, evaluation);
            dmGoodsEvaluationMapper.insert(evaluation);
        }else{
            calcEvaluationScore(comment, evaluation);
            dmGoodsEvaluationMapper.updateByPrimaryKeySelective(evaluation);
        }
        DmSubCustOrder subCustOrder = new DmSubCustOrder();
        subCustOrder.setSubOrderId(comment.getOrdDetailNo());
        subCustOrder.setCommentated("1");
        dmSubCustOrderMapper.updateByPrimaryKeySelective(subCustOrder);
        return dmCustCommentMapper.insert(comment)>0;
    }

    private void calcEvaluationScore(DmCustComment comment, DmGoodsEvaluation evaluation) {
        int totalCount = evaluation.getTotalCount();
        int likeCount = evaluation.getLikeCount();
        int dislikeCount = evaluation.getDislikeCount();
        int favCount = evaluation.getFavouriteCount();
        Map result = dmCustCommentMapper.selectSummaryByGoodsId(evaluation.getGoodsId());
        int avgScore = 0;
        if(result!=null){
            int total = MapUtils.getInteger(result, "total");
            int cnt = MapUtils.getInteger(result, "cnt");
            avgScore = (total==0||cnt==0)?0:Math.round(total/cnt);
        }

        int score = comment.getScore();

        totalCount ++ ;

        if(score >= 3){
            likeCount ++;
            if(score >=4){
                favCount ++;
            }
        }else{
            dislikeCount ++ ;
        }

        evaluation.setTotalCount(totalCount);
        evaluation.setLikeCount(likeCount);
        evaluation.setFavouriteCount(favCount);
        evaluation.setDislikeCount(dislikeCount);
        evaluation.setAvgScore(avgScore);

    }
}
