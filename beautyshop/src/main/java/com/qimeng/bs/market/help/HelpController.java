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

    @RequestMapping("alliance")
    public String alliancePage(HttpServletRequest request){
        return "/market/help/alliance.jsp";
    }

    @RequestMapping("100pct")
    public String hundredpctPage(HttpServletRequest request){
        return "/market/help/ensure.jsp";
    }

    @RequestMapping("30days")
    public String thirtydaysPage(HttpServletRequest request){
        return "/market/help/30days.jsp";
    }

    @RequestMapping("7x24")
    public String fulldayPage(HttpServletRequest request){
        return "/market/help/7x24.jsp";
    }

    @RequestMapping("guide")
    public String guidePage(HttpServletRequest request){
        return "/market/help/guide.jsp";
    }

    @RequestMapping("problems")
    public String problemsPage(HttpServletRequest request){
        return "/market/help/problems.jsp";
    }


    @RequestMapping("/helpcenter")
    public String helpcenterpage(HttpServletRequest request) {
        return "/market/help/helpcenter.jsp";
    }

    @RequestMapping("/agreement")
    public String agreementPage(HttpServletRequest request) {
        return "/market/help/agreement.jsp";
    }

    @RequestMapping("/cod")
    public String codPage(HttpServletRequest request) {
        return "/market/help/cod.jsp";
    }

    @RequestMapping("/payonline")
    public String payonlinePage(HttpServletRequest request) {
        return "/market/help/payonline.jsp";
    }

    @RequestMapping("/balance")
    public String balancePage(HttpServletRequest request) {
        return "/market/help/balance.jsp";
    }

    @RequestMapping("/cash")
    public String cashPage(HttpServletRequest request) {
        return "/market/help/cash.jsp";
    }

    @RequestMapping("/post")
    public String postPage(HttpServletRequest request) {
        return "/market/help/post.jsp";
    }

    @RequestMapping("/delivery")
    public String deliveryPage(HttpServletRequest request) {
        return "/market/help/delivery.jsp";
    }

    @RequestMapping("/transfee")
    public String transfeePage(HttpServletRequest request) {
        return "/market/help/transfee.jsp";
    }

    @RequestMapping("/sign")
    public String signPage(HttpServletRequest request) {
        return "/market/help/sign.jsp";
    }

    @RequestMapping("/promise")
    public String promisePage(HttpServletRequest request) {
        return "/market/help/promise.jsp";
    }

    @RequestMapping("/consult")
    public String consultPage(HttpServletRequest request) {
        return "/market/help/consult.jsp";
    }

    @RequestMapping("/rtnpolicy")
    public String rtnpolicyPage(HttpServletRequest request) {
        return "/market/help/rtnpolicy.jsp";
    }

    @RequestMapping("/return")
    public String returnPage(HttpServletRequest request) {
        return "/market/help/return.jsp";
    }

    @RequestMapping("/aboutcn")
    public String aboutcnPage(HttpServletRequest request) {
        return "/market/help/aboutcn.jsp";
    }
    @RequestMapping("/abouten")
    public String aboutenPage(HttpServletRequest request) {
        return "/market/help/abouten.jsp";
    }

    @RequestMapping("contact")
    public String contactPage(HttpServletRequest request){
        return "/market/help/contact.jsp";
    }

    @RequestMapping("media")
    public String mediaPage(HttpServletRequest request){
        return "/market/help/media.jsp";
    }

    @RequestMapping("brand")
    public String brandPage(HttpServletRequest request){
        return "/market/help/brand.jsp";
    }

    @RequestMapping("privacy")
    public String privacyPage(HttpServletRequest request){
        return "/market/help/privacy.jsp";
    }

    @RequestMapping("links")
    public String linksPage(HttpServletRequest request){
        return "/market/help/links.jsp";
    }

    @RequestMapping("talents")
    public String talentsPage(HttpServletRequest request){
        return "/market/help/talents.jsp";
    }

    @RequestMapping("partner")
    public String partnerPage(HttpServletRequest request){
        return "/market/help/partner.jsp";
    }

}
