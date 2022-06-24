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
import com.fullstack.cbt.dto.SubjectChapterDTO;
import com.fullstack.cbt.dto.SubjectDTO;
import com.fullstack.cbt.service.ProblemService;

@Controller
public class ProblemController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ProblemService service;
	
	@RequestMapping(value = "/problem.go", method = RequestMethod.GET)
	public String problemgo(Model model) {
		
		logger.info("등록된 과목 가져오기");
		ArrayList<SubjectDTO> subjectList = service.subjectList();
		
		if(subjectList.size() > 0) {
			logger.info("등록된 과목 : "+subjectList);
			model.addAttribute("subjectList", subjectList);
		}
		
		return "adminProblemWrite"; 
	}
	
	@RequestMapping("/subjectChapList.ajax")
	@ResponseBody
	public HashMap<String, Object> subjectChapterList(Model model, @RequestParam String subject) {
		
		logger.info("과목 단원 리스트 요청:"+subject);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<SubjectChapterDTO> subjectChapList = service.subjectChapList(subject);				
		
		if(subjectChapList.size() > 0) {
			logger.info("등록된 과목 단원"+subjectChapList);
			map.put("subjectChapList", subjectChapList);
		}
		
		return map;
	}
	
	@RequestMapping(value = "/problemWrite.do")
	public String problemWrite(Model model,
			@RequestParam HashMap<String, Object> params
			) {
		logger.info("문제 등록 요청");
		logger.info("param: {}", params);
		
		// 220623 mb_id 를 loginId 로 params 에 덧붙여 넘기는 로직 해보기
		
		
		service.problemWrite(params);
		return "adminProblemList"; 
	}
	
	@RequestMapping("/problemList.go")
	public String problemListgo(Model model) {
		
		logger.info("문제 리스트 이동");
		
		return "adminProblemList"; 
	}
	
	//문제 리스트 작업 중
	@RequestMapping(value = "/problemList.do", method = RequestMethod.GET)
	public String problemListdo(Model model) {
		
		logger.info("문제 리스트 요청");
		ArrayList<SubjectDTO> subjectList = service.subjectList();
		
		if(subjectList.size() > 0) {
			logger.info("등록된 과목 : "+subjectList);
			model.addAttribute("subjectList", subjectList);
		}
		
		return "adminProblemWrite"; 
	}
	
	
	
	
	
	@RequestMapping("/problemList.ajax")
	@ResponseBody
	public HashMap<String, Object> problemList(Model model) {
		
		logger.info("문제 리스트 요청");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<ProblemDTO> problemList = service.problemList();
		map.put("problemList", problemList);
		
		return map;
	}
	
	
	
	
}
