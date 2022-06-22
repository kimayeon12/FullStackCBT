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
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		return "teststart";
	}
	
	@RequestMapping(value = "/test.do", method = RequestMethod.GET)
	public String test(Model model, @RequestParam String selectbox) {
		logger.info("선택된 과목 : " + selectbox);
		return "teststart"; //시험보는 페이지로 
	}
}
