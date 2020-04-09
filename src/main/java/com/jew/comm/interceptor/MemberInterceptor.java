package com.jew.comm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.jew.controller.LoginController;

public class MemberInterceptor extends HandlerInterceptorAdapter implements SessionKeys{
	
	private static final Logger logger=LoggerFactory.getLogger(LoginController.class);
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		logger.info("회원 삭제 후 로그인 객체도 삭제 인터셉터 작동 확인 . . . ");
		
		//회원가입 삭제 후 로그인 객체 삭제.
		HttpSession session=request.getSession();
		if(session.getAttribute(LOGIN)!=null) {
			//로그인 객체가 있으면 삭제
			session.removeAttribute(LOGIN);
		}
		
	}
	
}
