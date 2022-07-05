package com.fullstack.cbt.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fullstack.cbt.controller.Criteria;
import com.fullstack.cbt.dao.ProblemDAO;
import com.fullstack.cbt.dto.ProblemDTO;
import com.fullstack.cbt.dto.SubjectChapterDTO;
import com.fullstack.cbt.dto.SubjectDTO;
import com.fullstack.cbt.dto.TestAnswerDTO;

@Service
public class ProblemService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ProblemDAO dao;

	public ArrayList<SubjectDTO> subjectList() {
		logger.info("등록된 과목 가져오기 서비스 요청");
		return dao.subjectList();
	}

	public ArrayList<SubjectChapterDTO> subjectChapList(String su_idx) {
		logger.info("등록된 세부 과목 가져오기 서비스 요청");
		
		return dao.subjectChapList(su_idx);
	}

	public void problemWrite(HashMap<String, String> params, HttpSession session) {
		logger.info("문제등록 서비스 요청");
		String mb_id = (String)session.getAttribute("loginId");
		
		params.put("mb_id", mb_id);
		int success = dao.problemWrite(params);
		logger.info("문제 등록 성공 여부 : "+ success);		
	}

	public ArrayList<ProblemDTO> problemList() {
		logger.info("문제 리스트 요청");
		return dao.problemList();
	}

	public ArrayList<ProblemDTO> problemDetailList(String su_idx) {
		logger.info("선택된 과목 문제 리스트 요청");
		return dao.problemDetailList(su_idx);
	}

	public ArrayList<ProblemDTO> subjectChapDetailList(String sc_idx) {
		logger.info("선택된 과목 단원 문제 리스트 요청");
		return dao.subjectChapDetailList(sc_idx);
	}

	public ProblemDTO detail(String pc_idx) {
		logger.info("상세보기 서비스 요청");
		return dao.detail(pc_idx);
	}

	public ArrayList<SubjectChapterDTO> subjectChap(String su_idx) {
		logger.info("과목 단원 리스트 요청");
		return dao.subjectChap(su_idx);
	}

	public void problemUpdate(HashMap<String, Object> params) {
		logger.info("문제 수정 서비스 요청");
		int success = dao.problemUpdate(params);
		logger.info("수정된 데이터 수 : "+ success);
		
	}

	 /* 게시판 목록(페이징 적용) */
    public ArrayList<ProblemDTO> getListPaging(Criteria cri){
    	logger.info("전체 리스트 페이징 서비스 요청");
		return dao.getListPaging(cri);
    }
    
    /* 게시물 총 갯수 */
    public int getTotal() {
    	logger.info("전체 게시글 수 가져오기 서비스 요청");
        return dao.getTotal();
    }

	public ArrayList<ProblemDTO> selectedListPaging(String su_idx, String sc_idx, String pc_problem, int skip) {
		logger.info("전체 리스트 페이징 서비스 요청");
		return dao.selectedListPaging(su_idx, sc_idx, pc_problem,skip);
	}

	public int selectedTotal(String su_idx, String sc_idx, String pc_problem) {
		logger.info("선택에 따라  게시글 수 가져오기 서비스 요청");
		return dao.selectedTotal(su_idx,sc_idx,pc_problem);
	}

	public ArrayList<ProblemDTO> answerRate() {
		logger.info("정답률 서비스 요청");
		return dao.answerRate();
	}
	
	
}
