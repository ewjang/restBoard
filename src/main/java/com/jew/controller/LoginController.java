package com.jew.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jew.domain.Member;
import com.jew.service.LoginService;

@Controller
public class LoginController {
	
	@Autowired
	LoginService service;
		
	@RequestMapping(value="/login/access")
	public String userAccess(Member member, Model model) throws Exception{

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
			return "boardList";
		}else {
			System.out.println("아이디/패스워드가 정확하지 않습니다. 로그인 실패하였습니다.");
			return "login";
		}
		
		
	}
	
}
