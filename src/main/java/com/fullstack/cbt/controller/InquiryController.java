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

import com.fullstack.cbt.service.InquiryService;




@Controller
public class InquiryController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired InquiryService service;
	
	

	
	
	// 1대1 게시판 리스트 
	@RequestMapping(value = "/inquiryList.go",method = RequestMethod.GET)
	public String list(Model model,PageMaker2 pageMaker,HttpSession session) {
		
		String loginId = (String) session.getAttribute("loginId");
		
		if(loginId != null) {
		logger.info(" 리스트 요청");
		
		pageMaker.setTotalCount(service.listPageCount(pageMaker));
        ArrayList<InquiryDTO> list = service.inquirySearch(pageMaker);	           

        String pagination=pageMaker.paginationHtml("inquiryList.go");
        
        model.addAttribute("inquiryList", list);
        model.addAttribute("pageMaker", pageMaker);
        model.addAttribute("pagination", pagination);
		}else {
				model.addAttribute("msg", "로그인 후 이용해 주세요.");
			
				return "login";
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
	public String detail(Model model, @RequestParam String ib_idx,HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		
		if(loginId != null) {
			logger.info("상세보기 요청 : "+ib_idx);
			service.inquiryDetail(model, ib_idx);
		}else {
			model.addAttribute("msg", "로그인 후 이용해 주세요.");
			return "login";
		}
			
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
		public String delete(Model model, @RequestParam String ib_idx,HttpSession session) {
			String loginId = (String) session.getAttribute("loginId");
			
			if(loginId != null) {
				logger.info("삭제 요청 : "+ib_idx);
				service.inquiryDelte(ib_idx);
			}else {
				model.addAttribute("msg", "로그인 후 이용해 주세요.");
				return "login";
			}
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
	
	
		
		
	
	
	
	
	
	
	//하단 관리자  
	
	// 관리자 1대1 게시판 리스트 
	@RequestMapping(value = "/adminInquiryList.go",method = RequestMethod.GET)
	public String adminInquiryList(Model model,HttpSession session,PageMaker2 pageMaker) {	
		
		
		String isAdmin = (String) session.getAttribute("isAdmin");
		
		if(session.getAttribute("loginId") != null) {
			if(isAdmin ==null) {
				model.addAttribute("msg","관리자 서비스입니다");
				return "main";
			}else {
				pageMaker.setTotalCount(service.adListPageCount(pageMaker));
		        ArrayList<InquiryDTO> list = service.adInquirySearch(pageMaker);	           

		        String pagination=pageMaker.paginationHtml("adminInquiryList.go");
		        
		        model.addAttribute("inquiryList", list);
		        model.addAttribute("pageMaker", pageMaker);
		        model.addAttribute("pagination", pagination);
			
			}
		}else {
			model.addAttribute("msg", "로그인 후 이용해 주세요.");
			
			return "login";
		}
		
		return "adminInquiryList";
	}	
	//관리자 1대1 게시판 상세보기
	@RequestMapping(value = "/adminInquiryDetail")
	public String adminInquiryDetail(Model model, @RequestParam String ib_idx,HttpSession session) { 	
		String isAdmin = (String) session.getAttribute("isAdmin");
		
		if(session.getAttribute("loginId") != null) {
			if(isAdmin ==null) {
				model.addAttribute("msg","관리자 서비스입니다");
				return "main";
			}else {	
				logger.info("관리자 리스트 요청");
				logger.info("상세보기 요청 : "+ib_idx);
				service.adminInquiryDetail(model, ib_idx);
				}
		}else {
			model.addAttribute("msg", "로그인 후 이용해 주세요.");
			
			return "login";
		}
		return "adminInquiryDetail";
	}

	//관리자1대1 게시판  수정
	@RequestMapping(value = "/adminUpdate.do")
	public String adUpdate(Model model, @RequestParam HashMap<String, String> params,HttpSession session){
		int ib_idx = Integer.parseInt(params.get("ib_idx"));
		String isAdmin = (String) session.getAttribute("isAdmin");
		
		if(session.getAttribute("loginId") != null) {
			if(isAdmin ==null) {
				model.addAttribute("msg","관리자 서비스입니다");
				return "main";
			}else {	
				logger.info("수정 요청");
				logger.info("날짜" + params.get("ib_answer_date"));
				logger.info("params :{}",params);
				service.adUpdate(params,session);
			}
		}else {
			model.addAttribute("msg", "로그인 후 이용해 주세요.");
			
			return "login";
		}
		
		 return"redirect:/adminInquiryDetail?ib_idx="+ib_idx;
	}
	
	
	//관리자 1대1 게시판 리스트 삭제	
	@RequestMapping(value = "/adDelete")
	public String adDelete(Model model, @RequestParam String ib_idx) {	
		
		
		logger.info("삭제 요청 : "+ib_idx);
		
		
		return service.adDelete(ib_idx);
	}

	

	












}
