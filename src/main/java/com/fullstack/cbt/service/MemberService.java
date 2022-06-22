package com.fullstack.cbt.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fullstack.cbt.dao.MemberDAO;

@Service
public class MemberService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MemberDAO dao;

	public String login(String mb_id, String mb_pw) {
		logger.info("서비스도착");
		return dao.login(mb_id,mb_pw);
	}

	public String joinForm(String mb_id, String mb_pw, String mb_pw2,
			String mb_name, String mb_email ) {
		logger.info("서비스도착");		
		return dao.joinForm(mb_id,mb_pw,mb_pw2,mb_name,mb_email);
		
	}
}
