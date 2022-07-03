package com.fullstack.cbt.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fullstack.cbt.dto.PageMakerDTO;
import com.fullstack.cbt.dto.ProblemDTO;
import com.fullstack.cbt.dto.SubjectDTO;
import com.fullstack.cbt.service.ProblemSaveService;

@Controller
public class ProblemSaveController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ProblemSaveService service;
	
		//문제보관함 페이지 이동 
		@RequestMapping(value = "/problemSave.do")
		public String cbtTestDetail(Model model, HttpSession session, @RequestParam HashMap<String,String> params) {
			
			String loginId = (String) session.getAttribute("loginId");
			String page = "problemSave";
			
			
			if(loginId != null) {
				//사용자가 보관한 문제의 과목리스트 가져오기 
				ArrayList<SubjectDTO> subjectList =service.subjectList(loginId); 
				logger.info("사용자가 보관한 문제의 과목 가져오기 : " + subjectList.size());
				if(subjectList.size()>0) {
					model.addAttribute("subjectList", subjectList);
				}
				
				// 사용자가 보관한 문제 가져오기 
				int pageNum =1;
				if(params.get("pageNum") != null) {
					pageNum = (int) Integer.parseInt(String.valueOf(params.get("pageNum")));
				}
				logger.info("페이지 번호 : " + pageNum);
				int skip = (pageNum -1) * 10;
			
				ArrayList<ProblemDTO> problemSaveList = service.problemSaveList(loginId,skip); 
				model.addAttribute("saveList", problemSaveList);
				
				int total = service.getTotal(loginId);
				logger.info("전체 게시글 수 : " + total);
				model.addAttribute("listCnt", total);
				
				PageMakerDTO pageMake = new PageMakerDTO(pageNum, total);
				model.addAttribute("pageMaker", pageMake);
			
			}else{
				model.addAttribute("msg", "로그인 후 이용해 주세요.");
				page = "login";
				
			}
			
			return page;
		}
		
		
		
		//선택된 리스트에 따라 문제 보여주기 
		@RequestMapping(value = "/problemSaveList.do")
		public String roblemSaveList(Model model, HttpSession session, @RequestParam String su_idx, String[] chkArr, int pageNum) {
			
			String loginId = (String) session.getAttribute("loginId");
			String page = "problemSave";
			
			if(loginId != null) {
				// 체크 박스 - 가져온 문제 고유 번호 확인 
				logger.info("체크박스 : " + chkArr); //체크박스가 1개도 안들어왔을 때 null 로 나옴  
				if(chkArr != null) {
					for (int i = 0; i < chkArr.length; i++) {
						logger.info("선택한 문제 번호 : " + chkArr[i]);
					}
					
					boolean success =  service.problemSaveDel(chkArr);
					logger.info("삭제 성공 여부 : " + success);
				}
				
				
				
				//사용자가 보관한 문제 과목리스트 가져오기 
				ArrayList<SubjectDTO> subjectList =service.subjectList(loginId); 
				logger.info("사용자가 보관한 문제의 과목 가져오기 : " + subjectList.size());
				if(subjectList.size()>0) {
					model.addAttribute("subjectList", subjectList);
				}
				
				
				
				// 과목 선택에 따라 사용자가 보관한 문제 가져오기 
				logger.info("선택한 과목 고유번호 : " + su_idx);
				logger.info("페이지 번호 : " + pageNum);
				//값 고정 
				model.addAttribute("su_idx", su_idx);
				
				//선택한 값에 따른 리스트 가져오기 
				int skip = (pageNum -1) * 10;
				ArrayList<ProblemDTO> selectedSaveList = service.selectedSaveList(loginId,su_idx,skip);
				model.addAttribute("saveList", selectedSaveList);
				//logger.info("보관한 문제 수 : " + selectedSaveList.size());
				//if(selectedSaveList.size()>0) {
					//model.addAttribute("saveList", selectedSaveList);
				//}
				int selectedTotal = service.selectedTotal(loginId,su_idx);
				model.addAttribute("listCnt", selectedTotal);
				PageMakerDTO pageMake2 = new PageMakerDTO(pageNum, selectedTotal);
				model.addAttribute("pageMaker", pageMake2);
				
			}else {
				model.addAttribute("msg", "로그인 후 이용해 주세요.");
				page = "login";
			}
			
			
			return page;
		}
		
}
