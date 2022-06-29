package com.fullstack.cbt.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

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
	public String problemWrite(Model model,
			@RequestParam HashMap<String, Object> params
			) {
		logger.info("문제 등록 요청");
		logger.info("param: {}", params);
		
		// 220623 mb_id 를 loginId 로 params 에 덧붙여 넘기는 로직 해보기
		
		service.problemWrite(params);
		return "adminProblemList"; 
	}
	
	
	
	
	// ****************등록된 문제 리스트 컨트롤러****************
	
	@RequestMapping(value = "/problemList.go")
	public String problemListgo(Model model) {
		
		//problemList.do와 같은 JSP 파일로 return 하더라도 이건 보내주는 데이터가 없어서 리스트가 나오지 않는다.
		logger.info("문제 리스트 이동");
		return "adminProblemList"; 
	}
	
	//문제 리스트 페이지 접속 + 페이징
	@RequestMapping(value = "/problemList.do", method = RequestMethod.GET)
	public String problemListdo(Model model, Criteria cri) {
		
		//과목 리스트 가져오기
		logger.info("등록된 과목 가져오기");
		ArrayList<SubjectDTO> subjectList = service.subjectList();
				
		if(subjectList.size() > 0) {
			logger.info("등록된 과목 : "+subjectList);
			model.addAttribute("subjectList", subjectList);
		}
		
		
		logger.info("전체 문제 리스트 요청");
		ArrayList<ProblemDTO> problemList = service.problemList();
		
		if(problemList.size() > 0) {
			logger.info("list size : "+problemList.size());
			model.addAttribute("problemList", problemList);
		}
		
		//페이징 테스트 기도
		model.addAttribute("problemList", service.getListPaging(cri));
		int total = service.getTotal(cri);
        PageMakerDTO pageMake = new PageMakerDTO(cri, total);
        model.addAttribute("pageMaker", pageMake);
		
		return "adminProblemList"; 
	}
	
	
	
	@RequestMapping(value = "/problemDetailList.do")
	public String problemDetailListdo(Model model, @RequestParam String su_idx, String sc_idx, String pc_idx
			,Criteria cri) {
		
		//등록된 문제 전체 리스트
		ArrayList<ProblemDTO> problemList = service.problemList();
		
		//선택된 과목 문제 리스트
		logger.info("선택된 과목 가져오기 :"+su_idx);				
		ArrayList<ProblemDTO> problemDetailList = service.problemDetailList(su_idx);

		//과목명을 선택하면 전체 리스트를 보여주자.
		if(su_idx == "") { 
			model.addAttribute("problemList", problemList); 
		}
		
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
		}
		
		//등록된 과목 가져오기
		ArrayList<SubjectDTO> subjectList = service.subjectList();			
		logger.info("등록된 과목 가져오기"+subjectList);
		
		if(subjectList.size() > 0) {
			logger.info("등록된 과목 : "+subjectList);
			model.addAttribute("subjectList", subjectList);
		}
		
		//선택된 과목의 단원 리스트 가져오기.
		ArrayList<SubjectChapterDTO> subjectChapList = service.subjectChapList(su_idx);	
		
		if(subjectChapList.size() > 0) {
			logger.info("등록된 과목 단원"+subjectChapList);
			model.addAttribute("subjectChapList", subjectChapList);
		}				
		
		//검색 부분
		model.addAttribute("pc_idx", pc_idx);
		
		//ArrayList<ProblemDTO> search = service.search(pc_idx);
		
		
		return "adminProblemList";
	
	}
	
	
	// ****************리스트 페이징****************
	
	//list.jsp에서 listCall()에서 list.ajax 호출하면 이 list 메서드가 다시 listCall에게 돌려준다. ajax 이기 때문에 @ResponseBody어노테이션 선언해야 한다.
	//@ResponseBody로 HashMap<String, Object> 요거 반환할 거다.
	/*
	@RequestMapping("/list.ajax")
	@ResponseBody
	public HashMap<String, Object> list(
			@RequestParam HashMap<String, String> params
			) {
		logger.info("리스트 요청 : {}", params);
		return service.list(params);
	}
	
	*/
	
	
	
	
	
	
	
	
	
	// ****************문제 수정하기 컨트롤러****************
	
	//페이지 이동 시 과목명, 과목 단원, 상세 보기 데이터 가져오기
	@RequestMapping(value = "/problemUpdate.go")
	public String problemUpdate(Model model, @RequestParam String pc_idx, String su_idx) {
		
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
		
		return "adminProblemUpdate";
	}
	
	
	//문제 수정하기 
	@RequestMapping(value = "/problemUpdate.do")
	public String problemUpdateDo(Model model, 
			@RequestParam HashMap<String, Object> params) {
		
		logger.info("문제 수정 요청");
		logger.info("param: {}", params);
	
		service.problemUpdate(params);
		
		return "redirect:/problemUpdate.go?pc_idx="+params.get("pc_idx")+"&su_idx="+params.get("su_idx");
	}
	
	
	
	
	
}





















