package com.jew.mapper;

import com.jew.domain.Member;

public interface MemberMapper {
	
	public void create(Member member) throws Exception;

	public void update(Member member) throws Exception;

	public Member detail(String userId) throws Exception;
	
}
