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
import org.springframework.web.bind.annotation.ResponseBody;

import com.fullstack.cbt.dto.SubjectChapterDTO;
import com.fullstack.cbt.dto.SubjectDTO;
import com.fullstack.cbt.service.SubjectService;

@Controller
public class SubjectController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SubjectService service;
	
	

	@RequestMapping(value = "/")
	public String page() {
		logger.info("과목 리스트 페이지 이동요청");
		return "redirect:/adminSubjectManagement.do";
	}
	
	@RequestMapping(value = "/adminSubjectManagement.do")
	public String smList(Model model, HttpSession session) {
		
		//String page = "login"; 로그인 페이지로 돌아가는 것 로그인 완성된후 주석해제 할 것
		String page = "adminSubjectManagement";
		logger.info("과목 리스트 요청");
		ArrayList<SubjectDTO> list = service.list();
		logger.info("list 갯수 : "+list.size());
		model.addAttribute("list",list);
		
		return page;
	}
	
	@RequestMapping(value = "/adminSubjectManagementRegister.go")
	public String regpage() {
		logger.info("과목 등록 페이지 이동요청");
		return "adminSubjectManagementRegister";
	}
	
	@RequestMapping(value = "/subOverlay.ajax")
	@ResponseBody
	public HashMap<String, Object> suboverlay(@RequestParam String chkSub) {
		logger.info("과목명 중복체크 요청: "+chkSub);
		return service.suboverlay(chkSub);
	}
	
	@RequestMapping(value = "/subReg.ajax")
	@ResponseBody
	public HashMap<String, Object> subreg(@RequestParam String subject, String check) {
		logger.info("과목 등록 요청 : "+subject);
		logger.info("노출 여부 : "+check);
		int chk = 0;
		
		if(check == null) {
			chk = 1;
		}
		return service.subreg(subject, chk);
	}
	
	@RequestMapping(value = "/adminSubjectManagement.go")
	public String list() {
		logger.info("과목 관리 리스트 페이지 이동요청");
		return "adminSubjectManagement";
	}
	
	@RequestMapping(value = "/adminSubjectManagementRevice.do")
	public String reviceform(Model model, HttpSession session,
			@RequestParam String su_idx) {
		
		//추후 아이디 유효성 검사 추가할 것
		String page = "adminSubjectManagementRevice";
		logger.info("과목 관리 수정 상세 페이지 이동요청 : "+su_idx);
		SubjectDTO dto = service.subdetail(su_idx);
			if(dto != null) {
				model.addAttribute("dto",dto);
				page = "adminSubjectManagementRevice";
			}
		
		return page;
	}
	
	@RequestMapping(value = "/subjectUpdate.do")
	public String subupdate(Model model,
			@RequestParam String subject, String check, String su_idx) {
		logger.info("수정 요청");
		logger.info("subject : "+subject+"노출,비노출 : "+check+"과목 고유 번호 : "+su_idx);
		service.subupdate(subject,check,su_idx);
		return "redirect:/adminSubjectManagement.do";
	}
	
	
	
	//과목 단원 페이지
	@RequestMapping(value = "/adminSubjectChapterManagement.go")
	public String chappage() {
		logger.info("과목 단원 리스트 페이지 이동요청");
		return "redirect:/adminSubjectChapterManagement.do";
	}
	
	@RequestMapping(value = "/adminSubjectChapterManagement.do")
	public String chapList(Model model, HttpSession session) {
		
	
		
		logger.info("과목단원명 리스트 요청");
		ArrayList<SubjectChapterDTO> chapList = service.chapList();
		
		if(chapList.size() > 0) {
			logger.info("과목단원관리 리스트 갯수 : "+chapList.size());
			model.addAttribute("chapList",chapList);
		}
		
		ArrayList<SubjectChapterDTO> subList = service.subList();
		
		if(subList.size() > 0) {
			logger.info("과목단원관리 리스트 갯수 : "+subList.size());
			model.addAttribute("subList",subList);
		}
		
		
		String page = "adminSubjectChapterManagement";
		return page;
	}
	
	@RequestMapping(value = "/adminSubjectChapterManagementRegister.go")
	public String chapregpage() {
		logger.info("과목 단원 등록 페이지 이동요청");
		return "redirect:/adminSubjectChapterManagementRegister.do";
	}
	
	@RequestMapping(value = "/adminSubjectChapterManagementRegister.do")
	public String chapregList(Model model, HttpSession session) {
		
		logger.info("과목 리스트 요청");
		ArrayList<SubjectDTO> subjectList = service.subjectList();
		String page = "adminSubjectChapterManagementRegister";
		if(subjectList.size() > 0) {
			logger.info("등록된 과목 : "+subjectList);
			model.addAttribute("subjectList",subjectList);
		}
		
		return page;
	}
	
	@RequestMapping(value = "/subChapOverlay.ajax")
	@ResponseBody
	public HashMap<String, Object> subChapOverlay(@RequestParam String chksubChap) {
		logger.info("과목단원명 중복체크 요청: "+chksubChap);
		return service.subChapOverlay(chksubChap);
	}
	
	@RequestMapping(value = "/subChapReg.ajax")
	@ResponseBody
	public HashMap<String, Object> subChapReg(@RequestParam String subject, String chapter) {
		logger.info(subject+" 과목의 "+chapter+" 과목단원 등록 요청");
		return service.subChapReg(subject, chapter);
	}
	
	/*
	@RequestMapping(value = "/adminSubjectChapterManagementRevice.go")
	public String subChapRevicePage() {
		logger.info("과목단원 수정 페이지 이동요청");
		return "adminSubjectChapterManagementRevice";
	}
	*/
	
	@RequestMapping(value = "/adminSubjectChapterManagementRevice.do")
	public String subChapRevice(Model model, HttpSession session, String sc_idx
			) {
		
		String page = "adminSubjectChapterManagementRevice";
		logger.info("과목단원 수정 상세 페이지 요청");
		SubjectChapterDTO chapdto = service.subChapRevice(sc_idx);
		if(chapdto !=null) {
			model.addAttribute("chapdto",chapdto);
			page = "adminSubjectChapterManagementRevice";
		}
		
		ArrayList<SubjectDTO> subjectList = service.subjectList();
		if(subjectList.size() > 0) {
			logger.info("등록된 과목 : "+subjectList);
			model.addAttribute("subjectList",subjectList);
		}
		
		return page;
	}
	
	
	
}
