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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fullstack.cbt.dto.PageMakerDTO;
import com.fullstack.cbt.dto.ProblemDTO;
import com.fullstack.cbt.dto.SubjectDTO;
import com.fullstack.cbt.dto.TestDTO;
import com.fullstack.cbt.service.CbtService;

@Controller
public class CbtController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired CbtService service;
	
	//시험관리 리스트 페이지 
	@RequestMapping(value = "/cbtList.do", method = RequestMethod.GET)
	public String cbtList(Model model, HttpSession session,Criteria cri) {
		
		String page ="login";
		logger.info("관리자 로그인 ? : " + session.getAttribute("isAdmin"));
		String adminId = (String) session.getAttribute("isAdmin");
		
		
		if(adminId != null) {
			//select 과목명 가져오기
			ArrayList<SubjectDTO> subjectList =service.subjectList(); 
			logger.info("등록된 과목 가져오기 : " + subjectList.size());
			if(subjectList.size()>0) {
				model.addAttribute("subjectList", subjectList);
			} 
			
			//페이징 처리하여 리스트 불러오기 
			ArrayList<TestDTO> testdto = service.getListPaging(cri);
			model.addAttribute("testdto", testdto);
			
			int total = service.getTotal();
			logger.info("전체 게시글 수 : " + total);
			model.addAttribute("listCnt", total); // 게시글 수 표시 
			
			PageMakerDTO pageMake = new PageMakerDTO(cri, total);
			model.addAttribute("pageMaker", pageMake);
			page = "adminTestList";
		}else {
			model.addAttribute("msg","관리자 계정 로그인이 필요한 서비스입니다.");
		}
		
		
			
			return page; 
	}	
	
	
	//페이징 버전 
	//선택한 값에 따른 리스트 가져오기 
		@RequestMapping(value = "/cbtFormList.do")
		public String cbtForm(Model model,HttpSession session,Criteria cri,@RequestParam String su_idx, String tt_status, String mb_id, int pageNum) {
			
				String page ="login";
				logger.info("관리자 로그인 ? : " + session.getAttribute("isAdmin"));
				String adminId = (String) session.getAttribute("isAdmin");
			
				if(adminId != null) {
					
					//과목명 셀렉트박스 불러오기
					ArrayList<SubjectDTO> subjectList =service.subjectList(); 
					logger.info("등록된 과목 가져오기 : " + subjectList.size());
					
					if(subjectList.size()>0) {
						model.addAttribute("subjectList", subjectList);
					} 
					
					
					logger.info("과목번호 : " + su_idx);
					logger.info("제출상태 : " + tt_status);
					logger.info("아이디 : " + mb_id);
					logger.info("pageNum :" + pageNum);
					
					// 사용자가 선택 후 값을 고정해주기 위해 model에 저장 
					model.addAttribute("idx", su_idx);
					model.addAttribute("status", tt_status);
					model.addAttribute("id", mb_id);
					
					
					//선택된 값에 따라 리스트 블러오기 
					int skip = (pageNum -1) * 10;
					ArrayList<TestDTO> testdto = service.selectedListPaging(su_idx,tt_status,mb_id,skip);
					model.addAttribute("testdto", testdto);
					
					
					int selectedTotal = service.selectedTotal(su_idx,tt_status,mb_id);
					model.addAttribute("listCnt", selectedTotal);
					logger.info("선택된 게시글 수 : " + selectedTotal);
					
					//생성자 (int pageNum, int total)
					PageMakerDTO pageMake2 = new PageMakerDTO(pageNum, selectedTotal);
					model.addAttribute("pageMaker", pageMake2);
					
					page = "adminTestList";
					
				}else{
					model.addAttribute("msg","관리자 계정 로그인이 필요한 서비스입니다.");
				}
			
			
			
			
			return page;
		}
	
	
	
	
	
		//상세보기 
		@RequestMapping(value = "/cbtTestDetail.do")
		public String cbtTestDetail(Model model, HttpSession session,@RequestParam String tt_idx) {
				
				String page ="login";
				logger.info("관리자 로그인 ? : " + session.getAttribute("isAdmin"));
				String adminId = (String) session.getAttribute("isAdmin");
			
				if(adminId != null) {
					
					logger.info("시험 고유번호 : " +tt_idx);
					//시험고유번호가 #인 과목명, 회차, 시험시작일자,제출일자, 점수, 상태 
					TestDTO testInfo = service.testInfo(tt_idx);
					if(testInfo != null) {
						model.addAttribute("testInfo", testInfo);
					}
					
					//시험고유번호가 #인 문제출제고유번호, 문제1~10, 사용자답안1~10, 정답오답여부10개 , 문제출제 고유번호에 따른 정답(10개)과 각 사지선다 문항(10)
					ArrayList<ProblemDTO> testDetail = service.testDetail(tt_idx); 
					logger.info("데이터 개수 : " + testDetail.size());
					if(testDetail.size()>0) {
						model.addAttribute("testDetail", testDetail);
					}
					page = "adminTestDetail";
					
				}else {
					model.addAttribute("msg","관리자 계정 로그인이 필요한 서비스입니다.");
				}
				
			
			
			return page;
		}
	
}
