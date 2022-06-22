package com.fullstack.cbt.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TestController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/testStart.go", method = RequestMethod.GET)
	public String testStart() {
		//logger.info("선택된 과목 : " + subjectSelect);
		return "testStart"; //시험보는 페이지로 
	}
}
