package com.fullstack.cbt.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fullstack.cbt.dto.ProblemDTO;
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

			//사용자가 보관한 문제의 과목리스트 가져오기 
			ArrayList<SubjectDTO> subjectList =service.subjectList(loginId); 
			logger.info("사용자가 보관한 문제의 과목 가져오기 : " + subjectList.size());
			if(subjectList.size()>0) {
				model.addAttribute("subjectList", subjectList);
			}
			
			// 사용자가 보관한 문제 가져오기 
			ArrayList<ProblemDTO> problemSaveList = service.problemSaveList(loginId);
			logger.info("보관한 문제 수 : " +  problemSaveList.size());
			if(problemSaveList.size()>0) {
				model.addAttribute("saveList", problemSaveList);
			}
			
			return "problemSave";
		}
		
		
		
		//선택된 리스트에 따라 문제 보여주기 
		@RequestMapping(value = "/problemSaveList.do")
		public String roblemSaveList(Model model, HttpSession session, @RequestParam String su_idx, String[] chkArr) {
			
			String loginId = (String) session.getAttribute("loginId");

			
			// 체크 박스 - 가져온 문제 고유 번호 확인 
			logger.info("체크박스 : " + chkArr); //체크박스가 1개도 안들어왔을 때 null 로 나옴  
			if(chkArr != null) {
				for (int i = 0; i < chkArr.length; i++) {
					logger.info("선택한 문제 번호 : " + chkArr[i]);
				}
				
				boolean success =  service.problemSaveDel(chkArr);
				logger.info("삭제 여부 : " + success);
			}
			
			
			
			//사용자가 보관한 문제 과목리스트 가져오기 
			ArrayList<SubjectDTO> subjectList =service.subjectList(loginId); 
			logger.info("사용자가 보관한 문제의 과목 가져오기 : " + subjectList.size());
			if(subjectList.size()>0) {
				model.addAttribute("subjectList", subjectList);
			}
			
			
			
			// 과목 선택에 따라 사용자가 보관한 문제 가져오기 
			logger.info("선택한 과목 고유번호 : " + su_idx);
			//값 고정 
			model.addAttribute("su_idx", su_idx);
			
			//선택한 값에 따른 리스트 가져오기 
			ArrayList<ProblemDTO> selectedSaveList = service.selectedSaveList(loginId,su_idx);
			logger.info("보관한 문제 수 : " + selectedSaveList.size());
			if(selectedSaveList.size()>0) {
				model.addAttribute("saveList", selectedSaveList);
			}
			
			
			return "problemSave";
		}
		
}
