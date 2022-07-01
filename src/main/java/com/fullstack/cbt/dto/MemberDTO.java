package com.fullstack.cbt.dto;

import java.sql.Timestamp;

public class MemberDTO {

	private String mb_id;
	private String mb_pw;
	private String mb_name;
	private String mb_email;
	private Timestamp mb_date;
	private String mb_grade;
	
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public String getMb_pw() {
		return mb_pw;
	}
	public void setMb_pw(String mb_pw) {
		this.mb_pw = mb_pw;
	}
	public String getMb_name() {
		return mb_name;
	}
	public void setMb_name(String mb_name) {
		this.mb_name = mb_name;
	}
	public String getMb_email() {
		return mb_email;
	}
	public void setMb_email(String mb_email) {
		this.mb_email = mb_email;
	}
	public Timestamp getMb_date() {
		return mb_date;
	}
	public void setMb_date(Timestamp mb_date) {
		this.mb_date = mb_date;
	}
	public String getMb_grade() {
		return mb_grade;
	}
	public void setMb_grade(String mb_grade) {
		this.mb_grade = mb_grade;
	}

}
