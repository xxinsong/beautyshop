package com.qimeng.bs.market.news.controller;

import com.qimeng.bs.common.controller.GenericController;
import com.qimeng.bs.market.news.bean.News;
import com.qimeng.bs.market.news.service.NewsService;
import com.qimeng.bs.system.staticdata.bean.DcAttrValue;
import com.qimeng.bs.system.staticdata.service.StaticDataService;
import com.qimeng.common.Page;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.util.*;

/**
 * User: Simon
 * Date: 14-3-15
 */
@Controller
@RemoteProxy
@Path("/news")
public class NewsController extends GenericController {

    @Autowired
    private StaticDataService staticDataService;
    @Autowired
    private NewsService newsService;

    @RequestMapping("/news")
    public ModelAndView newsPage(HttpServletRequest request) {
        List<DcAttrValue> newsKind = staticDataService.getStaticData("NEWS_KIND");
        List<Map<String,String>> list = new ArrayList<Map<String,String>>();
        for (DcAttrValue attrValue : newsKind) {
            Map<String, String> map = new HashMap<String, String>();
            map.put("name", attrValue.getAttrValueDesc());
            map.put("value", attrValue.getAttrValue());
            list.add(map);
        }
        request.setAttribute("newsKind",list);
        return new ModelAndView("/market/news/news.jsp");
    }

    @Path("kind")
    @GET
    @Produces({MediaType.APPLICATION_JSON})
    public List queryNewsKind() {
        List<DcAttrValue> newsKind = staticDataService.getStaticData("NEWS_KIND");
        return newsKind;
    }

    @RemoteMethod
    public Page<News> queryNewsListByKind(Map params, int pageIndex, int pageSize) {
        Page<News> page = new Page<News>(pageIndex, pageSize);
        page.setParams(params);
        return newsService.queryNewsListByKind(page);
    }

    @Path("{newsId}")
    @GET
    @Produces({MediaType.APPLICATION_JSON})
    public News queryNewsById(@PathParam("newsId") Integer newsId) {
        News news = newsService.queryNewsById(newsId);
        return news;
    }

    @RemoteMethod
    public Map<String, Object> addAction(News news) {
        Map<String, Object> ret = new HashMap<String, Object>();
        ret.put("success", true);
        ret.put("msg", "添加成功");
        news.setPublisher("管理员");
        news.setPublishTime(new Date());
        newsService.insertNews(news);
        return ret;
    }

    @RemoteMethod
    public Map<String, Object> updateAction(News news) {
        Map<String, Object> ret = new HashMap<String, Object>();
        ret.put("success", true);
        ret.put("msg", "更新成功");
        newsService.updateNews(news);
        return ret;
    }

    @RemoteMethod
    public Map<String, Object> deleteAction(News news) {
        Map<String, Object> ret = new HashMap<String, Object>();
        ret.put("success", true);
        ret.put("msg", "删除成功");
        newsService.delteNews(news);
        return ret;
    }
}
