package com.fullstack.cbt.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fullstack.cbt.dao.ProblemDAO;
import com.fullstack.cbt.dto.ProblemDTO;
import com.fullstack.cbt.dto.SubjectChapterDTO;
import com.fullstack.cbt.dto.SubjectDTO;

@Service
public class ProblemService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ProblemDAO dao;

	public ArrayList<SubjectDTO> subjectList() {
		logger.info("등록된 과목 가져오기 서비스 요청");
		return dao.subjectList();
	}

	public ArrayList<SubjectChapterDTO> subjectChapList(String subject) {
		logger.info("등록된 세부 과목 가져오기 서비스 요청");
		
		return dao.subjectChapList(subject);
	}

	public void problemWrite(HashMap<String, Object> params) {
		logger.info("문제등록 서비스 요청");
		int success = dao.problemWrite(params);//성공 여부를 내부적으로 확인하려고 한다.
		logger.info("문제 등록 성공 여부 : "+ success);		
	}

	public ArrayList<ProblemDTO> problemList() {
		logger.info("문제 리스트 요청");
		return dao.problemList();
	}

}
