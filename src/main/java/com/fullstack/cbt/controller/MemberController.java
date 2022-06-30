package com.fullstack.cbt.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sound.midi.MidiDevice.Info;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fullstack.cbt.dto.MemberDTO;
import com.fullstack.cbt.dto.MemberGradeDTO;
import com.fullstack.cbt.service.MemberService;

@Controller
public class MemberController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MemberService service;
	
	//로그인페이지 이동
	@RequestMapping(value="/login.go", method = RequestMethod.GET)
	public String login() {
		logger.info("로그인 페이지");
		return "login";
	}
	
	@RequestMapping(value="/login.do", method= RequestMethod.POST)
	public String login(Model model, HttpServletRequest request) {
		logger.info("로그인 페이지");
		String mb_id=request.getParameter("mb_id");
		String mb_pw=request.getParameter("mb_pw");
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
	
	//로그아웃
	@RequestMapping(value = "/logout.do")
	public String logout(Model model,HttpSession session) {
		session.removeAttribute("loginId");
		model.addAttribute("msg", "로그아웃 되었습니다.");
		return "login";
		}
	
	
	//회원가입페이지 이동
	@RequestMapping(value = "/joinForm.go")
	public String joinForm(Model model) {
		logger.info("회원가입 페이지 이동");
		return "joinForm";
	}
	
	@RequestMapping(value="/join.do")
	public String join(Model model,@RequestParam HashMap<String, String>params) {
		logger.info("회원가입요청 페이지"+params);
		int success=service.join(params);
		String msg="회원가입 실패";
		
		if(success>0) {
			msg="회원가입 성공";
		}
		model.addAttribute("msg",msg); 
		return "login";
	}
	//회원가입페이지에서 아이디 중복체크
	@RequestMapping("/overlayId.ajax")
	@ResponseBody
	public HashMap<String,Object>overlayId(@RequestParam String chkmb_id){
		logger.info("아이디 중복체크:"+chkmb_id);
		return service.overlayId(chkmb_id);
		
	}
	
	//회원가입페이지에서 이메일 중복체크
	@RequestMapping("/overlayEmail.ajax")
	@ResponseBody
	public HashMap<String,Object>overlayEmail(@RequestParam String chkmb_email){
		logger.info("이메일중복체크 중복체크:"+chkmb_email);
		return service.overlayEmail(chkmb_email);
		
	}
	
	//아이디찾기페이지 이동
	@RequestMapping(value="/findId.go")
	public String find() {
		logger.info("아이디 찾기 페이지이동");
		return "findId";
	}
	
	@RequestMapping(value="/findId.do" , method= RequestMethod.POST)
	public String findAction(Model model, HttpServletRequest req ) {
		
		String mb_id= req.getParameter("mb_id");
		String mb_email=req.getParameter("mb_email");
		logger.info(mb_id+"/"+mb_email);
		
	 
	 	return "login";
		
	}
		
	//비밀번호 찾기 페이지 이동
	@RequestMapping(value="/findPw.go")
	public String find2() {
		logger.info("비밀번호 찾기 페이지 이동");
		return "findPw";
	}
	
	//내 정보페이지 이동
		@RequestMapping(value="/myPage.do")
		public String myupdate(HttpSession session, Model model, 
				@RequestParam HashMap<String, String> params) {
			logger.info("내정보수정:{}",params);
			String page="redirect:/myPage.do?mb_id="+params.get("mb_id");
			logger.info(page);

			MemberDTO dto=service.myDetail(params);
			model.addAttribute("memberList",dto);
			
			return "myPage";
		}
			
		
		

		
		//회원관리 리스트 페이지 이동
		//@RequestMapping(value="/adminMemberList.go", method=RequestMethod.GET)
		//public String list() {
			//logger.info("회원관리페이지이동");
			//return "adminMemberList";
		//}
		
		//회원관리 리스트 페이지 
		@RequestMapping(value = "/adminMemberList.do", method = RequestMethod.GET)
		public String adminMemberList(Model model) {
			ArrayList<MemberDTO>list=service.list();
			logger.info("회원관리 리스트 페이지이동");
			logger.info("리스트갯수:"+list.size());
			model.addAttribute("listCnt",list.size());
			
			model.addAttribute("memberList", list);
			
			return "adminMemberList";
		}
		
		@RequestMapping(value ="/adminMemberDetail.do")
		public String adminMemberDetail(Model model, @RequestParam String mb_id) {
			logger.info("상세보기 요청: "+mb_id);
			MemberDTO dto=service.detail(mb_id);
			model.addAttribute("memberList",dto);
			
			//회원권한변경내역
			ArrayList<MemberGradeDTO> gradedto =service.gradelist(mb_id);
			if(gradedto.size()>0) {
				model.addAttribute("gradeUpdate", gradedto);
			}
			
			return "adminMemberDetail";
		}
		
		@RequestMapping(value="/adminMemberUpdate.do")
		public String update(Model model, @RequestParam HashMap<String, String> params) {
		logger.info("회원수정요청:{}",params);
		
		String mb_id = params.get("mb_id");
		
		
		
		service.update(params);
		ArrayList<MemberGradeDTO> gradedto =service.gradelist(mb_id);
		if(gradedto.size()>0) {
			model.addAttribute("gradeUpdate", gradedto);
		}
		
		
		//회원테이블 UPDATE
		for (MemberGradeDTO grade : gradedto) {
			String mg_grade_after = grade.getMg_grade_after();
			logger.info("변경된 회원 권한 : " +mg_grade_after);
			service.changeGrade(mg_grade_after,mb_id);
		}
		//상세보기 내역
		MemberDTO dto=service.detail(mb_id);
		model.addAttribute("memberList",dto);
		
		
			return "adminMemberDetail";
			
		}
		
		//옵션필터
		@RequestMapping(value="/memberList.do")
		public String memberList(Model model,@RequestParam String mb_grade, String searchOption, String search ) {
			logger.info("옵션 확인: "+ mb_grade+searchOption+search);
			model.addAttribute("mb_grade", mb_grade);
			model.addAttribute("searchOption",searchOption);
			
			ArrayList<MemberDTO>selectedList=service.selectedList(mb_grade,searchOption,search);
			logger.info("리스트갯수:"+selectedList.size());
			model.addAttribute("memberList", selectedList);
			model.addAttribute("listCnt",selectedList.size());
			
			return "adminMemberList";
		}
		
		
		
		
	
			
		







 }
	
	
	
	
	
	
	
	
	
	
	
	
	

