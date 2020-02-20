package com.jew.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jew.domain.Book;
import com.jew.domain.Member;
import com.jew.mapper.MemberMapper;
import com.jew.service.MemberService;


@Controller
public class MemberController {
	
	private static final Logger logger=LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService serivce;
	
	private final ApplicationContext applicationContext;
	
	public  MemberController(ApplicationContext applicationContext) {
		this.applicationContext=applicationContext;
	}
	
	@GetMapping("/member/bean")
	@ResponseBody
	public String bean() {
		return "bean: "+applicationContext.getBean(MemberMapper.class);
	}
	
	@RequestMapping(value="/member/regist", method = RequestMethod.POST)
	public String register(Member member) throws Exception {
		
		logger.info("member regist");
		
		System.out.println("userId ");
		
		serivce.register(member);
		/*
		 * 
		 * ModelAndView mv=new ModelAndView(); mv.setViewName("views/exas");
		 * mv.addObject("userId", member.getUserId()); mv.addObject("userName",
		 * member.getUserName()); mv.addObject("userHobby", member.getHobby());
		 * mv.addObject("userBirth", member.getUserBirth()); mv.addObject("userMail",
		 * member.getUserMail()); mv.addObject("userRegDate", member.getRegDate());
		 */
		
		return "login";
	}
	
	@RequestMapping(value="/member/book", method = RequestMethod.POST)
	public String register(Book book) throws Exception {
		
		System.out.println("book ");

		
		return "login";
	}
		
}
