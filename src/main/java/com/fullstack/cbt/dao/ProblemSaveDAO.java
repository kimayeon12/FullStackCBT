package com.fullstack.cbt.dao;

import java.util.ArrayList;

import com.fullstack.cbt.controller.Criteria;
import com.fullstack.cbt.dto.ProblemDTO;
import com.fullstack.cbt.dto.SubjectDTO;

public interface ProblemSaveDAO {

	ArrayList<SubjectDTO> subjectList(String loginId);

	ArrayList<ProblemDTO> problemSaveList(String loginId, int skip);

	ArrayList<ProblemDTO> selectedSaveList(String loginId, String su_idx, int skip);

	int problemSaveDel(String[] chkArr);

	int getTotal(String loginId);

	int selectedTotal(String loginId, String su_idx);




}
