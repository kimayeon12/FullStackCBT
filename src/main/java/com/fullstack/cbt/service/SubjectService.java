package com.fullstack.cbt.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fullstack.cbt.dao.SubjectDAO;
import com.fullstack.cbt.dto.SubjectDTO;

@Service
public class SubjectService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SubjectDAO dao;
	public String reg(String subject, int chk) {
		logger.info("서비스 도착");
		String msg = "과목 등록에 실패 했습니다.";
		
		if(dao.reg(subject,chk)>0) {
			msg = "과목 등록에 성공 하였습니다.";
		}
		return msg;
	}
	
	public ArrayList<SubjectDTO> list() {
		logger.info("리스트 서비스 요청");
		return dao.list();
	}

	public HashMap<String, Object> overlay(String chkSub) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String overSub = dao.overlay(chkSub);
		logger.info("중복 과목명이 있나?"+overSub);
		boolean over = overSub == null? false : true;
		map.put("overlay",over);
		return map;
	}

}
