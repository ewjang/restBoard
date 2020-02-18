package com.jew.mapper;

import com.jew.domain.Member;

public interface LoginMapper {
	
	public void match(Member member) throws Exception; 
	
}
