package com.fullstack.cbt.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fullstack.cbt.dao.SubjectDAO;
import com.fullstack.cbt.dto.SubjectChapterDTO;
import com.fullstack.cbt.dto.SubjectDTO;

@Service
public class SubjectService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SubjectDAO dao;
	
	public ArrayList<SubjectDTO> list() {
		logger.info("리스트 서비스 요청");
		return dao.list();
	}

	public HashMap<String, Object> suboverlay(String chkSub) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		String overSub = dao.suboverlay(chkSub);
		logger.info("중복 과목명이 있나?"+overSub);
		boolean over = overSub == null? false : true;
		map.put("suboverlay",over);
		
		return map;
	}

	public HashMap<String, Object> subreg(String subject,int chk) {
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		int row = dao.subreg(subject, chk);
		boolean success = false;
		
		if(row > 0) {
			success = true;
		}
		
		result.put("success", success);
		
		return result;
	}

	public SubjectDTO subdetail(String su_idx) {
		
		SubjectDTO dto = null;
		logger.info(su_idx+" 번 과목 번호 상세보기 서비스 요청");
		dto = dao.subdetail(su_idx);
		logger.info("content : "+dto.getSu_name());
		return dto;
	}

	
	
	
	public void subupdate(HashMap<String, String> params) {
		logger.info("과목명 수정 요청 서비스");
		int row = dao.subupdate(params);
		logger.info("수정된 과목명 데이터 수 : "+row);
	}
	
	/*
	public HashMap<String, Object> subRev(String su_idx, String subject, int chk) {
		HashMap<String, Object> subRevResult = new HashMap<String, Object>();
		int row = dao.subRev(su_idx,subject,chk);
		boolean subRevSuccess = false;
		
		if(row > 0) {
			subRevSuccess = true;
		}
		
		logger.info("수정된 데이터 수 : "+row);
		subRevResult.put("subRevSuccess", subRevSuccess);
		
		return subRevResult;
	}
	*/
	
	
	
public HashMap<String, Object> subreg(String su_idx, String subject,int chk) {
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		int row = dao.subreg(subject, chk);
		boolean success = false;
		
		if(row > 0) {
			success = true;
		}
		
		result.put("success", success);
		
		return result;
	}
	
	
	
	
	
	//과목 단원
	
	public ArrayList<SubjectChapterDTO> subList() {
		logger.info("과목단원관리에서 과목 갯수 서비스 요청");
		return dao.subList();
	}
	
	public ArrayList<SubjectChapterDTO> chapList() {
		logger.info("과목단원별 문제갯수 및 과목단원갯수 서비스 요청");
		return dao.chapList();
	}
	
	public ArrayList<SubjectDTO> subjectList() {
		logger.info("과목 리스트 서비스 요청");
		return dao.subjectList();
	}

	public HashMap<String, Object> subChapOverlay(String chksubChap) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		String overSubChap = dao.subChapOverlay(chksubChap);
		logger.info("중복 과목명이 있나?"+overSubChap);
		boolean over = overSubChap == null? false : true;
		map.put("subChapOverlay",over);
		
		return map;
	}

	public HashMap<String, Object> subChapReg(String subject, String chapter) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		int row = dao.subChapReg(subject, chapter);
		boolean success = false;
		
		if(row > 0) {
			success = true;
		}
		
		result.put("success", success);
		
		return result;
	}

	public SubjectChapterDTO subChapRevice(String sc_idx) {
		logger.info(sc_idx+" 번 과목단원번호 상세보기 서비스 요청");
		return dao.subChapRevice(sc_idx);
	}

	public SubjectDTO subjectselList(String su_idx) {
		logger.info(su_idx+" 번 과목의 과목단원수정에서 과목선택값 서비스 요청");
		return dao.subjectselList(su_idx);
	}

	public HashMap<String, Object> subChapReOverlay(String chkSubChap) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String subChapReOverlay = dao.subChapReOverlay(chkSubChap);
		logger.info("중복 과목단원명이 있나?"+subChapReOverlay);
		boolean over = subChapReOverlay == null? false : true;
		map.put("subChapReOverlay",over);
		
		return map;
	}

	
	
	// 여기부터 수정하기 서비스
	
	public void subChapUpdate(HashMap<String, String> params) {
		logger.info("과목단원명 수정 요청 서비스"+params);
		int row = dao.subChapUpdate(params);
		logger.info("수정된 데이터 수 : "+row);
		
	}

	
	//임시테스트
	/*
	public HashMap<String, Object> submitCheck(String submitChk) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row = dao.submitCheck(submitChk);
		logger.info("수정버튼 클릭시 중복 확인 "+submitChk);
		boolean over = false;
		
		if(row>0) {
			over = true;
		}
		
		map.put("submitCheck", over);
		return map;
	}
	*/

	


	

	
	


	


}
