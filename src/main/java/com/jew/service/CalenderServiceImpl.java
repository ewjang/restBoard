package com.jew.service;



import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jew.mapper.DateMapper;

@Service
public class CalenderServiceImpl implements CalenderService{

	@Autowired
	private DateMapper mapper;
	
	@Override
	public String callDate() throws Exception {
		
		return mapper.callDate();
	}
}
