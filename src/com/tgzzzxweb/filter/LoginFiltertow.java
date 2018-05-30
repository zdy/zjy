package com.tgzzzxweb.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.*;

public class LoginFiltertow implements Filter {
	private String noUri;

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		String requestUrl = req.getRequestURI();
        HttpSession session = req.getSession();
        String admin = (String) session.getAttribute("admin");
        System.out.println(admin);
		System.out.println(requestUrl);
		String[] urls = noUri.split(";");
		if (noUri != null && noUri.length() > 0) {
			for (String url : urls) {
				if (requestUrl.indexOf(url) != -1) {// url都等于-1就是不包含 继续遍历
					chain.doFilter(request, response);
					return;
				} else {// !=-1放行
                    continue;
				}
			}
		}
		if (admin == null) {
			System.out.println("经过过滤不小心到的地方");
			res.sendRedirect("/index.jsp");
		} else {
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
		noUri = fConfig.getInitParameter("noFilterUri");
		//System.out.println("noUrl" + noUri);
	}

}
