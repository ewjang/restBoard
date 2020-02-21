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
		
	
	
	//삭제 해야함....
	@RequestMapping(value="/login/access")
	public String userAccess(Member member, Model model) throws Exception{
		
		logger.info("userAccess");
		
		//view에서 넘어온 값 저장
		String accessId=member.getUserId();
		String accessPw=member.getUserPw();
		
		
		if(accessId == null || accessPw == null) {
			return "login";
		}
		
		//DB조회 서비스 생성 넘어온 값과 매칭 시킴..
		Member mem = service.match(accessId);

		String chkId=mem.getUserId();
		String chkPw=mem.getUserPw();
		String chkNm=mem.getUserName();
		
		if((accessId.equals(chkId)) && (accessPw.equals(chkPw))) {
			System.out.println(chkNm+"님이 로그인 했습니다.");
			return "redirect:/board/list";
		}else {
			System.out.println("아이디/패스워드가 정확하지 않습니다. 로그인 실패하였습니다.");
			return "login";
		}	
	}
	
	@RequestMapping(value="/loginPost", method=RequestMethod.POST)
	public void loginPost(LoginDto dto, Model model) throws Exception{
		
		logger.info("loginPost",dto);
		
		try {
			Member mem=service.login(dto);
			if(mem != null) { //login 성공
				model.addAttribute("member", mem);
				model.addAttribute("loginResult","Login Success!!");
			}else {
				model.addAttribute("loginResult","Login fail!!");
			}
		} catch(Exception e){
			e.printStackTrace();
		}
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
