package com.fullstack.cbt.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fullstack.cbt.dao.SubjectDAO;

@Service
public class SubjectService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SubjectDAO dao;
	public String reg(String subject, String check) {
		logger.info("서비스 도착");
		String msg = "과목 등록에 실패 했습니다.";
		
		if(dao.reg(subject,check)>0) {
			msg = "과목 등록에 성공 하였습니다.";
		}
		return msg;
	}

}
