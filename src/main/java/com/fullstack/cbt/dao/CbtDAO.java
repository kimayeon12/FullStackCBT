package com.fullstack.cbt.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.fullstack.cbt.controller.Criteria;
import com.fullstack.cbt.dto.ProblemDTO;
import com.fullstack.cbt.dto.SubjectDTO;
import com.fullstack.cbt.dto.TestDTO;

public interface CbtDAO {

	ArrayList<TestDTO> testlist();
	
	ArrayList<SubjectDTO> subjectList();
	
	ArrayList<TestDTO> selectedList(String su_idx, String tt_status, String mb_id);

	TestDTO testInfo(String tt_idx);

	ArrayList<ProblemDTO> testDetail(String tt_idx);

	
	/*페이징*/  
	public ArrayList<TestDTO> getListPaging(Criteria cri);

	public int getTotal();

	ArrayList<TestDTO> selectedListPaging(HashMap<String, String> params, Criteria cri);

	ArrayList<TestDTO> selectedListPaging(String su_idx, String tt_status, String mb_id, int skip);

	int selectedTotal(String su_idx, String tt_status, String mb_id);

	/*
	ArrayList<TestDTO> selectedListPaging(HashMap<String, Object> params);
	*/
	
}



	

	
	

	


	
