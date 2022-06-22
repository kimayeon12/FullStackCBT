package com.fullstack.cbt.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fullstack.cbt.service.SubjectService;

@Controller
public class SubjectController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SubjectService service;
	
	@RequestMapping(value = "/adminSubjectManagementRegister")
	public String regpage() {
		logger.info("과목 등록 페이지 이동요청");
		return "adminSubjectManagementRegister";
	}
	
	@RequestMapping(value = "/adminSubjectManagement")
	public String list() {
		logger.info("과목 리스트 관리 페이지 이동요청");
		return "adminSubjectManagement";
	}
	
	@RequestMapping(value = "/registerReg", method = RequestMethod.POST)
	public String reg(Model model,  @RequestParam String subject, String check) {
		logger.info("과목 등록 요청");
		
		
		
		logger.info("등록할 과목명 : "+subject+",노출여부 : "+check);
		
		String msg = service.reg(subject,check);
		logger.info(msg);
		model.addAttribute("msg",msg);
		return "adminSubjectManagement";
	}
	
	
}
