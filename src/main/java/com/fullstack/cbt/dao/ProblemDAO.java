package com.fullstack.cbt.dao;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import com.fullstack.cbt.controller.Criteria;
import com.fullstack.cbt.dto.ProblemDTO;
import com.fullstack.cbt.dto.SubjectChapterDTO;
import com.fullstack.cbt.dto.SubjectDTO;
import com.fullstack.cbt.dto.TestAnswerDTO;

public interface ProblemDAO {

	ArrayList<SubjectDTO> subjectList();

	ArrayList<SubjectChapterDTO> subjectChapList(String su_idx);

	int problemWrite(HashMap<String, String> params);

	ArrayList<ProblemDTO> problemList();

	ArrayList<ProblemDTO> problemDetailList(String su_idx);

	ArrayList<ProblemDTO> subjectChapDetailList(String sc_idx);

	ProblemDTO detail(String pc_idx);

	ArrayList<SubjectChapterDTO> subjectChap(String su_idx);

	int problemUpdate(HashMap<String, Object> params);

	/* 게시판 목록(페이징 적용) */
    public ArrayList<ProblemDTO> getListPaging(Criteria cri);
    
    /* 게시판 총 갯수 */
    public int getTotal();

	ArrayList<ProblemDTO> selectedListPaging(String su_idx, String sc_idx, String pc_problem, int skip);

	int selectedTotal(String su_idx, String sc_idx, String pc_problem);

	ArrayList<ProblemDTO> answerRate();
	

}
