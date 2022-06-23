package com.fullstack.cbt.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fullstack.cbt.service.TestService;

@Controller
public class TestController {

	Logger logger = LoggerFactory.getLogger(this.getClass());

@Autowired TestService service;
	
	@RequestMapping(value = "/testStart.do", method = RequestMethod.GET)
	public String testStart(Model model) {
		
		logger.info("등록된 과목 가져오기");
		 ArrayList<String> subjectList =service.subjectList(); //arraylist 로 가져와보자
		  
		
		  if(subjectList.size() > 0) {
			  logger.info("등록된 과목 :" +subjectList);
			  model.addAttribute("subjectList", subjectList);
		  }
		  
		  return "testStart"; 
	}	
	
	@RequestMapping(value = "/test.do", method = RequestMethod.POST)
	public String test(Model model, @RequestParam String subjectSelect) {
		logger.info("과목 선택하기");
		logger.info("선택한 과목 : " + subjectSelect);
		return "test"; 
	}	
	
}
