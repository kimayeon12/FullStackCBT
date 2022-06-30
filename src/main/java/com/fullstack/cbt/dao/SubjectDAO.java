package com.fullstack.cbt.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.fullstack.cbt.dto.SubjectChapterDTO;
import com.fullstack.cbt.dto.SubjectDTO;

public interface SubjectDAO {

	

	ArrayList<SubjectDTO> list();

	String suboverlay(String chkSub);

	
	int subreg(String subject, int chk);

	SubjectDTO subdetail(String su_idx);

	int subupdate(HashMap<String, String> params);
	
	//int subRev(String su_idx,String subject, int chk);

	ArrayList<SubjectDTO> subjectList();

	String subChapOverlay(String chksubChap);

	int subChapReg(String subject, String chapter);

	ArrayList<SubjectChapterDTO> subList();
	
	ArrayList<SubjectChapterDTO> chapList();

	SubjectChapterDTO subChapRevice(String sc_idx);

	SubjectDTO subjectselList(String su_idx);

	String subChapReOverlay(String chkSubChap);

	// 수정하기 다오
	
	int subChapUpdate(HashMap<String, String> params);

	//임시 테스트
	int submitCheck(String submitChk);



	



	

	

}
