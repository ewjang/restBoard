package com.jew.service;

import com.jew.domain.Member;

public interface MemberService {

	public void register(Member member) throws Exception;

	public void update(Member member) throws Exception;

	public Member memberDetail(String userId) throws Exception;

	public int countAll() throws Exception;

	public void setAdmin(Member member) throws Exception;

	public void delete(String userId) throws Exception;
	
	
}
