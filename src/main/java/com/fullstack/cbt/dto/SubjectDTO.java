package com.fullstack.cbt.dto;

public class SubjectDTO {

	private int su_idx;
	private String su_name;
	private short su_is_blind;
	
	public int getSu_idx() {
		return su_idx;
	}
	public void setSu_idx(int su_idx) {
		this.su_idx = su_idx;
	}
	public String getSu_name() {
		return su_name;
	}
	public void setSu_name(String su_name) {
		this.su_name = su_name;
	}
	public short getSu_is_blind() {
		return su_is_blind;
	}
	public void setSu_is_blind(short su_is_blind) {
		this.su_is_blind = su_is_blind;
	}

}
