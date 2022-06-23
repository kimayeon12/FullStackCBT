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

import com.fullstack.cbt.dto.SubjectDTO;
import com.fullstack.cbt.service.SubjectService;

@Controller
public class SubjectController {

	private static final String X = null;

	private static final String O = null;

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SubjectService service;
	
	//adminSubjectManagementList.do로 바꾸고 아이디 세션 확인 추가할 것
	@RequestMapping(value = "/")
	public String smList(Model model, HttpSession session) {
		
		//String page = "login"; 로그인 페이지로 돌아가는 것 로그인 완성된후 주석해제 할 것

		logger.info("과목 리스트 요청");
		ArrayList<SubjectDTO> list = service.list();
		logger.info("list 갯수 : "+list.size());
		model.addAttribute("list",list);
		
		return "adminSubjectManagement";
	}
	
	
	@RequestMapping(value = "/adminSubjectManagementRegister.go")
	public String regpage() {
		logger.info("과목 등록 페이지 이동요청");
		return "adminSubjectManagementRegister";
	}
	
	@RequestMapping(value = "/overlay.ajax")
	@ResponseBody
	public HashMap<String, Object> chksub(@RequestParam String chkSub) {
		logger.info("과목명 중복체크 요청"+chkSub);
		return service.overlay(chkSub);
	}
	
	
	
	@RequestMapping(value = "/adminSubjectManagement.go")
	public String list() {
		logger.info("과목 리스트 관리 페이지 이동요청");
		return "adminSubjectManagement";
	}
	
	@RequestMapping(value = "/registerReg", method = RequestMethod.POST)
	public String reg(Model model, @RequestParam String subject, String check) {
		logger.info("과목 등록 요청");
		
		int chk = 0;
		
		if(check == null) {
			chk = 1;
		}
		
		logger.info("등록할 과목명 : "+subject+",노출여부 : "+chk);
		
		
		String msg = service.reg(subject,chk);
		logger.info(msg);
		model.addAttribute("msg",msg);
		return "adminSubjectManagement";
	}
	
	
}
