package com.fullstack.cbt.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.fullstack.cbt.dto.MemberDTO;
import com.fullstack.cbt.dto.MemberGradeDTO;

public interface MemberDAO {
	
	
	ArrayList<MemberDTO> list();

	int join(HashMap<String, String>params);

	String login(String mb_id, String mb_pw);

	String overlayId(String mb_id);

	String overlayEmail(String mb_email);

	MemberDTO adminMemberDetail(String mb_id);

	int update(HashMap<String, String> params);

	ArrayList<MemberGradeDTO> gradelist(String mb_id);

	void changeGrade(String mb_id, String mg_grade_after);

	ArrayList<MemberDTO> selectedList(String mb_grade, String searchOption, String search);

	




	

	

}
