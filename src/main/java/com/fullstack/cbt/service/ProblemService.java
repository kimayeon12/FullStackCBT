package com.fullstack.cbt.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fullstack.cbt.dao.ProblemDAO;

@Service
public class ProblemService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ProblemDAO dao;

	public ArrayList<String> subjectList() {
		logger.info("등록된 과목 가져오기 서비스 요청");
		ArrayList<String> subject = dao.subjectList();
		
		return subject;
	}

	public ArrayList<String> chapList(String subject) {
		logger.info("등록된 세부 과목 가져오기 서비스 요청");
		
		return dao.chapList(subject);
	}

}
