package com.fullstack.cbt.dto;

import java.sql.Timestamp;

public class ObjectionDTO {

	private int oj_idx;
	private String oj_content;
	private Timestamp oj_date;
	private String oj_status;
	private String oj_admin_id;
	private Timestamp oj_proc_date;
	private String oj_memo;
	private int pc_idx;
	private String mb_id;
	
	//새로 지정해준 컬럼
	private String oj_problem;
	//cbt_problem_carete 테이블에서 가져온 것
	private String pc_problem;
	
	
	
	public String getOj_problem() {
		return oj_problem;
	}
	public void setOj_problem(String oj_problem) {
		this.oj_problem = oj_problem;
	}
	public String getPc_problem() {
		return pc_problem;
	}
	public void setPc_problem(String pc_problem) {
		this.pc_problem = pc_problem;
	}
	
	
	
	public int getOj_idx() {
		return oj_idx;
	}
	public void setOj_idx(int oj_idx) {
		this.oj_idx = oj_idx;
	}
	public String getOj_content() {
		return oj_content;
	}
	public void setOj_content(String oj_content) {
		this.oj_content = oj_content;
	}
	public Timestamp getOj_date() {
		return oj_date;
	}
	public void setOj_date(Timestamp oj_date) {
		this.oj_date = oj_date;
	}
	public String getOj_status() {
		return oj_status;
	}
	public void setOj_status(String oj_status) {
		this.oj_status = oj_status;
	}
	public String getOj_admin_id() {
		return oj_admin_id;
	}
	public void setOj_admin_id(String oj_admin_id) {
		this.oj_admin_id = oj_admin_id;
	}
	public Timestamp getOj_proc_date() {
		return oj_proc_date;
	}
	public void setOj_proc_date(Timestamp oj_proc_date) {
		this.oj_proc_date = oj_proc_date;
	}
	public String getOj_memo() {
		return oj_memo;
	}
	public void setOj_memo(String oj_memo) {
		this.oj_memo = oj_memo;
	}
	public int getPc_idx() {
		return pc_idx;
	}
	public void setPc_idx(int pc_idx) {
		this.pc_idx = pc_idx;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

}
