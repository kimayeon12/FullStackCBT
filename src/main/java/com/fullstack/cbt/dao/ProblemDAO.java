package com.fullstack.cbt.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.fullstack.cbt.controller.Criteria;
import com.fullstack.cbt.dto.ProblemDTO;
import com.fullstack.cbt.dto.SubjectChapterDTO;
import com.fullstack.cbt.dto.SubjectDTO;

public interface ProblemDAO {

	ArrayList<SubjectDTO> subjectList();

	ArrayList<SubjectChapterDTO> subjectChapList(String su_idx);

	int problemWrite(HashMap<String, Object> params);

	ArrayList<ProblemDTO> problemList();

	ArrayList<ProblemDTO> problemDetailList(String su_idx);

	ArrayList<ProblemDTO> subjectChapDetailList(String sc_idx);

	ProblemDTO detail(String pc_idx);

	ArrayList<SubjectChapterDTO> subjectChap(String su_idx);

	int problemUpdate(HashMap<String, Object> params);

	//ArrayList<ProblemDTO> search(String pc_idx);

	/* 게시판 목록(페이징 적용) */
    public ArrayList<ProblemDTO> getListPaging(Criteria cri);
    
    /* 게시판 총 갯수 */
    public int getTotal(Criteria cri);
	
	/*//페이징 
	ArrayList<ProblemDTO> list(int cnt, int offset);
	int allCount();
	*/
	

}
