package com.fullstack.cbt.dto;

public class SubjectChapterDTO {

	private int sc_idx;
	private String sc_name;
	private int su_idx;
	
	//SubjectChapterTable에 없는것 추가
	private int pc_idx;
	private String su_name;
	private int subCnt;
	private int chapCnt;
	
	public int getChapCnt() {
		return chapCnt;
	}
	public void setChapCnt(int chapCnt) {
		this.chapCnt = chapCnt;
	}
	public int getSubCnt() {
		return subCnt;
	}
	public void setSubCnt(int subCnt) {
		this.subCnt = subCnt;
	}
	public int getPc_idx() {
		return pc_idx;
	}
	public void setPc_idx(int pc_idx) {
		this.pc_idx = pc_idx;
	}
	public String getSu_name() {
		return su_name;
	}
	public void setSu_name(String su_name) {
		this.su_name = su_name;
	}
	public int getSc_idx() {
		return sc_idx;
	}
	public void setSc_idx(int sc_idx) {
		this.sc_idx = sc_idx;
	}
	public String getSc_name() {
		return sc_name;
	}
	public void setSc_name(String sc_name) {
		this.sc_name = sc_name;
	}
	public int getSu_idx() {
		return su_idx;
	}
	public void setSu_idx(int su_idx) {
		this.su_idx = su_idx;
	}

}
