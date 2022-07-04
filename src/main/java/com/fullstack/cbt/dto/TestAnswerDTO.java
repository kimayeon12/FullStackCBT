package com.fullstack.cbt.dto;

public class TestAnswerDTO {

    private int ta_idx;
    private byte ta_problem_no;
    private byte ta_choice_no;
    private char ta_is_answer;
    private int tt_idx;
    private int pc_idx;
    
    /*정답률 컬럼 추가*/
    private int answerRate;
    
    
    
    public int getAnswerRate() {
		return answerRate;
	}
	public void setAnswerRate(int answerRate) {
		this.answerRate = answerRate;
	}
	public int getTa_idx() {
        return ta_idx;
    }
    public void setTa_idx(int ta_idx) {
        this.ta_idx = ta_idx;
    }
    public byte getTa_problem_no() {
        return ta_problem_no;
    }
    public void setTa_problem_no(byte ta_problem_no) {
        this.ta_problem_no = ta_problem_no;
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
    public int getTt_idx() {
        return tt_idx;
    }
    public void setTt_idx(int tt_idx) {
        this.tt_idx = tt_idx;
    }
    public int getPc_idx() {
        return pc_idx;
    }
    public void setPc_idx(int pc_idx) {
        this.pc_idx = pc_idx;
    }

}