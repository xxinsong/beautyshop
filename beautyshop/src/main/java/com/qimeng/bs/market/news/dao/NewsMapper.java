package com.qimeng.bs.market.news.dao;

import com.qimeng.bs.market.news.bean.News;
import com.qimeng.common.Page;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NewsMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table news
     *
     * @mbggenerated Sat Mar 15 16:47:34 CST 2014
     */
    int deleteByPrimaryKey(Integer newsId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table news
     *
     * @mbggenerated Sat Mar 15 16:47:34 CST 2014
     */
    int insert(News record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table news
     *
     * @mbggenerated Sat Mar 15 16:47:34 CST 2014
     */
    int insertSelective(News record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table news
     *
     * @mbggenerated Sat Mar 15 16:47:34 CST 2014
     */
    News selectByPrimaryKey(Integer newsId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table news
     *
     * @mbggenerated Sat Mar 15 16:47:34 CST 2014
     */
    int updateByPrimaryKeySelective(News record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table news
     *
     * @mbggenerated Sat Mar 15 16:47:34 CST 2014
     */
    int updateByPrimaryKey(News record);

    List<News> queryNewsListByKind(Page<News> page);
}