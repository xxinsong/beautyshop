package com.qimeng.bs.market.help;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * User: Simon
 * Date: 14-2-12
 */
@Controller
@RequestMapping("/help")
public class HelpController {
    @RequestMapping("invoice")
    public String invoicePage(HttpServletRequest request){
        return "/market/help/invoice.jsp";
    }

    @RequestMapping("problems")
    public String problemsPage(HttpServletRequest request){
        return "/market/help/problems.jsp";
    }

    @RequestMapping("consuOrcomp")
    public String consuOrcompPage(HttpServletRequest request){
        return "/market/help/consuOrcomp.jsp";
    }

    @RequestMapping("about")
    public String aboutPage(HttpServletRequest request){
        return "/market/help/about.jsp";
    }

    @RequestMapping("contact")
    public String contactPage(HttpServletRequest request){
        return "/market/help/contact.jsp";
    }

    @RequestMapping("talente")
    public String talentePage(HttpServletRequest request){
        return "/market/help/talente.jsp";
    }

    @RequestMapping("links")
    public String linksPage(HttpServletRequest request){
        return "/market/help/links.jsp";
    }


    @RequestMapping("legalNotices")
    public String legalNoticesPage(HttpServletRequest request){
        return "/market/help/legalNotices.jsp";
    }
}
