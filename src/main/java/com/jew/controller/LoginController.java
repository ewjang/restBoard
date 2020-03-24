package com.jew.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.jew.comm.dto.LoginDto;
import com.jew.comm.interceptor.SessionKeys;
import com.jew.domain.Member;
import com.jew.service.LoginService;

@Controller
public class LoginController {
	
	private static final Logger logger=LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	LoginService service;
			
	@RequestMapping(value="/loginPost", method=RequestMethod.POST)
	public ModelAndView loginPost(LoginDto dto) throws Exception{
		
		logger.info("login 이후 . . . ",dto);
		ModelAndView mav=new ModelAndView();
		try {
			Member mem=service.login(dto);
			mav.setViewName("login");
			if(mem != null) { //login 성공	
				if(mem.getAuthstatus()==1) {
					logger.info("인증 함..");
					mav.addObject("member", mem);	
					mav.addObject("loginResult","Login Success!!");
				}else {
					logger.info("인증 하지 않음.");
					mav.addObject("loginResult", "메일 인증을 하지 않았습니다.");
				}
			}else {
				Member accountchk=service.accountchk(dto);
				if(accountchk!=null) {
					logger.info("계정이 있지만 비밀번호가 틀린 경우..");
					mav.addObject("loginResult", "비밀번호가 틀렸습니다.");
				}else {
					logger.info("계정이 없는 경우..");
					mav.addObject("loginResult","계정이 없습니다. 회원가입을 해주세요.");
				}
			}
		} catch(Exception e){
			e.printStackTrace();
		}
		return mav;
	}
	
	@RequestMapping(value="/logout" , method=RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception{
		logger.info("logout get !!! ");
		session.removeAttribute(SessionKeys.LOGIN);
		session.invalidate();
		
		//로그인 했을 때 브라우저에 저장된 쿠키를 (스프링에서 제공하는 WebUtils에서) 가져와서 삭제..  
		Cookie loginCookie = WebUtils.getCookie(request, SessionKeys.LOGIN);
		if(loginCookie!=null) {
			loginCookie.setPath("/");
			loginCookie.setMaxAge(0);
			
			response.addCookie(loginCookie);
		}
		
		return "home";
	}
	
}
