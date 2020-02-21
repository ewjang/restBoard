package com.jew.comm.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mysql.jdbc.StringUtils;

public class LoginInterceptor extends HandlerInterceptorAdapter implements SessionKeys {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session=request.getSession();
		if(session.getAttribute(LOGIN)!=null) {
			//로그인 객체가 있으면 삭제
			session.removeAttribute(LOGIN);
		}

		return true;
	}
	
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		HttpSession session=request.getSession();
		
		Object member=modelAndView.getModelMap().get("member");
		if(member!=null) {
			session.setAttribute(LOGIN , member);
			System.out.println("로그인 성공했다!!!");
			
			if(StringUtils.isNullOrEmpty(request.getParameter("useCookie"))) {
				
			}else {
				Cookie loginCookie=new Cookie(LOGIN_COOKIE, session.getId());
				loginCookie.setPath("/");
				loginCookie.setMaxAge(7*24*60*60);
				
				response.addCookie(loginCookie);
			}
			//로그인 성공했을 때 시도했던 uri 데이터 가져오기
			String attempted=(String)session.getAttribute(ATTEMPTED);
			if(StringUtils.isNullOrEmpty(attempted)) {
				response.sendRedirect("/board/list");
			}else {
				response.sendRedirect(attempted);
				//시도했던 uri는 한번만 쓸것이기 때문에  세션정보 삭제
				session.removeAttribute(ATTEMPTED);
			}
		}
		
	}
}
