package com.fullstack.cbt.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fullstack.cbt.controller.Criteria;
import com.fullstack.cbt.dao.ProblemSaveDAO;
import com.fullstack.cbt.dto.ProblemDTO;
import com.fullstack.cbt.dto.SubjectDTO;

@Service
public class ProblemSaveService {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired ProblemSaveDAO dao;
	
	public ArrayList<SubjectDTO> subjectList(String loginId) {
		logger.info("과목 리스트 가져오기 서비스 요청");
		return dao.subjectList(loginId);
	}

	public ArrayList<ProblemDTO> problemSaveList(String loginId, int skip) {
		logger.info("보관한 문제 가져오기 서비스 요청");
		return dao.problemSaveList(loginId,skip);
	}
	

	public ArrayList<ProblemDTO> selectedSaveList(String loginId, String su_idx, int skip) {
		logger.info("선택된 과목에 따라 보관한 문제 가져오기 서비스 요청");
		return dao.selectedSaveList(loginId,su_idx,skip);
	}

	public boolean problemSaveDel(String[] chkArr) {
		logger.info("선택한 문제 삭제 서비스 요청 ");
		int row = dao.problemSaveDel(chkArr);
		
		boolean success = false;
		if (row>0) {
			success = true;
		}
		return success;
	}

	public int getTotal(String loginId) {
		logger.info("전체 게시글 수 가져오기 서비스 요청");
		return dao.getTotal(loginId);
	}

	public int selectedTotal(String loginId, String su_idx) {
		logger.info("선택된 값에 따라 게시글 수 가져오기 서비스 요청");
		return dao.selectedTotal(loginId,su_idx);
	}

	

	
}
