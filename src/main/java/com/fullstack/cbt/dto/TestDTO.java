package com.fullstack.cbt.dto;

import java.sql.Timestamp;

public class TestDTO {

	private int tt_idx;
	private byte tt_times;
	private byte tt_score;
	private Timestamp tt_start_date;
	private Timestamp tt_end_date;
	private String tt_status;
	private String mb_id;
	private int su_idx;
	private String su_name;
	private String mb_name;
	
	public String getMb_name() {
		return mb_name;
	}
	public void setMb_name(String mb_name) {
		this.mb_name = mb_name;
	}
	
	public String getSu_name() {
		return su_name;
	}
	public void setSu_name(String su_name) {
		this.su_name = su_name;
	}
	public int getTt_idx() {
		return tt_idx;
	}
	public void setTt_idx(int tt_idx) {
		this.tt_idx = tt_idx;
	}
	public byte getTt_times() {
		return tt_times;
	}
	public void setTt_times(byte tt_times) {
		this.tt_times = tt_times;
	}
	public byte getTt_score() {
		return tt_score;
	}
	public void setTt_score(byte tt_score) {
		this.tt_score = tt_score;
	}
	public Timestamp getTt_start_date() {
		return tt_start_date;
	}
	public void setTt_start_date(Timestamp tt_start_date) {
		this.tt_start_date = tt_start_date;
	}
	public Timestamp getTt_end_date() {
		return tt_end_date;
	}
	public void setTt_end_date(Timestamp tt_end_date) {
		this.tt_end_date = tt_end_date;
	}
	public String getTt_status() {
		return tt_status;
	}
	public void setTt_status(String tt_status) {
		this.tt_status = tt_status;
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

}
