package com.fullstack.cbt.service;

import java.util.ArrayList;

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

	public ArrayList<ObjectionDTO> objectionSelectList(String oj_status, String oj_searchOption, String keyword) {
		logger.info("이의제기 셀렉트 리스트 요청");
		return dao.objectionSelectList(oj_status, oj_searchOption, keyword);

		
	}

	/* 게시판 목록(페이징 적용) */
	public ArrayList<ObjectionDTO> getListPaging(Criteria cri) {
		logger.info("페이징 서비스 요청");
		return dao.getListPaging(cri);
    }

	public int getTotal(Criteria cri) {
		return dao.getTotal(cri);
    }

}
