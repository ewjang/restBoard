package com.jew.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jew.mapper.DateMapper;

@Service
public class CalenderServiceImpl implements CalenderService{

	@Autowired
	private DateMapper mapper;
	
	@Override
	public Date callDate() throws Exception {
		
		return mapper.callDate();
	}
}
