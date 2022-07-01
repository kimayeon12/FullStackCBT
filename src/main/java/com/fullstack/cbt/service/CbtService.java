package com.fullstack.cbt.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fullstack.cbt.controller.Criteria;
import com.fullstack.cbt.dao.CbtDAO;
import com.fullstack.cbt.dto.ProblemDTO;
import com.fullstack.cbt.dto.SubjectDTO;
import com.fullstack.cbt.dto.TestDTO;

@Service
public class CbtService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired CbtDAO dao;
	
	public ArrayList<TestDTO> testlist() {
		logger.info("시험 리스트 가져오기 서비스 요청");
		return dao.testlist();
	}

	public ArrayList<SubjectDTO> subjectList() {
		logger.info("등록된 과목 가져오기 서비스 요청");
		return dao.subjectList();
	}

	public ArrayList<TestDTO> selectedList(String su_idx, String tt_status, String mb_id) {
		logger.info("선택된 값에 따른 리스트 서비스 요청");
		return dao.selectedList(su_idx,tt_status,mb_id);
	}

	public TestDTO testInfo(String tt_idx) {
		logger.info("시험 정보 서비스 요청");
		return dao.testInfo(tt_idx);
	}

	public ArrayList<ProblemDTO> testDetail(String tt_idx) {
		logger.info("상세보기 서비스 요청");
		return dao.testDetail(tt_idx);
	}

	
	// 페이징 관련 추가 내용 밑에 /////
	public ArrayList<TestDTO> getListPaging(Criteria cri) {
		logger.info("전체 리스트 페이징 서비스 요청");
		return dao.getListPaging(cri);
	}

	public int getTotal() {
		logger.info("전체 게시글 수 가져오기 서비스 요청");
		return dao.getTotal();
	}
/*
	public ArrayList<TestDTO> selectedListPaging(HashMap<String, String> params, Criteria cri) {
		logger.info("전체 리스트 페이징 서비스 요청");
		return dao.selectedListPaging(params, cri);
	}
*/
/*
	public ArrayList<TestDTO> selectedListPaging(HashMap<String, Object> params) {
		logger.info("전체 리스트 페이징 서비스 요청");
		return dao.selectedListPaging(params);
	}
*/ 
	
	public ArrayList<TestDTO> selectedListPaging(String su_idx, String tt_status, String mb_id, int skip) {
		logger.info("전체 리스트 페이징 서비스 요청");
		return dao.selectedListPaging(su_idx, tt_status, mb_id,skip);
	}



	public int selectedTotal(String su_idx, String tt_status, String mb_id) {
		logger.info("선택에 따라  게시글 수 가져오기 서비스 요청");
		return dao.selectedTotal(su_idx,tt_status,mb_id);
	}



	
	
	

	
}
