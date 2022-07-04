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

import com.fullstack.cbt.dto.ObjectionDTO;
import com.fullstack.cbt.dto.PageMakerDTO;
import com.fullstack.cbt.dto.ProblemDTO;
import com.fullstack.cbt.dto.TestDTO;
import com.fullstack.cbt.service.ObjectionService;

@Controller
public class ObjectionController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ObjectionService service;
	
	//이의제기 페이지
	@RequestMapping(value = "/objection.do")
	public String cbtTestDetail(Model model,HttpSession session,@RequestParam String pc_idx, String tt_idx) {
		logger.info("이의제기할 문제 고유번호 : " + pc_idx);
		logger.info("시험 고유번호 : " + tt_idx);
		String loginId = (String) session.getAttribute("loginId");
		String page = "objection";
		
		if(loginId != null) {
			model.addAttribute("tt_idx", tt_idx);
			ProblemDTO problemDto = service.problemDto(pc_idx);
			if(problemDto != null) {
				model.addAttribute("problemdto", problemDto);
			}
		}else{
			model.addAttribute("msg", "로그인 후 이용해 주세요.");
			page = "login";
		}
		
		return page;
	}
	
	
	
	//이의제기 내용 제출 
	@RequestMapping(value = "/objectionInsert.do")
	public String objectionInsert(Model model,HttpSession session,@RequestParam String content, String pc_idx, String tt_idx) {
		logger.info("이의제기 내용 및 문제 고유번호 :" +content + pc_idx);
		logger.info("시험 고유번호 : " + tt_idx);
		String loginId = (String) session.getAttribute("loginId");
		
		String page ="login";
		if(loginId != null) {
			boolean success = service.objectionInsert(content,pc_idx,loginId);
			if(success) {
				logger.info("이의제기 내용 제출 완료");
				page = "redirect:/myTestView.do?tt_idx="+tt_idx;
			} 
		}else {
			model.addAttribute("msg", "로그인 후 이용해 주세요.");
		}
		
		return page; 	
	 }
	
	
	
	
	
	
	//이의제기 관리 리스트 + 페이징
	@RequestMapping(value = "/objectionList.do", method = RequestMethod.GET)
	public String objectionList(Model model, Criteria cri, HttpSession session) {
		
		
		String page ="login";
		logger.info("관리자 로그인 ? : " + session.getAttribute("isAdmin"));
		String adminId = (String) session.getAttribute("isAdmin");
		
		
		if(adminId != null) {
			logger.info("이의제기 관리 리스트 요청");
			ArrayList<ObjectionDTO> objectionList = service.objectionList();
			if(objectionList.size() > 0) {
				logger.info("list size : "+objectionList.size());
				model.addAttribute("objectionList", objectionList);
			}			
			/***************** 페이징 부분 *****************/
			ArrayList<ObjectionDTO> objectionListpaging = service.getListPaging(cri);
			model.addAttribute("objectionList", objectionListpaging);
			int pageNum=cri.getPageNum();//게시판 1번 부터 번호정렬 
			model.addAttribute("pageNum",pageNum);//게시판 1번 부터 번호정렬
			
			
			int total = service.getTotal();
			logger.info("전체 게시글 수 : " + total);
			model.addAttribute("listCnt", total);
			
			PageMakerDTO pageMake = new PageMakerDTO(cri, total);
			model.addAttribute("pageMaker", pageMake);			
			
			page = "adminObjectionList";
		}else {
			model.addAttribute("msg", "관리자 계정 로그인이 필요한 서비스 입니다.");
		}
		
		return page;
	
	}
	
	
	
	
	
	//이의제기 셀렉트 리스트 + 페이징
	@RequestMapping(value = "/objectionSelectList.do")
	public String objectionSelectList(Model model, HttpSession session, Criteria cri, @RequestParam String oj_status, String pc_problem
			, int pageNum) {
		
		/*등록된 이의제기 전체 리스트, 처리상태를 선택 시 전체리스트를 보여주자
		ArrayList<ObjectionDTO> objectionList = service.objectionList();
		if(oj_status == "") {
			model.addAttribute("objectionList", objectionList);
		}*/
		/*
		ArrayList<ObjectionDTO> objectionSelectList = service.objectionSelectList(oj_status,pc_problem);
		if(objectionSelectList.size() > 0) {
			logger.info("list size : "+objectionSelectList.size());
			model.addAttribute("objectionList", objectionSelectList);
		}*/
		
		String page ="login";
		logger.info("관리자 로그인 ? : " + session.getAttribute("isAdmin"));
		String adminId = (String) session.getAttribute("isAdmin");
		
		if(adminId != null) {
			
			logger.info("이의제기 셀렉트 리스트 요청 :"+oj_status+pc_problem);
			model.addAttribute("oj_status", oj_status);
			model.addAttribute("pc_problem", pc_problem);
			
			/***************** 페이징 부분 *****************/
			int skip = (pageNum -1) * 10;
			ArrayList<ObjectionDTO> objectionSelectListPaging = service.selectedListPaging(oj_status,pc_problem,skip);
			model.addAttribute("objectionList", objectionSelectListPaging);
			int pageNum1=cri.getPageNum();//게시판 1번 부터 번호정렬 
			model.addAttribute("pageNum",pageNum1);//게시판 1번 부터 번호정렬
			
			
			int selectedTotal = service.selectedTotal(oj_status,pc_problem);
			model.addAttribute("listCnt", selectedTotal);
			logger.info("선택된 게시글 수 : " + selectedTotal);
			
			//생성자 (int pageNum, int total)
			PageMakerDTO pageMake2 = new PageMakerDTO(pageNum, selectedTotal);
			model.addAttribute("pageMaker", pageMake2);					
		
			page = "adminObjectionList";
		}else {
			model.addAttribute("msg","관리자 계정 로그인이 필요한 서비스입니다.");
		}
		
		
		return page;
	}
	
	
	
	
	
	// *************** 이의제기 수정 상세보기 *************** 
	
	@RequestMapping(value = "/adminObjectionDetail.go")
	public String objectionDetailGo(Model model, HttpSession session, @RequestParam String oj_idx) {
		
		String page ="login";
		logger.info("관리자 로그인 ? : " + session.getAttribute("isAdmin"));
		String adminId = (String) session.getAttribute("isAdmin");
		
		if(adminId != null) {

			logger.info("이의제기 상세 페이지 이동요청 : "+oj_idx);
			ObjectionDTO objectionDetail = service.objectionDetail(oj_idx);
			logger.info("objection : "+objectionDetail.getOj_content());
			logger.info("objection : "+objectionDetail.getPc_problem());
			
			model.addAttribute("objectionDetail", objectionDetail);
			
			
			page = "adminObjectionDetail";
			
		}else {
			model.addAttribute("msg","관리자 계정 로그인이 필요한 서비스입니다.");
		}
		
		return page;
		
		/*처리상태 옵션 가져오기
		logger.info("처리상태 가져오기");
		ArrayList<ObjectionDTO> statusList = service.status();
		
		if(statusList.size() > 0) {
			logger.info("처리상태 리스트:"+statusList);
			model.addAttribute("statusList", statusList);
		}
		*/
	}
	
	//이의제기 저장하기
	@RequestMapping(value = "/objectionUpdate.do")
	public String objectionUpdate(Model model,HttpSession session, @RequestParam HashMap<String, Object> params) {
		
		
		String page ="login";
		logger.info("관리자 로그인 ? : " + session.getAttribute("isAdmin"));
		String adminId = (String) session.getAttribute("isAdmin");
		
		if(adminId != null) {
			logger.info("이의제기 저장 요청");
			//로그인 아이디
			String loginId = (String) session.getAttribute("loginId");
			params.put("oj_admin_id",  loginId);
			model.addAttribute("loginId", loginId);
			
			logger.info("params: {}", params);
			service.objectionUpdate(params);			
		
			page = "redirect:/adminObjectionDetail.go?oj_idx="+params.get("oj_idx");
		}else {
			model.addAttribute("msg","관리자 계정 로그인이 필요한 서비스입니다.");		
		}
		
		return page;
	}
	
	
	
	
	
	
	
}
