package com.fullstack.cbt.dao;

import java.util.ArrayList;

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

	ArrayList<TestDTO> getListPaging(Criteria cri);

	int getTotal();
}
