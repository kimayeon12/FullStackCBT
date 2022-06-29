package com.fullstack.cbt.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fullstack.cbt.dto.SubjectDTO;
import com.fullstack.cbt.service.ProblemSaveService;

@Controller
public class ProblemSaveController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ProblemSaveService service;
	
	//문제보관함 페이지 이동 
	@RequestMapping(value = "/problemSave.do")
	public String cbtTestDetail(Model model, HttpSession session) {
			
		String loginId = (String) session.getAttribute("loginId");

		ArrayList<SubjectDTO> subjectList =service.subjectList(loginId); 
		logger.info("사용자가 보관한 문제의 과목 가져오기 : " + subjectList.size());
		if(subjectList.size()>0) {
			model.addAttribute("subjectList", subjectList);
		}
		return "problemSave";
	}
}
