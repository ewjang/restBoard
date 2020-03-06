package com.jew.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jew.comm.dto.Criteria;
import com.jew.domain.Board;
import com.jew.domain.Reply;
import com.jew.mapper.BoardMapper;


@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;
	
	@Override
	public void create(Board board) throws Exception {

		mapper.create(board);	
	}

	@Override
	public Integer searchNo() throws Exception {
		
		Integer val=mapper.searchNo();
		
		System.out.println("BoardServiceImpl val : "+val);
		
		//게시글이 없다면 게시글번호 1번을 반환, 게시글이 있다면 게시글 번호+1을 반환
		if(val==null) {
			return 1;
			
		}else {
			return val+1;
		}
	}
	
	@Override
	public int countBoardList() throws Exception {
		
		return mapper.countBoardList();
	}
	
	@Override
	public void delete(String boardNo) throws Exception {
		mapper.delete(boardNo);
	}
	
	@Override
	public ArrayList<Board> mylist(@Param("board") Board board, @Param("cri") Criteria cri) throws Exception {
		return mapper.mylist(board, cri);
	}

	@Override
	public Board detail(int boardNo) throws Exception {
			return mapper.detail(boardNo);
	}
	
	@Override
	public void update(Board board) throws Exception {
		mapper.update(board);
	}

	@Override
	public ArrayList<Board> list(Criteria cri) throws Exception {
		return mapper.list(cri);
	}
	
	@Override
	public int countMyBoardList(Board board) throws Exception {
		return mapper.countMyBoardList(board);
	}
	
	@Override
	public void replyWrite(Reply reply) throws Exception {
		  mapper.replyWrite(reply);
	}

	@Override
	public ArrayList<Reply> replyList(@Param("reply") Reply rp, @Param("cri") Criteria cri) throws Exception {
		
		System.out.println("답글 페이징 에러 로그 : "+ rp.getBoardNo());
		
		return mapper.replyList(rp, cri);
	}
	
	@Override
	public void replyDelete(int replyNo) throws Exception {
		mapper.replyDelete(replyNo);
	}
	
	@Override
	public int countReplyList(int boardNo) throws Exception {
		
		return mapper.countReplyList(boardNo);
	}

}
