package com.fullstack.cbt.dao;

import java.util.ArrayList;

import com.fullstack.cbt.dto.SubjectChapterDTO;
import com.fullstack.cbt.dto.SubjectDTO;

public interface SubjectDAO {

	

	ArrayList<SubjectDTO> list();

	String suboverlay(String chkSub);

	
	int subreg(String subject, int chk);

	SubjectDTO subdetail(String su_idx);

	int update(String subject, String check, String su_idx);

	ArrayList<SubjectDTO> subjectList();

	String subChapOverlay(String chksubChap);

	int subChapReg(String subject, String chapter);

	ArrayList<SubjectChapterDTO> chapList();
	
	ArrayList<SubjectChapterDTO> subList();

	SubjectChapterDTO subChapRevice(String sc_idx);

	

	

}
