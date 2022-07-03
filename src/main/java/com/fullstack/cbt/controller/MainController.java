package com.fullstack.cbt.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fullstack.cbt.dto.InquiryDTO;
import com.fullstack.cbt.dto.ObjectionDTO;
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
	public String main(Model model, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		String page = "login";
		
		if(loginId != null) {
			page = "main";
		} else {
			model.addAttribute("msg", "로그인 후 이용해 주세요.");
		}
		
		return page;
	}
	
	@RequestMapping(value = "/adminMain.do")
	public String adminMain(Model model, HttpSession session) {
		if(session.getAttribute("isAdmin") != null) {
			ArrayList<TestDTO> cbtTest = service.cbtTestList();
			model.addAttribute("cbtTest", cbtTest);
			
			if(cbtTest.size() > 0) {
				model.addAttribute("totalCbtTest", cbtTest.size());
			}
			
			ArrayList<ObjectionDTO> objection = service.objectionList();
			model.addAttribute("objection", objection);
			
			if(objection.size() > 0) {
				model.addAttribute("totalObjection", objection.size());
			}
			
			ArrayList<InquiryDTO> inquiry = service.inquiryList();
			model.addAttribute("inquiry", inquiry);
	
			if(inquiry.size() > 0) {
				model.addAttribute("totalInquiry", inquiry.size());
			}
		} else {
			model.addAttribute("msg", "관리자 권한만 접근 가능합니다.");
			
			return "login";
		}
		
		return "adminMain";
	}
	
}
