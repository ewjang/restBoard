package com.jew.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jew.domain.Board;
import com.jew.service.BoardService;

@Controller
public class BoardController {
	
	private static final Logger logger=LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService service;
	
	@RequestMapping(value="/board/list" ,method=RequestMethod.GET)
	public String list(Board board, Model model) throws Exception {
			
		logger.info("board list");
		
		ArrayList<Board> bdList=service.list(board);

		model.addAttribute("bdList", bdList);

		return "boardList";
	}
	
	@RequestMapping(value="/board/write" ,method=RequestMethod.GET)
	public String write() {
		logger.info("board write page");
		return "boardWrite";
	}
	
	@RequestMapping(value="/board/create",method=RequestMethod.POST)
	public String create(Board board) throws Exception {
		
		logger.info("board create!!");
		
		//Member mem=new Member();
	
		//String userId=mem.getUserId();
		//System.out.println("★★★userId★★★  :"+userId);
		
		//if(userId.equals("")) {
			//logger.info("로그인이 되어있지 않습니다. 로그인 화면으로 가세요.");
			//return "login";
		//}else {
			//board.setBoardId(1);
			board.setBoardAvail(1);
			Integer bdno=service.searchNo();
			board.setBoardNo(bdno);
					
//			if(colboard.isEmpty()) {
//				logger.info("비어있다.");
//				board.setBoardNo(1);
//			}else {
//				logger.info("안 비어있다.");
//				int var=colboard.;
//				System.out.println("var:"+var);
//				var=var+1;
//				board.setBoardNo(var);
//			}

			service.create(board);
		
		return "redirect:/board/list";
	}

	
}
