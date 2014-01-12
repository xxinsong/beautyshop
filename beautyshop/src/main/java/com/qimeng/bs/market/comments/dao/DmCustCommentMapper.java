package com.qimeng.bs.market.comments.dao;

import com.qimeng.common.Page;
import com.qimeng.bs.market.comments.bean.DmCustComment;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface DmCustCommentMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_cust_comment
     *
     * @mbggenerated Mon Dec 16 09:55:59 CST 2013
     */
    int deleteByPrimaryKey(Integer commentId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_cust_comment
     *
     * @mbggenerated Mon Dec 16 09:55:59 CST 2013
     */
    int insert(DmCustComment record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_cust_comment
     *
     * @mbggenerated Mon Dec 16 09:55:59 CST 2013
     */
    int insertSelective(DmCustComment record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_cust_comment
     *
     * @mbggenerated Mon Dec 16 09:55:59 CST 2013
     */
    DmCustComment selectByPrimaryKey(Integer commentId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_cust_comment
     *
     * @mbggenerated Mon Dec 16 09:55:59 CST 2013
     */
    int updateByPrimaryKeySelective(DmCustComment record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_cust_comment
     *
     * @mbggenerated Mon Dec 16 09:55:59 CST 2013
     */
    int updateByPrimaryKey(DmCustComment record);

    List<DmCustComment> queryCustCommentsByGoodsId(Page page);

    Map selectSummaryByGoodsId(Integer goodsId);
}