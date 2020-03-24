package com.jew.mapper;

import com.jew.comm.dto.LoginDto;
import com.jew.domain.Member;

public interface LoginMapper {

	public Member login(LoginDto dto) throws Exception;

	public Member accountchk(LoginDto dto) throws Exception; 
	
}
