package com.qimeng.bs.market.goods.controller;

import com.qimeng.bs.admin.goods.bean.DmGoods;
import com.qimeng.common.Page;
import com.qimeng.bs.common.controller.GenericController;
import com.qimeng.bs.login.bean.LoginInfo;
import com.qimeng.bs.market.goods.service.GoodsService;
import com.qimeng.bs.market.order.service.DmCustOrderService;
import org.apache.commons.lang3.StringUtils;
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
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Controller
@RemoteProxy
@Path("/rs/goods")
@SuppressWarnings("unchecked")
public class GoodsController extends GenericController{

	@Autowired
	private GoodsService goodsService;
    @Autowired
    private DmCustOrderService dmCustOrderService;

	public List<Map> searchGoodsByCatalogId(String catalog_id) {
		return goodsService.searchGoodsByCatalogId(catalog_id);
	}

	public List<Map> searchGoodsTags(Map params) {
		return goodsService.searchGoodsTags(params);
	}

	public Page searchGoodsPage(Map params, int pageIndex, int pageSize) {
		return goodsService.searchGoodsPage(params, pageIndex, pageSize);
	}
	
	/**
	 * 热销商品
	 * @param num 返回多少条记录
	 */
	public List<Map> searchHotGoods(int num) {
		return goodsService.searchHotGoods(num);
	}

    /**
     * 广告产品
     * @param params
     * @return
     */
    public List<Map> searchAdGoods(Map params){
	/*   Integer num = Integer.valueOf(sqlParams.get("num").toString());
	    String adLevel = (String)sqlParams.get("adLevel");*/
        List<Map> ret = goodsService.searchAdGoods(params);
        return ret;
    }

    @RequestMapping("/product")
    public String goodsInfoPage(HttpServletRequest request){
        String subOrderId = request.getParameter("cmt");
        if(StringUtils.isNotEmpty(subOrderId)&&StringUtils.isNumeric(subOrderId)){
            LoginInfo currUser = getCurrentLoginUser();
            if(currUser==null){
                Map params = request.getParameterMap();
                StringBuilder returnUrl = new StringBuilder(request.getRequestURL().toString()).append("?");
                int i=0;
                for(Map.Entry entry : (Set<Map.Entry>)(params.entrySet())){
                    String key = (String) entry.getKey();
                    String[] value = (String[]) entry.getValue();
                    if(i++>0){
                        returnUrl.append("&");
                    }
                    returnUrl.append(key)
                        .append("=")
                        .append(value[0]);
//                        .append("&");
                }
                return "redirect:/login?returnUrl="+URLEncoder.encode(returnUrl.toString());
            }
            boolean allowComment = dmCustOrderService.allowComment(currUser.getMerchantId(), subOrderId);
            if(allowComment){
                request.setAttribute("allowComment","T");
            }else{
                request.setAttribute("allowComment","F");
            }
        }
        return "/market/goods/productInfo.jsp";
    }

    @RequestMapping("/search")
    public ModelAndView searchPage(HttpServletRequest request) throws UnsupportedEncodingException {
        String  wq= request.getParameter("wq");
        if(!org.springframework.util.StringUtils.isEmpty(wq)){
            request.setAttribute("wq", URLDecoder.decode(wq, "utf-8"));
        }
        return new ModelAndView("/market/goods/search_product.jsp");
    }

    @GET
    @Produces({MediaType.APPLICATION_JSON})
    @Path("list")
    public List<DmGoods> getGoodsList(){
        List<DmGoods> goodsList = goodsService.getAllGoodsList();
        return goodsList;
    }

    @GET
    @Produces({MediaType.APPLICATION_JSON})
    @Path("{goodsId}")
    public Map getGoodsById(@PathParam("goodsId") Integer goodsId){
        Map goods = goodsService.getGoodsById(goodsId);
        return goods;
    }

}
