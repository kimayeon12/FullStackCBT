package com.fullstack.cbt.dao;

import java.util.ArrayList;

import com.fullstack.cbt.dto.ProblemDTO;
import com.fullstack.cbt.dto.SubjectDTO;

public interface ProblemSaveDAO {

	ArrayList<SubjectDTO> subjectList(String loginId);

	ArrayList<ProblemDTO> problemSaveList(String loginId);

	ArrayList<ProblemDTO> selectedSaveList(String loginId, String su_idx);

	int problemSaveDel(String[] chkArr);

}
