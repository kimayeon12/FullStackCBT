package com.fullstack.cbt.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fullstack.cbt.controller.Criteria;
import com.fullstack.cbt.dao.ObjectionDAO;
import com.fullstack.cbt.dto.ObjectionDTO;
import com.fullstack.cbt.dto.ProblemDTO;

@Service
public class ObjectionService {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	ObjectionDAO dao;

	public ProblemDTO problemDto(String pc_idx) {
		logger.info("문제 가져오기 서비스 요청");
		return dao.problemDto(pc_idx);
	}

	public boolean objectionInsert(String content, String pc_idx, String loginId) {
		logger.info("이의제기 내용 제출 서비스 요청");
		int row = dao.objectionInsert(content, pc_idx, loginId);

		boolean success = false;
		if (row > 0) {
			success = true;
		}
		return success;
	}

	
	public ArrayList<ObjectionDTO> objectionList() {
		logger.info("이의제기 리스트 요청");
		return dao.objectionList();
	}
	/*
	public ArrayList<ObjectionDTO> objectionSelectList(String oj_status, String pc_problem) {
		logger.info("이의제기 셀렉트 리스트 요청");
		return dao.objectionSelectList(oj_status, pc_problem);		
	}*/

	/* 게시판 목록(페이징 적용) */
	public ArrayList<ObjectionDTO> getListPaging(Criteria cri) {
		logger.info("페이징 서비스 요청");
		return dao.getListPaging(cri);
    }
	/* 페이징 총 게시글 수 구하기*/
	public int getTotal() {
		return dao.getTotal();
    }
	
	/* 이의제기 상세보기 */
	public ObjectionDTO objectionDetail(String oj_idx) {
		logger.info("이의제기 상세보기");
		return dao.objectionDetail(oj_idx);
	}

	public ArrayList<ObjectionDTO> status() {
		logger.info("처리상태 옵션 가져오기 서비스");
		return dao.status();
	}

	public void objectionUpdate(HashMap<String, Object> params) {
		logger.info("이의제기 수정 서비스 요청");
		int success = dao.objectionUpdate(params);
		logger.info("수정된 데이터 수 : "+ success);
		
	}
	
	/* 셀렉트 페이징 */
	public ArrayList<ObjectionDTO> selectedListPaging(String oj_status, String pc_problem, int skip) {
		logger.info("전체 리스트 페이징 서비스 요청");
		return dao.selectedListPaging(oj_status, pc_problem,skip);
	}

	public int selectedTotal(String oj_status, String pc_problem) {
		logger.info("선택에 따라  게시글 수 가져오기 서비스 요청");
		return dao.selectedTotal(oj_status,pc_problem);
	}

}
