package com.fullstack.cbt.dao;

import java.util.ArrayList;

import com.fullstack.cbt.dto.SubjectDTO;
import com.fullstack.cbt.dto.TestDTO;

public interface CbtDAO {

	ArrayList<TestDTO> testlist();
	
	ArrayList<SubjectDTO> subjectList();
}
