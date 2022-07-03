package com.fullstack.cbt.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.fullstack.cbt.dto.ProblemDTO;
import com.fullstack.cbt.dto.SubjectChapterDTO;
import com.fullstack.cbt.dto.SubjectDTO;
import com.fullstack.cbt.dto.TestDTO;

public interface TestDAO {

	ArrayList<SubjectDTO> subjectList();

	ArrayList<SubjectChapterDTO> subjectChapterList(String su_idx);

	int isBeforeProblem(int pc_idx, String loginId);

	ProblemDTO getProblem(HashMap<String, Object> map);

	String getCurrentTimestamp();

	String getUnixTimestamp();

	int getTestTimes(int su_idx, String mb_id);

	int getProblemAnswer(int idx);

	int testReg(TestDTO dto);

	boolean testAnswerReg(HashMap<String, Object> map);

	TestDTO testResult(String tt_idx);

	ArrayList<TestDTO> myTestList(HashMap<String, Object> params);

	int myTestTotal(HashMap<String, Object> params);

	TestDTO testInfo(String tt_idx);

	ArrayList<ProblemDTO> testDetail(String tt_idx, String loginId);

	boolean problemSave(int pc_idx, String loginId);

	boolean problemDelete(int pc_idx, String loginId);
}
