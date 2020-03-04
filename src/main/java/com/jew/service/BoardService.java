package com.jew.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.jew.comm.dto.Criteria;
import com.jew.domain.Board;
import com.jew.domain.Reply;

public interface BoardService {
	
	public void create(Board board) throws Exception;

	public Integer searchNo() throws Exception;

	public ArrayList<Board> list(Criteria cri) throws Exception;

	public void delete(String boardNo) throws Exception;

	public ArrayList<Board> mylist(@Param("board")Board board, @Param("cri") Criteria cri) throws Exception;

	public Board detail(String boardNo) throws Exception;

	public void update(Board board) throws Exception;

	public int countBoardList() throws Exception;

	public int countMyBoardList(Board board) throws Exception;

	public void replyWrite(Reply reply) throws Exception;

	public ArrayList<Reply> replyList(String boardNo) throws Exception;
	
}
