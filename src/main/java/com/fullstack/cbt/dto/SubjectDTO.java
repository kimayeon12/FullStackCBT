package com.fullstack.cbt.dto;

public class SubjectDTO {

	private int su_idx;
	private String su_name;
	private short su_is_blind;
	private int sc_idx;
	private int pc_idx;
	private int tt_idx;
	private String mb_id;
	
	//과목DTO에 없는것 추가
	private int chapCnt;
	private int proCnt;
	private int ttCnt;
	private int testerCnt;

	public int getTtCnt() {
		return ttCnt;
	}
	public void setTtCnt(int ttCnt) {
		this.ttCnt = ttCnt;
	}
	public int getTesterCnt() {
		return testerCnt;
	}
	public void setTesterCnt(int testerCnt) {
		this.testerCnt = testerCnt;
	}
	public int getChapCnt() {
		return chapCnt;
	}
	public void setChapCnt(int chapCnt) {
		this.chapCnt = chapCnt;
	}
	public int getProCnt() {
		return proCnt;
	}
	public void setProCnt(int proCnt) {
		this.proCnt = proCnt;
	}
	public int getSc_idx() {
		return sc_idx;
	}
	public void setSc_idx(int sc_idx) {
		this.sc_idx = sc_idx;
	}
	public int getPc_idx() {
		return pc_idx;
	}
	public void setPc_idx(int pc_idx) {
		this.pc_idx = pc_idx;
	}
	public int getTt_idx() {
		return tt_idx;
	}
	public void setTt_idx(int tt_idx) {
		this.tt_idx = tt_idx;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
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
