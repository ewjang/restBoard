package com.jew.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.jew.domain.Member;
import com.jew.domain.MemberAuth;
import com.jew.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper mapper;

	@Autowired
	private JavaMailSender mailSender;
		
	@Override
	public void create(Member member) throws Exception {
		mapper.create(member);
	}
	
	@Override
	public void verify(Member member) throws Exception {
		mapper.verify(member);

	}
	
	@Override
	public int countAll() throws Exception {
		return mapper.countAll();
	}
	@Override
	public void setAdmin(Member member) throws Exception {
		
		mapper.create(member);
		
		MemberAuth memberAuth= new MemberAuth();
		memberAuth.setUserId(member.getUserId());
		memberAuth.setAuth("admin");
		
		mapper.setAdmin(memberAuth);
	}
	
	@Override
	public void update(Member member) throws Exception {
		mapper.update(member);
	}
	
	@Override
	public void delete(String userId) throws Exception {
	    mapper.delete(userId);
	}

	@Override
	public Member memberDetail(String userId) throws Exception {
		return mapper.detail(userId);
	}
	
	@Override
	public String idChk(String userId) throws Exception {
		return mapper.idChk(userId);
	}
}
