package com.jew.service;

import com.jew.domain.Member;

public interface LoginService {
	
	public Member match(String userId) throws Exception;
	
}
