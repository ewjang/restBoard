package com.jew.service;

import com.jew.comm.dto.LoginDto;
import com.jew.domain.Member;

public interface LoginService {
	
	public Member match(String userId) throws Exception;

	public Member login(LoginDto dto) throws Exception;
	
}
