package com.fullstack.cbt.dto;

import java.sql.Timestamp;

public class InquiryDTO {

	private	int ib_idx;
	private	String ib_subject;
	private	String ib_content;
	private	String ib_answer;
	private Timestamp ib_reg_date;
	private	Timestamp ib_answer_date;
	private	String ib_admin_id;
	private	String ib_status;
	private	String ib_memo;
	private	String mb_id;
	private String ib_searchOption; //상태값
	private String ib_keyword; //검색키워드
	

	
	public int getIb_idx() {
		return ib_idx;
	}
	public void setIb_idx(int ib_idx) {
		this.ib_idx = ib_idx;
	}
	public String getIb_subject() {
		return ib_subject;
	}
	public void setIb_subject(String ib_subject) {
		this.ib_subject = ib_subject;
	}
	public String getIb_content() {
		return ib_content;
	}
	public void setIb_content(String ib_content) {
		this.ib_content = ib_content;
	}
	public String getIb_answer() {
		return ib_answer;
	}
	public void setIb_answer(String ib_answer) {
		this.ib_answer = ib_answer;
	}
	public Timestamp getIb_reg_date() {
		return ib_reg_date;
	}
	public void setIb_reg_date(Timestamp ib_reg_date) {
		this.ib_reg_date = ib_reg_date;
	}
	public Timestamp getIb_answer_date() {
		return ib_answer_date;
	}
	public void setIb_answer_date(Timestamp ib_answer_date) {
		this.ib_answer_date = ib_answer_date;
	}
	public String getIb_admin_id() {
		return ib_admin_id;
	}
	public void setIb_admin_id(String ib_admin_id) {
		this.ib_admin_id = ib_admin_id;
	}
	public String getIb_status() {
		return ib_status;
	}
	public void setIb_status(String ib_status) {
		this.ib_status = ib_status;
	}
	public String getIb_memo() {
		return ib_memo;
	}
	public void setIb_memo(String ib_memo) {
		this.ib_memo = ib_memo;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public String getIb_searchOption() {
		return ib_searchOption;
	}
	public void setIb_searchOption(String ib_searchOption) {
		this.ib_searchOption = ib_searchOption;
	}
	public String getIb_keyword() {
		return ib_keyword;
	}
	public void setIb_keyword(String ib_keyword) {
		this.ib_keyword = ib_keyword;
	}
}
