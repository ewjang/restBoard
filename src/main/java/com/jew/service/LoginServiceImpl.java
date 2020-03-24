package com.jew.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jew.comm.dto.LoginDto;
import com.jew.domain.Member;
import com.jew.mapper.LoginMapper;

@Service
public class LoginServiceImpl implements LoginService{
	
	@Autowired
	private LoginMapper mapper;
	
	private static final String NS="com.jew.mapper.LoginMapper";
	private static final String LOGIN=NS+".login";

	@Override
	public Member login(LoginDto dto) throws Exception {
		
		return mapper.login(dto);
	}
	
	@Override
	public Member accountchk(LoginDto dto) throws Exception {
		
		return mapper.accountchk(dto);
	}
	
}
