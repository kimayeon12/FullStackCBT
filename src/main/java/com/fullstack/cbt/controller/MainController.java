package com.fullstack.cbt.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fullstack.cbt.dto.TestDTO;
import com.fullstack.cbt.service.MainService;

@Controller
public class MainController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MainService service;
	
	@RequestMapping(value = "/")
	public String home() {
		return "login";
	}
	
	@RequestMapping(value = "/main.go")
	public String main() {
		return "main";
	}
	
	@RequestMapping(value = "/adminMain.do")
	public String adminMain(Model model) {
		ArrayList<TestDTO> cbtTest = service.cbtTestList();
		model.addAttribute("cbtTest", cbtTest);
		
		if(cbtTest.size() > 0) {
			model.addAttribute("totalCbtTest", cbtTest.size());
		}
//		/*
//		 문제
//		 회원아이디
//		 이의제기 일자
//		 처리상태
//		 */
//		ArrayList<ObjectionDTO> objection = service.objectionList();
//		model.addAttribute("objection", objection);
//		
//		/*
//		 제목
//		 아이디
//		 등록일자
//		 답변상태
//		 */
//		ArrayList<InquiryDTO> inquiry = service.inquiryList();
//		model.addAttribute("inquiry", inquiry);
		
		return "adminMain";
	}
	
}
