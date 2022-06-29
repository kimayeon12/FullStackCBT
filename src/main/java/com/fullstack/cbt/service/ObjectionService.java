package com.fullstack.cbt.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fullstack.cbt.dao.ObjectionDAO;
import com.fullstack.cbt.dto.ProblemDTO;

@Service
public class ObjectionService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ObjectionDAO dao;
	
	public ProblemDTO problemDto(String pc_idx) {
		logger.info("문제 가져오기 서비스 요청");
		return dao.problemDto(pc_idx);
	}
	
}
