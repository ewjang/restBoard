package com.jew.mapper;

import com.jew.domain.Member;

public interface LoginMapper {
	
	public Member match(String userId) throws Exception; 
	
}
