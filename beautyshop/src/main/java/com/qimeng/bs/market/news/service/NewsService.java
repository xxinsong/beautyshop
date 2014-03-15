package com.qimeng.bs.market.news.service;

import com.qimeng.bs.market.news.bean.News;
import com.qimeng.bs.market.news.dao.NewsMapper;
import com.qimeng.common.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * User: Simon
 * Date: 14-3-15
 */
@Service
public class NewsService {
    @Autowired
    private NewsMapper newsMapper;

    public Page<News> queryNewsListByKind(Page<News> page) {
        List<News> news = newsMapper.queryNewsListByKind(page);
        page.setRows(news);
        return page;
    }

    public News queryNewsById(Integer id) {
        return newsMapper.selectByPrimaryKey(id);
    }

    public void insertNews(News news) {
        newsMapper.insert(news);
    }

    public void updateNews(News news) {
        newsMapper.updateByPrimaryKeySelective(news);
    }

    public void delteNews(News news) {
        newsMapper.deleteByPrimaryKey(news.getNewsId());
    }
}
