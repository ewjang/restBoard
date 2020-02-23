package com.jew.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jew.domain.Board;
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
	public ArrayList<Board> list(Board board) throws Exception {
		return mapper.list(board);
	}
	
	@Override
	public void delete(String boardNo) throws Exception {
		mapper.delete(boardNo);
	}
	
	@Override
	public ArrayList<Board> mylist(Board board) throws Exception {
		return mapper.mylist(board);
	}

	@Override
	public Board detail(String boardNo) throws Exception {
			return mapper.detail(boardNo);
	}
	
	@Override
	public void update(Board board) throws Exception {
		mapper.update(board);
	
	}

	
}
