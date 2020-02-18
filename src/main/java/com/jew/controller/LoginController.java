package com.jew.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jew.domain.Member;
import com.jew.service.LoginService;

@Controller
public class LoginController {
	
	@Autowired
	LoginService service;
		
	@RequestMapping(value="/login/access")
	public String userAccess(Member member) throws Exception{
		
		System.out.println(member.getUserId());
		System.out.println(member.getUserPw());
		
		//view에서 넘어온 값 저장
		String accessId=member.getUserId();
		String accessPw=member.getUserPw();
		//DB조회 서비스 생성 넘어온 값과 매칭 시킴..
		
		if(accessId == null || accessPw == null) {
			return "login";
		}
		
		service.match(member);
		
		//비교
		if((accessId == member.getUserId()) && (accessPw == member.getUserPw())) {
			System.out.println("로그인 했습니다.");
			return "boardList";
		}else {
			System.out.println("아이디/패스워드가 정확하지 않습니다. 로그인 실패하였습니다.");
			return "login";
		}
		
		
	}
	
}
