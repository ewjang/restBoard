package com.jew.controller;



import java.util.Date;

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
import com.jew.domain.Member;
import com.jew.mapper.MemberMapper;
import com.jew.service.CalenderService;
import com.jew.service.MemberService;


@Controller
public class MemberController {
	
	private static final Logger logger=LoggerFactory.getLogger(MemberController.class);

	
	@Autowired
	MemberService service;
	
	@Autowired
	CalenderService calenderService;
	
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
		logger.info("Invalid bound statement :"+service.countAll());
		
		if(service.countAll()==0) {
			
			service.setAdmin(member);
			
		}else {

			service.register(member);
		}
		
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

		Date date=calenderService.callDate();
		
		logger.info("Date : "+ date);
		
		
		service.update(member);
		
		return "home";
	}
	
	@RequestMapping(value="/member/delete/{userId}")
	public String delete(@PathVariable("userId") String userId) throws Exception{
		
		logger.info("Member delete . . .");
		logger.info("소스트리 커밋 테스트");
		service.delete(userId);
		
		return "home";
	}

}
