package com.qimeng.common.interceptor;

import com.qimeng.common.Constants;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.util.Map;
import java.util.Set;

/**
 * User: Simon
 * Date: 13-12-26
 */
public class LoginAnnotationInterceptor implements HandlerInterceptor {
    private final String DEFAULT_URL = "/login";

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        if (session.getAttribute(Constants.LOGIN_INFO) == null) {
//            String returnUrl = URLEncoder.encode(request.getRequestURL().toString());
            Map params = request.getParameterMap();
            StringBuilder returnUrl = new StringBuilder(request.getRequestURL().toString());

            if(!params.isEmpty()){
                returnUrl.append("?");
            }

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
            }
            response.sendRedirect(request.getContextPath() + DEFAULT_URL+"?returnUrl="+URLEncoder.encode(returnUrl.toString()));
            return false;
        } else {
            request.setAttribute("showLogin", false);
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse httpServletResponse, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse httpServletResponse, Object handler, Exception e) throws Exception {

    }
}
