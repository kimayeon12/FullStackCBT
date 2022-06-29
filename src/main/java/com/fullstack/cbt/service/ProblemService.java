package com.fullstack.cbt.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fullstack.cbt.controller.Criteria;
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

	public ArrayList<SubjectChapterDTO> subjectChapList(String su_idx) {
		logger.info("등록된 세부 과목 가져오기 서비스 요청");
		
		return dao.subjectChapList(su_idx);
	}

	public void problemWrite(HashMap<String, Object> params) {
		logger.info("문제등록 서비스 요청");
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

	/*
	 * public ArrayList<ProblemDTO> search(String pc_idx) {
	 * logger.info("검색에 따른 리스트 요청"); return dao.search(pc_idx); }
	 */

	 /* 게시판 목록(페이징 적용) */
    public ArrayList<ProblemDTO> getListPaging(Criteria cri){
    	
		return dao.getListPaging(cri);
    }
    
    /* 게시물 총 갯수 */
    public int getTotal(Criteria cri) {
        
        return dao.getTotal(cri);
    }
	
	//페이징 처리
	/*
	public HashMap<String, Object> list(HashMap<String, String> params) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int cnt = Integer.parseInt(params.get("cnt"));//몇 개 씩 보여줄 건가.
		int page = Integer.parseInt(params.get("page"));
		logger.info("보여줄 페이지 :"+ page);
		
		//총갯수(allCnt) / 페이지당 보여줄 갯수(cnt) = 생성 가능한 페이지(pages)
		int allCnt = dao.allCount();
		logger.info("allCnt : "+allCnt);
		
		int pages = allCnt%cnt > 0 ? (allCnt/cnt)+1 : (allCnt/cnt);
		
		logger.info("pages : "+pages);
		
		if(page>pages) {
			page=pages;
		}
		
		map.put("currPage", page);//현재 페이지
		map.put("pages", pages);//만들 수 있는 최대 페이지 수
		
		int offset = (page-1) * cnt;
		logger.info("offset : "+offset);		
		
		ArrayList<ProblemDTO> list = dao.list(cnt, offset);
		map.put("list", list);
		
		return map;
	}
	*/
	
	
}
