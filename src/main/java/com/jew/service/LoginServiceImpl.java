package com.jew.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jew.domain.Member;
import com.jew.mapper.LoginMapper;

@Service
public class LoginServiceImpl implements LoginService{
	
	@Autowired
	private LoginMapper mapper;
	
	@Override
	public Member match(String userId) throws Exception {
		
		
		
		return mapper.match(userId);
	}
	
}
