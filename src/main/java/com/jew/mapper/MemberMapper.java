package com.jew.mapper;

import com.jew.domain.Member;
import com.jew.domain.MemberAuth;

public interface MemberMapper {
	
	public void create(Member member) throws Exception;

	public void update(Member member) throws Exception;

	public Member detail(String userId) throws Exception;

	public int countAll() throws Exception;

	public void setAdmin(MemberAuth memberAuth) throws Exception;

	public void delete(String userId) throws Exception;

	
}
