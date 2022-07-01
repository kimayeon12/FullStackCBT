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
import com.fullstack.cbt.service.ObjectionService;

@Controller
public class ObjectionController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ObjectionService service;
	
	//이의제기 페이지
	@RequestMapping(value = "/objection.do")
	public String cbtTestDetail(Model model,@RequestParam String pc_idx, String tt_idx) {
		logger.info("이의제기할 문제 고유번호 : " + pc_idx);
		logger.info("시험 고유번호 : " + tt_idx);
		
		model.addAttribute("tt_idx", tt_idx);
		
		ProblemDTO problemDto = service.problemDto(pc_idx);
		if(problemDto != null) {
			model.addAttribute("problemdto", problemDto);
		}
		
		return "objection";
	}
	
	
	
	//이의제기 내용 제출 
	@RequestMapping(value = "/objectionInsert.do")
	public String objectionInsert(Model model,HttpSession session,@RequestParam String content, String pc_idx, String tt_idx) {
		logger.info("이의제기 내용 및 문제 고유번호 :" +content + pc_idx);
		logger.info("시험 고유번호 : " + tt_idx);
			
		String loginId = (String) session.getAttribute("loginId");
		boolean success = service.objectionInsert(content,pc_idx,loginId);
		String page ="";
		if(success) {
			logger.info("이의제기 내용 제출 완료");
			page = "redirect:/myTestView.do?tt_idx="+tt_idx;
		} 
		return page; 	
	 }
	
	
	
	
	
	
	//이의제기 관리 리스트 + 페이징
	@RequestMapping(value = "/objectionList.do", method = RequestMethod.GET)
	public String objectionList(Model model, Criteria cri) {
		
		logger.info("이의제기 관리 리스트 요청");
		ArrayList<ObjectionDTO> objectionList = service.objectionList();
		if(objectionList.size() > 0) {
			logger.info("list size : "+objectionList.size());
			model.addAttribute("objectionList", objectionList);
		}
		
		//페이징 부분**************************
		model.addAttribute("objectionList", service.getListPaging(cri));
		int total = service.getTotal(cri);
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		model.addAttribute("pageMaker", pageMake);
		
		return "adminObjectionList";
	}
	
	
	//이의제기 셀렉트 리스트 + 페이징
	@RequestMapping(value = "/objectionSelectList.do")
	public String objectionSelectList(Model model, @RequestParam String oj_status, String oj_searchOption
			, String keyword, Criteria cri) {
		
		logger.info("이의제기 셀렉트 리스트 요청 :"+oj_status+oj_searchOption+keyword);
		model.addAttribute("oj_status", oj_status);
		model.addAttribute("oj_searchOption", oj_searchOption);
		model.addAttribute("keyword", keyword);
		
		//등록된 이의제기 전체 리스트, 처리상태를 선택 시 전체리스트를 보여주자
		ArrayList<ObjectionDTO> objectionList = service.objectionList();
		if(oj_status == "") {
			model.addAttribute("objectionList", objectionList);
		}
		
		ArrayList<ObjectionDTO> objectionSelectList = service.objectionSelectList(oj_status,oj_searchOption,keyword);
		if(objectionSelectList.size() > 0) {
			logger.info("list size : "+objectionSelectList.size());
			model.addAttribute("objectionList", objectionSelectList);
		}
		
		
		
		return "adminObjectionList";
	}
	
	
	
	//여기부터 최상인이 함!
	
	@RequestMapping(value = "/adminObjectionDetail.go")
	public String objectionDetailGo() {
		logger.info("이의제기 상세 페이지 이동요청");
		return "adminObjectionDetail";
	}
	
	
	@RequestMapping(value = "/adminObjectionDetail.do")
	public String objectionDetailDo(Model model, HttpSession session, @RequestParam String oj_idx) {
		
		String page = "adminObjectionDetail";
		logger.info("이의제기 상세보기 페이지 요청"+oj_idx);
		ObjectionDTO objectionDetail = service.objectionDetail(oj_idx);
		if(objectionDetail != null) {
			model.addAttribute("objectionDetail",objectionDetail);
			page = "adminobjectionDetail";
		}
		return page;
	}
	
	
	
	
	
}
