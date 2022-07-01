package com.fullstack.cbt.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.fullstack.cbt.dao.MemberDAO;
import com.fullstack.cbt.dto.MemberDTO;
import com.fullstack.cbt.dto.MemberGradeDTO;

@Service
public class MemberService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MemberDAO dao;

	public String login(String mb_id, String mb_pw) {
		logger.info("서비스도착");
		return dao.login(mb_id,mb_pw);
	}


	public int join(HashMap<String, String> params) {
		logger.info("로그인페이지이동");
		return dao.join(params);
	}


	public HashMap<String, Object> overlayId(String mb_id) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		String overId= dao.overlayId(mb_id);
		logger.info("중복 아이디:"+overId);
		//중복된 아이디이면 중복 아이디:(중복아이디)가 보여짐 -> 사용불가 아이디
		//사용가능한 아이디이면 중복 아이디:(null)이 보여짐 ->사용가능 아이디
		boolean over = overId ==null?false:true;
		map.put("overlayId",over);
		
		return map;
	}


	public HashMap<String, Object> overlayEmail(String mb_email) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			String overEmail= dao.overlayEmail(mb_email);
			logger.info("중복 이메일:"+overEmail);
			//중복된 이메일이면 중복 이메일:(중복이메일)이 보여짐 ->사용불가 이메일
			//사용가능한 이메일이면 중복 이메일:(null)이 보여짐 ->사용가능 이메일
			boolean over = overEmail ==null?false:true;
			map.put("overlayEmail",over);
			
			return map;
		}


	public ArrayList<MemberDTO> list() {
		logger.info("리스트 요청");
		return dao.list();
	}


	public MemberDTO detail(String mb_id) {
		logger.info(mb_id+"님의 상세보기");
		return dao.adminMemberDetail(mb_id);
	}


	public void update(HashMap<String, String> params) {
		logger.info("수정요청!");
		int row=dao.update(params);
		logger.info("수정된 데이터 수 :"+row);
		
	}


	public ArrayList<MemberGradeDTO> gradelist(String mb_id) {
		logger.info("권한리스트  요청");
		return dao.gradelist(mb_id);
	}


	public void changeGrade( String mg_grade_after, String mb_id) {
		dao.changeGrade(mg_grade_after, mb_id);
		
	}


	public ArrayList<MemberDTO> selectedList(String mb_grade, String searchOption, String search) {
		logger.info("옵션 선택요청");
		return dao.selectedList(mb_grade,searchOption,search);
	}


	public MemberDTO myDetail(HashMap<String, String> params) {
		logger.info("내정보수정");
		return dao.myDetail(params);
	}


	

	


	


	





	







	
	
}
