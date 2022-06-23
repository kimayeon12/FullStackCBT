package com.fullstack.cbt.dao;

import java.util.ArrayList;

import com.fullstack.cbt.dto.ProblemDTO;

public interface ProblemDAO {

	ArrayList<ProblemDTO> subjectList();

	ArrayList<String> subjectChapList(String subject);

}
