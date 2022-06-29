package com.fullstack.cbt.dao;

import java.util.ArrayList;

import com.fullstack.cbt.dto.SubjectDTO;

public interface ProblemSaveDAO {

	ArrayList<SubjectDTO> subjectList(String loginId);

}
