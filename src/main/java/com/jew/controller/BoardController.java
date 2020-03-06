package com.jew.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jew.comm.dto.Criteria;
import com.jew.comm.dto.PageMaker;
import com.jew.comm.interceptor.SessionKeys;
import com.jew.domain.Board;
import com.jew.domain.Member;
import com.jew.domain.Reply;
import com.jew.service.BoardService;
import com.jew.service.CalenderService;

@Controller
public class BoardController implements SessionKeys{
	
	private static final Logger logger=LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService service;

	@Autowired
	private CalenderService clservice; //오늘 시스템 날짜 조회
	
	@RequestMapping(value="/board/list" ,method=RequestMethod.GET)
	public ModelAndView list(Board board, Criteria cri, HttpSession session) throws Exception {
			
		logger.info("board list");

		Member member=(Member)session.getAttribute(LOGIN);
		logger.info("/board/list userId : "+member.getUserId());
		logger.info("/board/list session.getAttribute(LOGIN) : "+session.getAttribute(LOGIN));
		if(member.getUserId()==null) {
			ModelAndView temp=new ModelAndView();
			temp.setViewName("boardList");
			return temp;
		}else {
			board.setUserId(member.getUserId());
		}
		
		ModelAndView mav=new ModelAndView();
		
		PageMaker pageMaker=new PageMaker();
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.countBoardList());
		
		ArrayList<Board> bdList=service.list(cri);
		
		mav.setViewName("boardList");
		mav.addObject("bdList",bdList);
		mav.addObject("pageMaker", pageMaker);
		
		return mav;
	}
	
	@RequestMapping(value="/board/mylist" ,method=RequestMethod.GET)
	public ModelAndView myList(Board board, Criteria cri, HttpSession https) throws Exception {
			
		logger.info("board mylist");
		
		Member member=(Member)https.getAttribute(LOGIN);
		logger.info("member.getUserId() : "+member.getUserId());
//		logger.info("https.getAttribute(LOGIN) : "+https.getAttribute(LOGIN));
		if(member.getUserId()==null) {
			logger.info("[내가 쓴 글 모음 기능]은 로그인이 필요한 기능입니다.");
		}else {
			board.setUserId(member.getUserId());
		}
		
		ModelAndView mav=new ModelAndView();
		
		PageMaker pageMaker=new PageMaker();
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.countMyBoardList(board));
		
		ArrayList<Board> bdMyList=service.mylist(board, cri);
		
		mav.setViewName("boardMyList");
		mav.addObject("bdMyList", bdMyList);
		mav.addObject("pageMaker", pageMaker);
		return mav;
	}
	
	
	@RequestMapping(value="/board/write" ,method=RequestMethod.GET)
	public String write(Model model) throws Exception{
		logger.info("board write page");
		
		String calldate=clservice.callDate();
		logger.info("Date : "+ calldate);
		
		model.addAttribute("calldate",clservice.callDate());
		//ModelAndView mav =new ModelAndView();
		//mav.setViewName("boardWrite");
		//mav.addObject("calldate",clservice.callDate());
		
		return "boardWrite";
	}
	
	@RequestMapping(value="/board/detail/{boardNo}" ,method=RequestMethod.GET)
	public ModelAndView detail(@PathVariable("boardNo") int boardNo, Criteria cri) throws Exception {
		logger.info("board detail page");
		logger.info("boardNo : "+boardNo);
		
		PageMaker pageMaker=new PageMaker();	
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.countReplyList(boardNo));
	
		Reply rp=new Reply();
		rp.setBoardNo(boardNo);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("boardDetail");
		mav.addObject("detail",service.detail(boardNo));
		mav.addObject("rep", service.replyList(rp, cri));
		mav.addObject("pageMaker", pageMaker);
		
		logger.info("이건 찍힌다2");
		return mav;
	}
	
	@RequestMapping(value="/board/update/{boardNo}/{userId}" ,method=RequestMethod.POST)
	public String update(Board board) throws Exception {
		logger.info("board update success . . . ");
		logger.info("board.getBoardContent() : "+board.getBoardContent());
		logger.info("board.getBoardTitle() : "+board.getBoardTitle());
		logger.info("board.getboardNo() : "+board.getBoardNo());
		logger.info("board.getuserId() : "+board.getUserId());
		
		service.update(board);
		
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="/board/update/{boardNo}" ,method=RequestMethod.GET)
	public ModelAndView updDetail(@PathVariable("boardNo") int boardNo) throws Exception {
		logger.info("board update  . . . ");
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("boardUpdate");
		mav.addObject("update", service.detail(boardNo));

		return mav;
	}
	
	
	@RequestMapping(value="/board/delete/{boardNo}")
	public String delete(@PathVariable("boardNo") String boardNo) throws Exception {
		logger.info("board delete page");
	
		logger.info("boardNo : "+boardNo);
		service.delete(boardNo);
		
		return "redirect:/board/list";
	}
	
	
	@RequestMapping(value="/board/create",method=RequestMethod.POST)
	public String create(Board board, HttpSession https) throws Exception {
		
		logger.info("board create!!");
		
			Integer bdno=service.searchNo();
			board.setBoardNo(bdno);
			board.setBoardAvail(1);
			
			Member member=(Member)https.getAttribute(LOGIN);
			logger.info("member.getUserId() : "+member.getUserId());
			logger.info("https.getAttribute(LOGIN) : "+https.getAttribute(LOGIN));
			board.setUserId(member.getUserId());
			
			//board.setRegDate(date);
			//logger.info("board.setRegDate(date): "+board.getRegDate());
	
			service.create(board);
		
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="/board/reply/create/{boardNo}", method=RequestMethod.POST)
	public String create(@PathVariable int boardNo ,Reply reply, HttpSession https) throws Exception{
		
		logger.info("board reply create . . .");
		
		logger.info("reply content : "+reply.getReplyContent());
		
		Member member=(Member)https.getAttribute(LOGIN);
		reply.setUserId(member.getUserId());
		reply.setBoardNo(boardNo);
		
		service.replyWrite(reply);
		
		return "redirect:/board/detail/"+boardNo;
	}
	
	@RequestMapping(value="/board/reply/delete/{boardNo}/{replyNo}")
	public String delete(@PathVariable int replyNo , @PathVariable int boardNo, Reply reply)throws Exception{
		//redirect에 활용하기위해 boardno 경로로 파라미터 받음
		
		logger.info("board reply delete . . . ");
	
		logger.info("replyNo : "+ replyNo);
		logger.info("boardNo : "+ boardNo); 
		
		service.replyDelete(replyNo);
		
		return "redirect:/board/detail/"+boardNo;
	}
	
	
}
