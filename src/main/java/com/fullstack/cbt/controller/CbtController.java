package com.fullstack.cbt.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fullstack.cbt.dto.SubjectDTO;
import com.fullstack.cbt.dto.TestDTO;
import com.fullstack.cbt.service.CbtService;

@Controller
public class CbtController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired CbtService service;
	
	//시험관리 리스트 페이지 
	@RequestMapping(value = "/cbtList.do", method = RequestMethod.GET)
	public String cbtList(Model model) {
		
		//select 과목명 가져오기
		ArrayList<SubjectDTO> subjectList =service.subjectList(); 
		logger.info("등록된 과목 가져오기 : " + subjectList.size());
		
		if(subjectList.size()>0) {
			model.addAttribute("subjectList", subjectList);
		} 
		
		
		//뷰 전체에 시험리스트 뿌려줌 
		ArrayList<TestDTO> testdto = service.testlist();
		logger.info("시험 리스트 가져오기 : " + testdto.size());

			if(testdto.size()>0) {
				model.addAttribute("testdto", testdto);
				model.addAttribute("listCnt", testdto.size());
			} 
		
		 return "adminTestList"; 
	}	
}
