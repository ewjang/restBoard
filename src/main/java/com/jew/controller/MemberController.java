package com.jew.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jew.domain.Book;
import com.jew.domain.Member;
import com.jew.mapper.MemberMapper;
import com.jew.service.MemberService;


@Controller
public class MemberController {
	
	private static final Logger logger=LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService service;
	
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
		
		service.register(member);
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
	@RequestMapping(value="/member/update/{userId}" , method=RequestMethod.GET)
	public ModelAndView updMember(@PathVariable("userId") String userId ) throws Exception{
		
		logger.info("Member update page...");
		
		logger.info("userId는 ? : "+userId);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("memberUpdate");
		mav.addObject("update", service.memberDetail(userId));
		
		return mav;
	}

	@RequestMapping(value="/member/update", method = RequestMethod.POST)
	public String update(Member member) throws Exception {
		
		logger.info("Member update . . . ");

		service.update(member);
		
		return "home";
	}
	
	///???수정필요
	@RequestMapping(value="/member/book", method = RequestMethod.POST)
	public String register(Book book) throws Exception {
		
		System.out.println("book ");

		
		return "login";
	}
		
}
