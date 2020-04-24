package com.jew.controller;



import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jew.domain.Member;
import com.jew.service.CalenderService;
import com.jew.service.MemberService;
import com.jew.utils.MailUtils;

import io.swagger.annotations.ApiOperation;


@Controller
public class MemberController {
	
	private static final Logger logger=LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService service;
	
	@Inject
	JavaMailSender mailSender;
	
	@Autowired
	CalenderService calenderService;
	
	@RequestMapping(value="/member/regist" , method=RequestMethod.GET)
	@ApiOperation(value="회원가입 화면 이동")
	public String memberPage() {
		logger.info("memberPageGo");
		return "member";
	}
	
	@ApiOperation(value="회원가입 아이디 중복 체크")
	@RequestMapping(value="/member/idchk/{userId}", method=RequestMethod.GET,  produces = "application/text; charset=utf8")	
	@ResponseBody
	public String idChk(@PathVariable("userId") String userId) throws Exception{
		
		String temp=service.idChk(userId);
		String a="";
		
		logger.info("체크확인 : " +temp);
		if(temp==null) {
			logger.info("사용 가능합니다.");
			a="사용 가능";
			return a;
		}else {
			logger.info("이미 해당 아이디가 있습니다.");
			a="사용 불가능";
			return a;
		}
	}
	
	@RequestMapping(value="/member/regist", method = RequestMethod.POST)
	@ApiOperation(value="회원가입")
	public String register(Member member) throws Exception {
		
		logger.info("member regist . . .");

		if(service.countAll()==0) {
			service.setAdmin(member);
		}else {
			service.create(member);
		}
		
		MailUtils sendMail=new MailUtils(mailSender);
		sendMail.setSubject("[ 이메일 인증 ] " +member.getUserName()+"님 jew's Web Board 가입을 환영합니다.");
		sendMail.setText( // 메일내용
				"<h1>메일인증(아래를 클릭하시면 인증이 완료되며 웹 게시판에 로그인이 가능합니다.</h1>" +
				"<a href='http://localhost:8080//member/verify?userMail=" + member.getUserMail() +
				"' target='_blenk'>이메일 인증 확인</a>");
		sendMail.setFrom("jew8969@gmail.com", "장은우"); //보내는 이
		sendMail.setTo(member.getUserMail()); //받는이
		sendMail.send();
								
		return "mailAuthWait";
	}
	
	@RequestMapping(value="/member/verify", method=RequestMethod.GET)
	@ApiOperation(value="메일 인증")
	public String signSuccess(@RequestParam String userMail) throws Exception {
		logger.info("이메일 인증 기능 처리 . . . ");

		 Member member=new Member();
		 member.setUserMail(userMail);
		 service.verify(member);
		
		return "redirect:/";
	}
	
	
	@RequestMapping(value="/member/update/{userId}" , method=RequestMethod.GET)
	@ApiOperation(value="회원 수정 화면")
	public ModelAndView updMember(@PathVariable("userId") String userId ) throws Exception{
		
		logger.info("Member update page...");		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("memberUpdate");
		mav.addObject("update", service.memberDetail(userId));
		
		return mav;
	}

	@RequestMapping(value="/member/update", method = RequestMethod.PUT)
	@ApiOperation(value="회원 수정")
	public String update(Member member) throws Exception {
		logger.info("Member update . . . ");
		service.update(member);		
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="/member/delete/{userId}", method=RequestMethod.DELETE)
	@ApiOperation(value="회원 탈퇴")
	public String delete(@PathVariable("userId") String userId) throws Exception{	
		logger.info("Member delete . . .");
		service.delete(userId);		
		return "redirect:/";
	}

	
}
