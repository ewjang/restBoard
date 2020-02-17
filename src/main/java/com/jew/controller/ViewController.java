package com.jew.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/views")
public class ViewController {

	private static final Logger logger=LoggerFactory.getLogger(ViewController.class);
	
	@RequestMapping(value="/loginPageGo" , method=RequestMethod.GET)
	public String loginPage(String name, Model model) {
		
		logger.info("loginPageGo");
		System.out.println(name);
		model.addAttribute("name",name);
		
		return "login";
	}
	
	
	@RequestMapping(value="/memberPageGo" , method=RequestMethod.GET)
	public String memberPage() {
		
		logger.info("memberPageGo");

		return "member";
	}
	
}
