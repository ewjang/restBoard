package com.jew.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jew.domain.Member;
import com.jew.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper mapper;

	@Override
	public void register(Member member) throws Exception {
	
		System.out.println("userId : "+member.getUserId());
		System.out.println("hobby : "+member.getHobby());
		System.out.println("job : "+member.getJob());
		
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

}
