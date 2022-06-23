package com.fullstack.cbt.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fullstack.cbt.dao.TestDAO;
import com.fullstack.cbt.dto.SubjectDTO;

@Service
public class TestService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired TestDAO dao;
	
	public ArrayList<SubjectDTO> subjectList() {
		logger.info("등록된 과목 가져오기 서비스 요청");
		return dao.subjectList();
	}

	
	
}
