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
	
	@RequestMapping(value="/login.do", method= RequestMethod.POST)
	public String login(Model model, HttpServletRequest request) {
		logger.info("로그인 페이지");
		String mb_id=request.getParameter("id");
		String mb_pw=request.getParameter("pw");
		logger.info(mb_id+"/"+mb_pw);
		String loginId = service.login(mb_id,mb_pw);
		logger.info("로그인 아이디: "+loginId);
		
		String page="login";
		String msg="아이디 또는 비밀번호를 확인하세요.";
		
		if(loginId==null) {
			model.addAttribute("msg",msg);
		}else {
			HttpSession session=request.getSession();
			session.setAttribute("loginId", loginId);
			page = "main";//로그인 성공시 메인화면
		}

		return page;
	
	}
	
	@RequestMapping(value = "/joinForm.go")
	public String joinForm() {
		logger.info("회원가입 페이지 이동");
		return "joinForm";
	}
	
	@RequestMapping(value="/joinForm.do", method= RequestMethod.POST)
	public String join(Model model, HttpServletRequest request) {
		logger.info("로그인 페이지");
		String mb_id = request.getParameter("id");
		String mb_pw = request.getParameter("pw");
		String mb_pw2= request.getParameter("pw2");
		String mb_name = request.getParameter("name");
		String mb_email= request.getParameter("email");
		
		logger.info(mb_id+"/"+mb_pw+"/"+mb_pw2+"/"+mb_name+"/"+mb_email);
		
		String msg=service.joinForm(mb_id,mb_pw,mb_pw2,mb_name,mb_email);
		logger.info(msg);
		
		model.addAttribute("msg",msg); 
		return "login";
	}
}
