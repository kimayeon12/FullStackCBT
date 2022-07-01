package com.fullstack.cbt.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.RequestMappingInfoHandlerMethodMappingNamingStrategy;

import com.fullstack.cbt.dto.InquiryDTO;
import com.fullstack.cbt.dto.PageMakerDTO;
import com.fullstack.cbt.dto.ProblemDTO;
import com.fullstack.cbt.service.InquiryService;




@Controller
public class InquiryController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired InquiryService service;
	
	

	
	
	// 1대1 게시판 리스트 
	@RequestMapping(value = "/inquiryList.go",method = RequestMethod.GET)
	public String list(Model model,HttpSession session) {
		
		if(session.getAttribute("loginId")!=null) {
		logger.info(" 리스트 요청");
		ArrayList<InquiryDTO>inquiryList=service.inquiryList();
		
			if(inquiryList.size() > 0) {
				logger.info("list size : "+inquiryList.size());
				model.addAttribute("inquiryList", inquiryList);
				}
			}else { 
				model.addAttribute("msg","로그인을 다시해주세요");
			}
		
		return "inquiryList";
		}
	
	//1대1 게시판 글쓰기 폼이동
	@RequestMapping(value = "/inquiryWrite.go") 
	public String writeForm(Model model) {	
		logger.info("글쓰기 폼이동");
		return "inquiryWrite";
		}
		
	//1대1 게시판 글쓰기 파일업로드
	@RequestMapping(value = "/inquiryWrite.do")
	public String write(Model model, MultipartFile[] files, 
			@RequestParam HashMap<String, String> params,HttpSession session) {		
		logger.info("글쓰기 요청 : "+session+"님"+params);
		
		return service.write(files,params,session);
		}	
		
	//1대1 게시판 상세보기 	
	@RequestMapping(value = "/inquiryDetail")
	public String detail(Model model, @RequestParam String ib_idx) {
		logger.info("상세보기 요청 : "+ib_idx);
		service.inquiryDetail(model, ib_idx);
			
			
		return "inquiryDetail";
		}
	
	//1대1 게시판 수정 폼이동
	@RequestMapping(value = "/inquryUpdate.go")
	public String updateForm(Model model, @RequestParam String ib_idx) { 	
			logger.info("상세보기 요청 : "+ib_idx);
			service.inquiryDetail(model, ib_idx);
			return "inquiryUpdate";
		}
	
	//1대1 게시판 삭제
		@RequestMapping(value = "/inquiryDelete")
		public String delete(Model model, @RequestParam String ib_idx) {		
			logger.info("삭제 요청 : "+ib_idx);
			service.inquiryDelte(ib_idx);
			
			return "redirect:inquiryList.go";
		}
		
	//1대1 게시판 수정(업로드+파일삭제+글)
	@RequestMapping(value = "/inquiryUpdate.do")
	public String update(Model model, MultipartFile[] files, 
			@RequestParam HashMap<String, String> params,@RequestParam String ba_idx) {		
			logger.info("수정 요청 : "+params);
			logger.info(ba_idx);
			

			return service.update(files,params,ba_idx);
		}	
	
	//1대1 게시판 검색  
		@RequestMapping(value = "/inquirySearch",method = RequestMethod.GET)
		public String inquirySearch(Model model,@RequestParam String ib_searchOption,String ib_keyword
			,String ib_status) {			



		logger.info("상태값:"+ib_status+"/검색옵션:"+ib_searchOption+"/키워드:"+ib_keyword);


		model.addAttribute("ib_status",ib_status);
		model.addAttribute("ib_searchOption",ib_searchOption);
		model.addAttribute("ib_keyword",ib_keyword);
		
		
		ArrayList<InquiryDTO>searchList=service.searchList(ib_status,ib_searchOption,ib_keyword);
		if(searchList.size() > 0) {
			logger.info("1대1 게시판리스트 검색갯수 : "+searchList.size());
			model.addAttribute("inquiryList",searchList);
			
		}
		
		return "inquiryList";
	}
		
		
		
	//하단 관리자  
	
	
	
		
	// 관리자 1대1 게시판 리스트 
	@RequestMapping(value = "/adminInquiryList.go",method = RequestMethod.GET)
	public String adminInquiryList(Model model) {			
	
		logger.info("관리자 리스트 요청");
		ArrayList<InquiryDTO>adminInquiryList=service.adminInquiryList();
		if(adminInquiryList.size() > 0) {
			logger.info("adminlist size : "+adminInquiryList.size());
			model.addAttribute("inquiryList", adminInquiryList);
		}
	
		
		return "adminInquiryList";
	}	
	//관리자 1대1 게시판 상세보기
	@RequestMapping(value = "/adminInquiryDetail")
	public String adminInquiryDetail(Model model, @RequestParam String ib_idx) { 	
		logger.info("상세보기 요청 : "+ib_idx);
		service.adminInquiryDetail(model, ib_idx);
		return "adminInquiryDetail";
	}

	//관리자1대1 게시판  수정
	@RequestMapping(value = "/adminUpdate.do")
	public String adUpdate(Model model, @RequestParam HashMap<String, String> params){
		logger.info("수정 요청");
		logger.info("params :{}",params);
		
		
		service.adUpdate(params);
		
		return "redirect:adminInquiryList.go";
	}
	
	
	//관리자 1대1 게시판 리스트 삭제	
	@RequestMapping(value = "/adDelete")
	public String adDelete(Model model, @RequestParam String ib_idx) {	
		
		
		logger.info("삭제 요청 : "+ib_idx);
		
		
		return service.adDelete(ib_idx);
	}

	//관리자 1대1게시판  검색 
	@RequestMapping(value = "/adSelect",method = RequestMethod.GET)
	public String adSelect(Model model,@RequestParam String ib_searchOption,String ib_keyword
			,String ib_status) {			
	
	
	
	logger.info("상태값:"+ib_status+"/검색옵션:"+ib_searchOption+"/키워드:"+ib_keyword);

		model.addAttribute("ib_status",ib_status);
		model.addAttribute("ib_searchOption",ib_searchOption);
		model.addAttribute("ib_keyword",ib_keyword);
		
		
		ArrayList<InquiryDTO>adSearchList=service.adSearchList(ib_status,ib_searchOption,ib_keyword);
		if(adSearchList.size() > 0) {
			logger.info("1대1 게시판(관리자) 리스트 검색갯수 : "+adSearchList.size());
			model.addAttribute("inquiryList",adSearchList);
			
		
		}
		
		
		return "adminInquiryList";
	}

	












}
