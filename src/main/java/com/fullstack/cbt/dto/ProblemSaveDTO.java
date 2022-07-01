package com.fullstack.cbt.dto;

import java.sql.Timestamp;

public class ProblemSaveDTO {

	private int ps_idx;
	private Timestamp ps_date;
	private int pc_idx;
	private String mb_id;
	
	public int getPs_idx() {
		return ps_idx;
	}
	public void setPs_idx(int ps_idx) {
		this.ps_idx = ps_idx;
	}
	public Timestamp getPs_date() {
		return ps_date;
	}
	public void setPs_date(Timestamp ps_date) {
		this.ps_date = ps_date;
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
