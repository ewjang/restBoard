package com.jew.service;

import java.util.ArrayList;

import com.jew.domain.Board;

public interface BoardService {
	
	public void create(Board board) throws Exception;

	public Integer searchNo() throws Exception;

	public ArrayList<Board> list(Board board) throws Exception;

	public Board delete(String boardNo) throws Exception;

	public ArrayList<Board> mylist(Board board) throws Exception;
	
}
