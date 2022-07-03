package com.fullstack.cbt.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fullstack.cbt.dao.TestDAO;
import com.fullstack.cbt.dto.ProblemDTO;
import com.fullstack.cbt.dto.SubjectChapterDTO;
import com.fullstack.cbt.dto.SubjectDTO;
import com.fullstack.cbt.dto.TestDTO;

@Service
public class TestService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired TestDAO dao;
	
	public ArrayList<SubjectDTO> subjectList() {
		logger.info("등록된 과목 가져오기 서비스 요청");
		
		return dao.subjectList();
	}

	public ArrayList<SubjectChapterDTO> subjectChapterList(String su_idx) {
		logger.info("시험 응시 과목의 과목 단원 가져오기 서비스 요청 : "+su_idx);
		
		return dao.subjectChapterList(su_idx);
	}

	public int isBeforeProblem(int pc_idx, String loginId) {
		logger.info("해당 회원(" + loginId + ") 시험 문제 푼 내역이 있는지 서비스 요청 : "+pc_idx);
		
		return dao.isBeforeProblem(pc_idx, loginId);
	}

	public ProblemDTO getProblem(HashMap<String, Object> map) {
		logger.info("문제출제 서비스 요청"+map);
		
		return dao.getProblem(map);
	}

	public String getCurrentTimestamp() {
		return dao.getCurrentTimestamp();
	}

	public String getUnixTimestamp() {
		return dao.getUnixTimestamp();
	}

	public int getTestTimes(int su_idx, String mb_id) {
		logger.info("해당 회원(" + mb_id + ") 과 해당 과목(" + mb_id + ") 회차 가져오기 서비스 요청");
		
		return dao.getTestTimes(su_idx, mb_id);
	}

	public int getProblemAnswer(int idx) {
		logger.info("문제 정답 서비스 요청");
		
		return dao.getProblemAnswer(idx);
	}

	public int testReg(HashMap<String, Object> params) {
		logger.info("시험 제출"+params);
		
		TestDTO dto = new TestDTO();
		dto.setMb_id((String) params.get("mb_id"));
		dto.setSu_idx((int) Integer.parseInt(String.valueOf(params.get("su_idx"))));
		dto.setTt_start_date((Timestamp) params.get("tt_start_date"));
		
		long startDate = dto.getTt_start_date().getTime()/1000;
		long endDate = Long.valueOf(getUnixTimestamp().toString());
		
		dto.setTt_score((byte) Byte.parseByte(String.valueOf(params.get("tt_score"))));
		dto.setTt_status((String) params.get("tt_status"));
		
		if(endDate - startDate >= 600) {
			dto.setTt_status("시간초과 제출");
		}
		
		dto.setTt_times((byte) Byte.parseByte(String.valueOf(params.get("tt_times"))));
		
		dao.testReg(dto);
		
		return dto.getTt_idx();
	}

	public boolean testAnswerReg(HashMap<String, Object> map) {
		logger.info("시험 답안 제출"+map);
		
		return dao.testAnswerReg(map);
	}

	public TestDTO testResult(String tt_idx) {
		logger.info("테스트 결과 서비스 요청"  + tt_idx);
		return dao.testResult(tt_idx);
	}
	
	public ArrayList<TestDTO> myTestList(HashMap<String, Object> params) {
		logger.info("시험 리스트 가져오기 서비스 요청");
		return dao.myTestList(params);
	}

	public int myTestTotal(HashMap<String, Object> params) {
		logger.info("게시글 수 가져오기 서비스 요청");
		return dao.myTestTotal(params);
	}

	public TestDTO testInfo(String tt_idx) {
		logger.info("시험 정보 서비스 요청");
		return dao.testInfo(tt_idx);
	}

	public ArrayList<ProblemDTO> testDetail(String tt_idx, String loginId) {
		logger.info("상세보기 서비스 요청");
		return dao.testDetail(tt_idx, loginId);
	}

	public boolean problemSave(int pc_idx, String loginId) {
		logger.info("문제보관 서비스 요청");
		return dao.problemSave(pc_idx, loginId);
	}

	public boolean problemDelete(int pc_idx, String loginId) {
		logger.info("문제보관 삭제 서비스 요청");
		return dao.problemDelete(pc_idx, loginId);
	}

	
	
}
