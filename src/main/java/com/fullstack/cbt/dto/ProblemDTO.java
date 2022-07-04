package com.fullstack.cbt.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class ProblemDTO {

	private int pc_idx;
	private String pc_problem;
	private String pc_answer1;
	private String pc_answer2;
	private String pc_answer3;
	private String pc_answer4;
	private short pc_answer;
	private String pc_explan;
	private char pc_difficulty;
	private Timestamp pc_date;
	private int su_idx;
	private int sc_idx;
	private String mb_id;
	private byte ta_choice_no;
	private char ta_is_answer;
	private byte ta_problem_no;
	private int tt_idx;
	//과목명 가져오기 테스트
	private String su_name;
	//과목 단원명 가져오기 테스트
	private String sc_name;
	private Timestamp ps_date;
	private int ps_idx;
	private int cnt;
	
	/*임시 정답률 테스트*/
	private int answerPercent;
	private int saveCnt;
	
	
	public int getAnswerPercent() {
		return answerPercent;
	}
	public void setAnswerPercent(int answerPercent) {
		this.answerPercent = answerPercent;
	}
	public int getSaveCnt() {
		return saveCnt;
	}
	public void setSaveCnt(int saveCnt) {
		this.saveCnt = saveCnt;
	}
	public int getTt_idx() {
		return tt_idx;
	}
	public void setTt_idx(int tt_idx) {
		this.tt_idx = tt_idx;
	}
	public byte getTa_choice_no() {
		return ta_choice_no;
	}
	public void setTa_choice_no(byte ta_choice_no) {
		this.ta_choice_no = ta_choice_no;
	}
	public char getTa_is_answer() {
		return ta_is_answer;
	}
	public void setTa_is_answer(char ta_is_answer) {
		this.ta_is_answer = ta_is_answer;
	}
	public byte getTa_problem_no() {
		return ta_problem_no;
	}
	public void setTa_problem_no(byte ta_problem_no) {
		this.ta_problem_no = ta_problem_no;
	}
	
	public String getSu_name() {
		return su_name;
	}
	public void setSu_name(String su_name) {
		this.su_name = su_name;
	}
	
	public String getSc_name() {
		return sc_name;
	}
	public void setSc_name(String sc_name) {
		this.sc_name = sc_name;
	}
	public int getPc_idx() {
		return pc_idx;
	}
	public void setPc_idx(int pc_idx) {
		this.pc_idx = pc_idx;
	}
	public String getPc_problem() {
		return pc_problem;
	}
	public void setPc_problem(String pc_problem) {
		this.pc_problem = pc_problem;
	}
	public String getPc_answer1() {
		return pc_answer1;
	}
	public void setPc_answer1(String pc_answer1) {
		this.pc_answer1 = pc_answer1;
	}
	public String getPc_answer2() {
		return pc_answer2;
	}
	public void setPc_answer2(String pc_answer2) {
		this.pc_answer2 = pc_answer2;
	}
	public String getPc_answer3() {
		return pc_answer3;
	}
	public void setPc_answer3(String pc_answer3) {
		this.pc_answer3 = pc_answer3;
	}
	public String getPc_answer4() {
		return pc_answer4;
	}
	public void setPc_answer4(String pc_answer4) {
		this.pc_answer4 = pc_answer4;
	}
	public short getPc_answer() {
		return pc_answer;
	}
	public void setPc_answer(short pc_answer) {
		this.pc_answer = pc_answer;
	}
	public String getPc_explan() {
		return pc_explan;
	}
	public void setPc_explan(String pc_explan) {
		this.pc_explan = pc_explan;
	}
	public char getPc_difficulty() {
		return pc_difficulty;
	}
	public void setPc_difficulty(char pc_difficulty) {
		this.pc_difficulty = pc_difficulty;
	}
	public Timestamp getPc_date() {
		return pc_date;
	}
	public void setPc_date(Timestamp pc_date) {
		this.pc_date = pc_date;
	}
	public int getSu_idx() {
		return su_idx;
	}
	public void setSu_idx(int su_idx) {
		this.su_idx = su_idx;
	}
	public int getSc_idx() {
		return sc_idx;
	}
	public void setSc_idx(int sc_idx) {
		this.sc_idx = sc_idx;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public Timestamp getPs_date() {
		return ps_date;
	}
	public void setPs_date(Timestamp ps_date) {
		this.ps_date = ps_date;
	}
	public int getPs_idx() {
		return ps_idx;
	}
	public void setPs_idx(int ps_idx) {
		this.ps_idx = ps_idx;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
}
