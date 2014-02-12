package com.qimeng.bs.market.user.controller;

import com.qimeng.bs.common.controller.GenericController;
import com.qimeng.bs.login.bean.LoginInfo;
import com.qimeng.bs.market.user.bean.DmAddress;
import com.qimeng.bs.market.user.service.DmAddressService;
import com.qimeng.common.Page;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.jboss.resteasy.annotations.Form;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.HashMap;
import java.util.Map;

/**
 * User: Simon
 * Date: 14-1-15
 */
@RemoteProxy
@Controller
@Path("/setting")
public class DmAddressController extends GenericController {

    @Autowired
    private DmAddressService dmAddressService;

    @RemoteMethod
    public Page<DmAddress> selectAddressList(Map params,int pageIndex, int pageSize){
        LoginInfo currUser = getCurrentLoginUser();
        if(currUser!=null) {
            params.put("merchantId",currUser.getMerchantId());
            return dmAddressService.selectAddressList(params,pageIndex,pageSize);
        }
        return null;
    }


    @Path("address/{id}")
    @GET
    @Produces({MediaType.APPLICATION_JSON})
    public DmAddress getAddressById(@PathParam("id") Integer id) {
        DmAddress address = dmAddressService.selectAddressById(id);
        return address;
    }

    @Path("address/default:{id}")
    @PUT
    @Produces({MediaType.APPLICATION_JSON})
    public String setDefaultAddress(@PathParam("id") Integer id) {
        LoginInfo currUser = getCurrentLoginUser();
        if(currUser!=null) {
            Map params = new HashMap();
            params.put("merchantId",currUser.getMerchantId());
            params.put("id", id);
            dmAddressService.setDefaultAddress(params);
        }
        return String.valueOf(true);
    }

    @Path("address/{id}:{isDefault}")
    @DELETE
    @Produces({MediaType.APPLICATION_JSON})
    public String deleteAddress(@PathParam("id") Integer id,@PathParam("isDefault") Integer isDefault){
        LoginInfo currUser = getCurrentLoginUser();
        if(currUser!=null) {
            dmAddressService.deleteAddress(currUser.getMerchantId(),id,isDefault);
        }
        return String.valueOf(true);
    }

    @Path("address/add")
    @POST
    @Produces({MediaType.APPLICATION_JSON})
    public String addAddress(@Form DmAddress address) {
        if(address!=null){
            LoginInfo currUser = getCurrentLoginUser();
            address.setMerchantId(currUser.getMerchantId());
            address.setIsDefault("0");
            dmAddressService.saveAddress(address);
        }
        return String.valueOf(true);
    }
    @Path("address/edit/{id}")
    @POST
    @Produces({MediaType.APPLICATION_JSON})
    public String editAddress(@PathParam("id") Integer id,@Form DmAddress address) {
        if(address!=null){
            LoginInfo currUser = getCurrentLoginUser();
            address.setId(id);
            address.setMerchantId(currUser.getMerchantId());
            dmAddressService.saveAddress(address);
        }
        return String.valueOf(true);
    }



    @RequestMapping("/setting/address")
    public ModelAndView myaddressPage(){
        return new ModelAndView("/market/user/myaddress.jsp");
    }
}
