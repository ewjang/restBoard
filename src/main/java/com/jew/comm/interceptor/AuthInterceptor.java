package com.jew.comm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mysql.jdbc.StringUtils;

public class AuthInterceptor extends HandlerInterceptorAdapter implements SessionKeys {

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session=request.getSession();
		if(session.getAttribute(LOGIN)==null) {
			String uri=request.getRequestURI();
			String query=request.getQueryString();
			if(StringUtils.isNullOrEmpty(query)) {
				
			}else {
				uri+="?"+query;
			}
			
			session.setAttribute("ATTEMPTED", uri);
			response.sendRedirect("/loginPageGo");
		}

		return true;
	}
}

