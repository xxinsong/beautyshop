package com.qimeng.common.signon;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qimeng.common.Constants;

public class SignOnFilter implements Filter {
	
	private static String signOnErrorPage = "index.jsp";
	private static String signOnPage = "index.jsp";

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest hreq = (HttpServletRequest) request;
		String currentURL = hreq.getRequestURI();
		currentURL = currentURL.replaceAll("//", "/");// 手机客户端URL 双斜杠转单斜杠
		int firstSlash = currentURL.indexOf("/", 1);
		String targetURL = null;
		if (firstSlash != -1) {
			targetURL = currentURL.substring(firstSlash + 1, currentURL.length());
		}

		boolean signedOn = false;
		if (hreq.getSession().getAttribute(Constants.ADMIN_LOGIN_INFO) != null) {
			signedOn = true;
		}
		if (signedOn) {
			chain.doFilter(request, response);
			return;
		} else if (signOnPage.equals(targetURL)) {
			signOnErrorPage = targetURL;
			chain.doFilter(request, response);
			return;
		} else {
			HttpServletResponse hrep = (HttpServletResponse) response;
			hrep.sendRedirect(hreq.getContextPath() + "/" + signOnErrorPage);
			return;
		}
	}

}
