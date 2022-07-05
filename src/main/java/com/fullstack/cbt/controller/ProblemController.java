package com.fullstack.cbt.controller;

import java.util.ArrayList;
import java.util.HashMap;

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

import com.fullstack.cbt.dto.PageMakerDTO;
import com.fullstack.cbt.dto.ProblemDTO;
import com.fullstack.cbt.dto.SubjectChapterDTO;
import com.fullstack.cbt.dto.SubjectDTO;
import com.fullstack.cbt.dto.TestAnswerDTO;
import com.fullstack.cbt.dto.TestDTO;
import com.fullstack.cbt.service.ProblemService;

@Controller
public class ProblemController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ProblemService service;
	
	// ****************문제 등록 컨트롤러****************
	
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
	
	@RequestMapping(value = "/subjectChapList.ajax")
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
	public String problemWrite(Model model, HttpSession session
			,@RequestParam HashMap<String, String> params) {
		
		String su_idx = (String) params.get("su_idx");
		
		//로그인 없이 접근한 유저 보내줄 페이지
		String page = "login";
		//관리자 아이디 확인
		String adminId = (String) session.getAttribute("isAdmin");
		//권한 유효성 검사
		//params.put("adminId", adminId);
		
		if(session.getAttribute("loginId") != null) {
			if(adminId == null) {
				model.addAttribute("msg","관리자 전용 서비스 입니다.");
				page = "main";				
			}else{
				logger.info("문제 등록 요청");
				logger.info("param: {}", params, session);
				service.problemWrite(params, session);
				page = "redirect:/problemList.do";
				}
			}else {
			model.addAttribute("msg","로그인이 필요한 서비스 입니다.");
		}
		return page;
	}
	
	
	
	
	/****************등록된 문제 리스트 컨트롤러****************/
	
	//문제 리스트 페이지 접속 + 페이징
	@RequestMapping(value = "/problemList.do", method = RequestMethod.GET)
	public String problemListdo(Model model, Criteria cri, HttpSession session) {
		
		//로그인 없이 접근한 유저 보내줄 페이지
		String page = "login";
		//관리자 아이디 확인
		String adminId = (String) session.getAttribute("isAdmin");
		//권한 유효성 검사
		if(session.getAttribute("loginId") != null) {
			if(adminId == null) {
				model.addAttribute("msg","관리자 전용 서비스 입니다.");
				page = "main";
				}else {
					//과목 리스트 가져오기
					logger.info("등록된 과목 가져오기");
					ArrayList<SubjectDTO> subjectList = service.subjectList();
					if(subjectList.size() > 0) {
						logger.info("등록된 과목 : "+subjectList);
						model.addAttribute("subjectList", subjectList);					
					}
					//정답률 컨트롤러 일단 보류
					ArrayList<ProblemDTO> answerRate = service.answerRate();
					if(answerRate.size() > 0) {
						logger.info("정답률 리스트 : "+answerRate);
						model.addAttribute("problemList", answerRate);							
					}
					
					/********** 페이징 처리하면서 리스트 불러오기 **********/
					ArrayList<ProblemDTO> problemList = service.getListPaging(cri);
					model.addAttribute("problemList", problemList);
					int pageNum=cri.getPageNum();//게시판 1번 부터 번호정렬 
					model.addAttribute("pageNum",pageNum);//게시판 1번 부터 번호정렬
					
					int total = service.getTotal();
					logger.info("전체 게시글 수 : " + total);
					model.addAttribute("listCnt", total);
					
					PageMakerDTO pageMake = new PageMakerDTO(cri, total);
					model.addAttribute("pageMaker", pageMake);
					
					page = "adminProblemList";
				}				
			}else {
				model.addAttribute("msg", "로그인이 필요한 서비스 입니다.");
			}
		return page; 
		}

		
		/*
		logger.info("전체 문제 리스트 요청");
		ArrayList<ProblemDTO> problemList = service.problemList();
		
		if(problemList.size() > 0) {
			logger.info("list size : "+problemList.size());
			model.addAttribute("problemList", problemList);
		}*/

	
	
	
	@RequestMapping(value = "/problemDetailList.do")
	public String problemDetailListdo(Model model, Criteria cri, @RequestParam String su_idx, String sc_idx, String pc_problem
			,String mb_id, int pageNum) {	
		
		logger.info("과목번호 : " + su_idx);
		logger.info("제출상태 : " + sc_idx);
		logger.info("문제 : " + pc_problem);
		logger.info("pageNum :" + pageNum);
		
		// 사용자가 선택 후 값을 고정해주기 위해 model에 저장 
		model.addAttribute("su_idx", su_idx);
		model.addAttribute("sc_idx", sc_idx);
		model.addAttribute("pc_problem", pc_problem);
		
		//등록된 과목 가져오기
		ArrayList<SubjectDTO> subjectList = service.subjectList();			
		logger.info("등록된 과목 가져오기"+subjectList);
		if(subjectList.size() > 0) {
			logger.info("등록된 과목 : "+subjectList);
			model.addAttribute("subjectList", subjectList);
		}
		
		//선택된 과목의 단원 리스트 가져오기.
		ArrayList<SubjectChapterDTO> subjectChapList = service.subjectChapList(su_idx);	
		logger.info("등록된 과목 단원 가져오기"+subjectChapList);
		if(subjectChapList.size() > 0) {
			logger.info("등록된 과목 단원"+subjectChapList);
			model.addAttribute("subjectChapList", subjectChapList);
		}				
		
		
		/********** 페이징 처리하면서 셀렉트 리스트 불러오기 **********/
		int skip = (pageNum -1) * 10;
		ArrayList<ProblemDTO> problemDetailPagingList = service.selectedListPaging(su_idx,sc_idx,pc_problem,skip);
		model.addAttribute("problemList", problemDetailPagingList);
		int pageNum1=cri.getPageNum();//게시판 1번 부터 번호정렬 
		model.addAttribute("pageNum",pageNum1);//게시판 1번 부터 번호정렬
		
		
		int selectedTotal = service.selectedTotal(su_idx,sc_idx,pc_problem);
		model.addAttribute("listCnt", selectedTotal);
		logger.info("선택된 게시글 수 : " + selectedTotal);
		
		PageMakerDTO pageMake2 = new PageMakerDTO(pageNum, selectedTotal);
		model.addAttribute("pageMaker", pageMake2);
		
		
		return "adminProblemList";
		
		
		/* 등록된 문제 전체 리스트
		ArrayList<ProblemDTO> problemList = service.problemList();
		//과목명을 선택하면 전체 리스트를 보여주자.
		if(su_idx == "") { 
			model.addAttribute("problemList", problemList); 
		}
		//선택된 과목 문제 리스트
		logger.info("선택된 과목 가져오기 :"+su_idx);				
		ArrayList<ProblemDTO> problemDetailList = service.problemDetailList(su_idx);
		if(problemDetailList.size() > 0) {
			logger.info("list size : "+problemDetailList.size());
			model.addAttribute("problemList", problemDetailList);
			model.addAttribute("su_idx", su_idx);
		}
		//선택된 과목 단원 문제 리스트
		logger.info("선택된 과목 단원 문제 리스트 가져오기 :"+sc_idx);
		ArrayList<ProblemDTO> subjectChapDetailList = service.subjectChapDetailList(sc_idx);
		if(subjectChapDetailList.size() >0) {
			logger.info("list size: "+subjectChapDetailList.size());
			model.addAttribute("problemList", subjectChapDetailList);
			model.addAttribute("sc_idx", sc_idx);
		}*/
	}	
	
	
	
	
	
	/****************문제 수정하기 컨트롤러****************/
	
	//페이지 이동 시 과목명, 과목 단원, 상세 보기 데이터 가져오기
	@RequestMapping(value = "/problemUpdate.go")
	public String problemUpdate(Model model, HttpSession session
			,@RequestParam String pc_idx, String su_idx) {
		
		//로그인 없이 접근한 유저 보내줄 페이지
		String page = "login";
		//관리자 아이디 확인
		String adminId = (String) session.getAttribute("isAdmin");
		//권한 유효성 검사
		if(session.getAttribute("loginId") != null) {
			if(adminId == null) {
				model.addAttribute("msg","관리자 전용 서비스 입니다.");
				page = "main";
			}else {
				logger.info("수정 상세보기 요청 : "+pc_idx); 
				ProblemDTO problemDetail = service.detail(pc_idx); 
				logger.info("problem : "+problemDetail.getPc_problem());
				logger.info("problem : "+problemDetail.getPc_difficulty());
				
				model.addAttribute("problemDetail", problemDetail);
				
				//과목 리스트 가져오기
				logger.info("등록된 과목 가져오기");
				ArrayList<SubjectDTO> subjectList = service.subjectList();
				
				if(subjectList.size() > 0) {
					logger.info("등록된 과목 : "+subjectList);
					model.addAttribute("subjectList", subjectList);
				}
				logger.info("고유번호"+su_idx);
				
				//과목 단원 리스트 가져오기
				logger.info("등록된 과목 단원 가져오기");
				ArrayList<SubjectChapterDTO> subjectChap = service.subjectChap(su_idx);
				
				if(subjectChap.size() > 0) {
					logger.info("등록된 과목 단원 : "+subjectChap);
					model.addAttribute("subjectChap", subjectChap);
				}
				page = "adminProblemUpdate";
			}
		}else {
			model.addAttribute("msg", "로그인이 필요한 서비스 입니다.");
		}
		return page;
	}
	
	
	//문제 수정하기 
	@RequestMapping(value = "/problemUpdate.do")
	public String problemUpdateDo(Model model, HttpSession session
			,@RequestParam HashMap<String, Object> params) {
		
		//로그인 없이 접근한 유저 보내줄 페이지
		String page = "login";
		//관리자 아이디 확인
		String adminId = (String) session.getAttribute("isAdmin");
		//권한 유효성 검사
		if(session.getAttribute("loginId") != null) {
			if(adminId == null) {
				model.addAttribute("msg","관리자 전용 서비스 입니다.");
				page = "main";
			}else {
				logger.info("문제 수정 요청");
				logger.info("param: {}", params);			
				service.problemUpdate(params);				
				page = "redirect:/problemUpdate.go?pc_idx="+params.get("pc_idx")+"&su_idx="+params.get("su_idx");				
			}			
		}else {
			model.addAttribute("msg", "로그인이 필요한 서비스 입니다.");
		}
		return page;
	}
	
	
	
	
	
}