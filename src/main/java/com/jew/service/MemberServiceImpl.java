package com.jew.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jew.domain.Member;
import com.jew.domain.MemberAuth;
import com.jew.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper mapper;

	@Override
	public void register(Member member) throws Exception {

		mapper.create(member);	
	}
	
	@Override
	public void update(Member member) throws Exception {
		
		mapper.update(member);
	}

	@Override
	public Member memberDetail(String userId) throws Exception {
		
		return mapper.detail(userId);
	}

	@Override
	public int countAll() throws Exception {
		System.out.println("찍히나 테스트;;");
		
		return mapper.countAll();
	}
	
	@Transactional
	@Override
	public void setAdmin(Member member) throws Exception {
		
		mapper.create(member);
		
		MemberAuth memberAuth= new MemberAuth();
		memberAuth.setUserId(member.getUserId());
		memberAuth.setAuth("admin");
		
		mapper.setAdmin(memberAuth);
	}
	
	 @Override
	public void delete(String userId) throws Exception {
		 mapper.delete(userId);
	}
}
