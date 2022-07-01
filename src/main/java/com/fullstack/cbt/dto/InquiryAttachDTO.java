package com.fullstack.cbt.dto;

import java.sql.Timestamp;

public class InquiryAttachDTO {

	private int ba_idx;
	private String ba_org_name;
	private String ba_new_name;
	private Timestamp ba_date;
	private String ba_ext;
	private int ib_idx;
	
	public int getBa_idx() {
		return ba_idx;
	}
	public void setBa_idx(int ba_idx) {
		this.ba_idx = ba_idx;
	}
	public String getBa_org_name() {
		return ba_org_name;
	}
	public void setBa_org_name(String ba_org_name) {
		this.ba_org_name = ba_org_name;
	}
	public String getBa_new_name() {
		return ba_new_name;
	}
	public void setBa_new_name(String ba_new_name) {
		this.ba_new_name = ba_new_name;
	}
	public Timestamp getBa_date() {
		return ba_date;
	}
	public void setBa_date(Timestamp ba_date) {
		this.ba_date = ba_date;
	}
	public String getBa_ext() {
		return ba_ext;
	}
	public void setBa_ext(String ba_ext) {
		this.ba_ext = ba_ext;
	}
	public int getIb_idx() {
		return ib_idx;
	}
	public void setIb_idx(int ib_idx) {
		this.ib_idx = ib_idx;
	}

}
