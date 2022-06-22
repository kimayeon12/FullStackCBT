package com.fullstack.cbt.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fullstack.cbt.service.MemberService;

@Controller
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MemberService service;
	
	@RequestMapping(value="/login.go", method = RequestMethod.GET)
	public String login() {
		logger.info("로그인 페이지");
		return "login";
	}
	
	@RequestMapping(value = "/joinForm.go")
	public String joinForm() {
		logger.info("회원가입 페이지 이동");
		return "joinForm";
	}
	
	@RequestMapping(value="/login.do", method= RequestMethod.POST)
	public String login(Model model, HttpServletRequest request) {
		logger.info("로그인 페이지");
		String mb_id=request.getParameter("id");
		String mb_pw=request.getParameter("pw");
		logger.info(mb_id+"/"+mb_pw);
		String loginId = service.login(mb_id,mb_pw);
		logger.info("로그인 아이디: "+loginId);
		
		String page="main.go";
		
		if(loginId==null) {
			HttpSession session=request.getSession();
			session.setAttribute("loginId", loginId);
			page = null;
		}
		
		
		
		return "login";
	
	}
	
}
