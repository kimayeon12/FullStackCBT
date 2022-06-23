package com.fullstack.cbt.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fullstack.cbt.dto.ProblemDTO;
import com.fullstack.cbt.service.ProblemService;

@Controller
public class ProblemController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ProblemService service;
	
	@RequestMapping(value = "/problem.go", method = RequestMethod.GET)
	public String problemgo(Model model) {
		
		logger.info("등록된 과목 가져오기");
		ArrayList<ProblemDTO> subjectList = service.subjectList();
		
		if(subjectList.size() > 0) {
			logger.info("등록된 과목 : "+subjectList);
			model.addAttribute("subjectList", subjectList);
		}
		
		return "adminProblemWrite"; 
	}
	
	@RequestMapping(value = "/subjectChapList.ajax", method = RequestMethod.GET)
	@ResponseBody
	public String subjectChapterList(Model model, @RequestParam String subject) {
		
		logger.info("과목 단원 리스트 요청:"+subject);
		
		ArrayList<String> subjectChapList = service.subjectChapList(subject);				
		
		if(subjectChapList.size() > 0) {
			logger.info("등록된 과목 단원"+subjectChapList);
		}
		
		return "";
	}
	
	
	
	
	
}
