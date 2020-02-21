package com.jew.mapper;

import java.util.ArrayList;

import com.jew.domain.Board;

public interface BoardMapper {
	
	public void create(Board board) throws Exception;

	public Integer searchNo() throws Exception;

	public ArrayList<Board> list(Board board) throws Exception;
	
}