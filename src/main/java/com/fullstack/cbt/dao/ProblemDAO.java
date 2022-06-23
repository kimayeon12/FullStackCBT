package com.fullstack.cbt.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.fullstack.cbt.dto.SubjectChapterDTO;
import com.fullstack.cbt.dto.SubjectDTO;

public interface ProblemDAO {

	ArrayList<SubjectDTO> subjectList();

	ArrayList<SubjectChapterDTO> subjectChapList(String subject);

	int problemWrite(HashMap<String, Object> params);

}
