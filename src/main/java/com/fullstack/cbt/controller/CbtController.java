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
		model.addAttribute("listCnt", testdto.size());

			if(testdto.size()>0) {
				model.addAttribute("testdto", testdto);
			} 
		
		 return "adminTestList"; 
	}	
	
	
	
	
	//선택한 값에 따른 리스트 가져오기 
	@RequestMapping(value = "/cbtFormList.do")
	public String cbtForm(Model model, @RequestParam String su_idx, String tt_status, String mb_id) {
		
		
		//이게 없으면 과목명 안나옴
		ArrayList<SubjectDTO> subjectList =service.subjectList(); 
		logger.info("등록된 과목 가져오기 : " + subjectList.size());
				
		if(subjectList.size()>0) {
			model.addAttribute("subjectList", subjectList);
		} 
		
					
		logger.info("과목번호 : " + su_idx);
		logger.info("제출상태 : " + tt_status);
		logger.info("아이디 : " + mb_id);
		
		
		// 사용자가 선택 후 값을 고정해주기 위해 model에 저장 
		model.addAttribute("idx", su_idx);
		model.addAttribute("status", tt_status);
		model.addAttribute("id", mb_id);
		
		ArrayList<TestDTO> practiceList = service.selectedList(su_idx,tt_status,mb_id);
		logger.info("선택된 리스트 수 : "  + practiceList.size());
		model.addAttribute("listCnt", practiceList.size());
		
		if(practiceList.size()>0) {
			model.addAttribute("testdto", practiceList);
		}

		return "adminTestList";
	}
	
	
}
