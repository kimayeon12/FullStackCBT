package com.fullstack.cbt.dao;

import java.util.ArrayList;

import com.fullstack.cbt.dto.SubjectDTO;
import com.fullstack.cbt.dto.TestDTO;

public interface CbtDAO {

	ArrayList<TestDTO> testlist();
	
	ArrayList<SubjectDTO> subjectList();
	
	ArrayList<TestDTO> selectedList(String su_idx, String tt_status, String mb_id);
}
