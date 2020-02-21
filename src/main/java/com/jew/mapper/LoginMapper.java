package com.jew.mapper;

import com.jew.comm.dto.LoginDto;
import com.jew.domain.Member;

public interface LoginMapper {
	
	public Member match(String userId) throws Exception;

	public Member login(LoginDto dto) throws Exception; 
	
}
