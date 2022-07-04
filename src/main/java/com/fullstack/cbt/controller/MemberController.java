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

import com.fullstack.cbt.dto.MemberDTO;
import com.fullstack.cbt.dto.MemberGradeDTO;
import com.fullstack.cbt.dto.PageMakerDTO;
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
        MemberDTO login = service.login(mb_id, mb_pw);
		
		String page="login";
        String msg = null;
		
        if(login!=null) {
            if(login.getMb_grade().equals("탈퇴회원")) {
                msg = "탈퇴된 회원 계정입니다.";
                model.addAttribute("msg",msg);
            } else {
                HttpSession session=request.getSession();
                
                session.setAttribute("loginId", login.getMb_id());
                session.setAttribute("loginName", login.getMb_name());
                session.setAttribute("loginGrade", login.getMb_grade());
                
                if(login.getMb_grade().equals("관리자") || login.getMb_grade().equals("최고관리자")) {
                    session.setAttribute("isAdmin", "true");
                }
                
                page = "main";//로그인 성공시 메인화면
            }
        }else {
            msg = "아이디 또는 비밀번호를 확인하세요.";
            model.addAttribute("msg",msg);
        }
        
        if(msg != null) {
            model.addAttribute("msg", msg);
        }

		return page;
	
	}
	
	//로그아웃
	@RequestMapping(value = "/logout.do")
	public String logout(Model model,HttpSession session) {
		session.removeAttribute("loginId");
        session.removeAttribute("loginName");
        session.removeAttribute("loginGrade");
        session.removeAttribute("isAdmin");
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
    public String findId(Model model, HttpServletRequest req ) {
		
        String mb_name= req.getParameter("mb_name");
        String mb_email=req.getParameter("mb_email");
        logger.info(mb_name+"/"+mb_email);
        String id = service.findId(mb_name, mb_email);
        String msg = "일치하는 정보를 찾을 수 없습니다.";
        
        if(id != null) {
            msg = "아이디는 "+id+" 입니다.";
        }
        
        model.addAttribute("msg", msg);
		
	 
	 	return "findId";
		
	}
		
	//비밀번호 찾기 페이지 이동
	@RequestMapping(value="/findPw.go")
	public String find2() {
		logger.info("비밀번호 찾기 페이지 이동");
		return "findPw";
	}
	
    @RequestMapping(value="/findPw.do" , method= RequestMethod.POST)
    public String findPw(Model model, HttpServletRequest req ,HttpSession session) {
        
        String mb_id= req.getParameter("mb_id");
        String mb_name= req.getParameter("mb_name");
        String mb_email=req.getParameter("mb_email");
        logger.info(mb_id+"/"+mb_name+"/"+mb_email);
        
        int row = service.isFindPw(mb_id, mb_name, mb_email);
        
        if(row > 0) {
            model.addAttribute("mb_id", mb_id);
            session.setAttribute("findID", mb_id);
            
             return "pwChange";
        } else {
            model.addAttribute("msg", "일치하는 정보를 찾을 수 없습니다.");
            
            return "findPw";
        }
        
    }
        
    //새 비밀번호 설정 페이지 이동
    @RequestMapping(value="/pwChange.go")
    public String pwChange() {
        logger.info("새 비밀번호 설정 페이지 이동");
        return "pwChange";
    }
    
    @RequestMapping(value="/pwChange.do")
    public String pwChange(HttpServletRequest req, HttpSession session) {
        HashMap<String, String> map = new HashMap<String, String>();
        
        String id = (String) session.getAttribute("findID");
        
        if(id != null) {
            service.pwChange(id, req.getParameter("pw"));
        }
        
        session.removeAttribute("findID");
        
        return "redirect:/login.go";
    }
	
	//내 정보페이지 이동
    @RequestMapping(value="myPage.do")
    public String myupdate(HttpSession session, Model model) {
        MemberDTO dto=service.myDetail((String) session.getAttribute("loginId"));
        model.addAttribute("memberList",dto);
        
        return "myPage";
    }
    
    //내정보 수정
    @RequestMapping(value="/myInfoUpdate.do")
    public String myInfoUpdate(HttpSession session, @RequestParam HashMap<String, String> params) {
        String loginId = (String) session.getAttribute("loginId");
        
        params.put("mb_id", loginId);
        logger.info("params : {}", params);
        service.myInfoUpdate(params);
        
        return "redirect:/myPage.do";
    }
    
    //회원탈퇴
    @RequestMapping(value="/memberDelete.do")
    public String memberDelete(HttpSession session, @RequestParam HashMap<String, String> params) {
        String loginId = (String) session.getAttribute("loginId");
        String mg_grade_before = service.getMbGrade(loginId, params.get("pw"));
        
        if(mg_grade_before != null) {
            params.put("mg_grade_before", mg_grade_before);
        }
        
        params.put("mb_id", loginId);
        logger.info("params : {}", params);
        if(service.memberDelete(loginId, params.get("pw")) == true) {
            if(params.get("mg_content").equals("기타")) {
                params.put("mg_content", "기타(" + params.get("mg_content_other") + ")");
            }
            
            service.memberGrade(params);
        }
        
        session.removeAttribute("loginId");
        session.removeAttribute("loginName");
        
        return "redirect:/login.go";
    }
			
		
		

		
		//회원관리 리스트 페이지 이동
		//@RequestMapping(value="/adminMemberList.go", method=RequestMethod.GET)
		//public String list() {
			//logger.info("회원관리페이지이동");
			//return "adminMemberList";
		//}
		
		//회원관리 리스트 페이지 
		@RequestMapping(value = "/adminMemberList.do", method = RequestMethod.GET)
		public String adminMemberList(Model model, HttpSession session,Criteria cri) {
			String page ="login";
			logger.info("관리자 로그인 : " + session.getAttribute("isAdmin"));
			
			if(session.getAttribute("isAdmin") != null) {
				//리스트 번호때문에 주석처리
				//ArrayList<MemberDTO>list=service.list();
				//logger.info("회원관리 리스트 페이지이동");
				//logger.info("리스트갯수:"+list.size());
				//model.addAttribute("listCnt",list.size());
				
				//model.addAttribute("memberList", list);
				
				//페이징처리해서 리스트 불러오기
				ArrayList<MemberDTO>memberList=service.getListPaging(cri);
				model.addAttribute("memberList", memberList);
				int pageNum=cri.getPageNum();
				model.addAttribute("pageNum",pageNum);
				int total=service.getTotal();
				logger.info("전체회원 리스트 수 :" +total);
				model.addAttribute("listCnt", total);  //리스트 수 표시
				
				PageMakerDTO pageMake = new PageMakerDTO(cri, total);
				model.addAttribute("pageMaker",pageMake);
				page="adminMemberList";
			}else {
				model.addAttribute("msg","관리자 계정 로그인이 필요한 서비스입니다.");
			}
			
			return page;
			
		}
		//회원관리 수정
		@RequestMapping(value ="/adminMemberDetail.do")
		public String adminMemberDetail(Model model, HttpSession session, @RequestParam String mb_id) {
			String page ="login";
			logger.info("관리자 로그인: " + session.getAttribute("isAdmin"));
			
			if(session.getAttribute("isAdmin") != null) {
				logger.info("상세보기 요청: "+mb_id);
				MemberDTO dto=service.detail(mb_id);
				model.addAttribute("memberList",dto);
				
				//로그인한 사용자의 권한이 최고관리자가 아니면 최고관리자 등급을 안보이게 
				String loginId = (String) session.getAttribute("loginId");
				String grade = service.gradeCheck(loginId);
				logger.info("로그인한 계정 권한 : " + grade);
				model.addAttribute("mb_grade", grade);
				
				
				//회원권한변경내역
				ArrayList<MemberGradeDTO> gradedto =service.gradelist(mb_id);
				if(gradedto.size()>0) {
					model.addAttribute("gradeUpdate", gradedto);
				}
				
				page = "adminMemberDetail";
				}else {
					model.addAttribute("msg","관리자 계정 로그인이 필요한 서비스입니다.");
					
				}
			
			
				return page;
			}
		//회원관리 수정에서 회원권한변경내역
		@RequestMapping(value="/adminMemberUpdate.do")
        public String update(Model model, HttpSession session, @RequestParam HashMap<String, String> params) {
			String page ="login";
			logger.info("관리자 로그인 : " + session.getAttribute("isAdmin"));
			
			if(session.getAttribute("isAdmin") != null) {
				logger.info("회원수정요청:{}",params);
				if((String) session.getAttribute("isAdmin") != null) {
					
					String mb_id = params.get("mb_id");
					
					
					String loginId= (String) session.getAttribute("loginId");
					
					params.put("loginId",loginId);
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
				}
				
				}else {
					
					model.addAttribute("msg","관리자 계정 로그인이 필요한 서비스입니다.");
				}
			
				return "adminMemberDetail";
			
			}
		
		//옵션필터
		@RequestMapping(value="/memberList.do")
		public String memberList(Model model,HttpSession session,@RequestParam String mb_grade, String searchOption, String search, int pageNum ) {
			String page ="login";
			logger.info("관리자 로그인 : " + session.getAttribute("isAdmin"));
			
			if(session.getAttribute("isAdmin") != null) {
				logger.info("옵션 확인: "+ mb_grade+searchOption+search);
				model.addAttribute("mb_grade", mb_grade);
				model.addAttribute("searchOption",searchOption);
				
				//ArrayList<MemberDTO>selectedList=service.selectedList(mb_grade,searchOption,search);
				//logger.info("리스트갯수:"+selectedList.size());
				//model.addAttribute("memberList", selectedList);
				//model.addAttribute("listCnt",selectedList.size());
				
				//옵션 페이징처리
				int skip=(pageNum-1) * 10;
				ArrayList<MemberDTO>dto = service.selectedList(mb_grade, searchOption, search,skip);
				model.addAttribute("memberList",dto);
				
				int selectedTotal=service.selectedTotal(mb_grade, searchOption, search);
				model.addAttribute("listCnt", selectedTotal);
				logger.info("선택된 리스트 수:"+selectedTotal);
				
				model.addAttribute("pageNum",pageNum);
				model.addAttribute("listCnt", selectedTotal); 
				
				PageMakerDTO pageMake2= new PageMakerDTO(pageNum, selectedTotal);
				model.addAttribute("pageMaker", pageMake2);
								
				
				page="adminMemberList";
			}else {
				model.addAttribute("msg","관리자 계정 로그인이 필요한 서비스입니다.");
			}
			return page;
		}
		
		
		
		
	
			
		







 }
	
	
	
	
	
	
	
	
	
	
	
	
	

