package com.fullstack.cbt.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fullstack.cbt.dto.ProblemDTO;
import com.fullstack.cbt.service.ObjectionService;

@Controller
public class ObjectionController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ObjectionService service;
	
	//이의제기 페이지
	@RequestMapping(value = "/objection.do")
	public String cbtTestDetail(Model model,@RequestParam String pc_idx, String tt_idx) {
		logger.info("이의제기할 문제 고유번호 : " + pc_idx);
		logger.info("시험 고유번호 : " + tt_idx);
		
		model.addAttribute("tt_idx", tt_idx);
		
		ProblemDTO problemDto = service.problemDto(pc_idx);
		if(problemDto != null) {
			model.addAttribute("problemdto", problemDto);
		}
		
		return "objection";
	}
	
	
	
	//이의제기 내용 제출 
	@RequestMapping(value = "/objectionInsert.do")
	public String objectionInsert(Model model,HttpSession session,@RequestParam String content, String pc_idx, String tt_idx) {
		logger.info("이의제기 내용 및 문제 고유번호 :" +content + pc_idx);
		logger.info("시험 고유번호 : " + tt_idx);
			
		String loginId = (String) session.getAttribute("loginId");
		boolean success = service.objectionInsert(content,pc_idx,loginId);
		String page ="";
		if(success) {
			logger.info("이의제기 내용 제출 완료");
			page = "redirect:/myTestView.do?tt_idx="+tt_idx;
		} 
		return page; 	
	 }
	
}
