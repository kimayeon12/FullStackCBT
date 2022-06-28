package com.fullstack.cbt.service;

import java.util.ArrayList;
import java.util.HashMap;

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
		logger.info(su_idx+" 상세보기 서비스 요청");
		dto = dao.subdetail(su_idx);
		logger.info("content : "+dto.getSu_name());
		return dto;
	}

	public void subupdate(String subject, String check, String su_idx) {
		logger.info("과목 수정 요청 서비스");
		int row = dao.update(subject,check,su_idx);
		logger.info("수정된 과목명 데이터 수 : "+row);
	}

	//과목 단원
	
	public ArrayList<SubjectChapterDTO> chapList() {
		logger.info("과목단원관리 리스트 서비스 요청");
		return dao.chapList();
	}
	
	public ArrayList<SubjectChapterDTO> subList() {
		logger.info("과목단원별 문제갯수 서비스 요청");
		return dao.subList();
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
		SubjectChapterDTO chapdto = null;
		logger.info(sc_idx+" 번 과목단원 상세보기 서비스 요청");
		chapdto = dao.subChapRevice(sc_idx);
		logger.info("content : "+chapdto.getSc_name());
		return chapdto;
	}


	

	
	


	


}
