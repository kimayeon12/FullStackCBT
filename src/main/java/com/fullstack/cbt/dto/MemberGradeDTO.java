package com.fullstack.cbt.dto;

import java.sql.Timestamp;

public class MemberGradeDTO {

	private int mg_idx;
	private String mg_id;
	private String mg_grade_before;
	private String mg_grade_after;
	private String mg_content;
	private Timestamp mg_date;
	private String mb_id;
	
	public int getMg_idx() {
		return mg_idx;
	}
	public void setMg_idx(int mg_idx) {
		this.mg_idx = mg_idx;
	}
	public String getMg_id() {
		return mg_id;
	}
	public void setMg_id(String mg_id) {
		this.mg_id = mg_id;
	}
	public String getMg_grade_before() {
		return mg_grade_before;
	}
	public void setMg_grade_before(String mg_grade_before) {
		this.mg_grade_before = mg_grade_before;
	}
	public String getMg_grade_after() {
		return mg_grade_after;
	}
	public void setMg_grade_after(String mg_grade_after) {
		this.mg_grade_after = mg_grade_after;
	}
	public String getMg_content() {
		return mg_content;
	}
	public void setMg_content(String mg_content) {
		this.mg_content = mg_content;
	}
	public Timestamp getMg_date() {
		return mg_date;
	}
	public void setMg_date(Timestamp mg_date) {
		this.mg_date = mg_date;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

}
