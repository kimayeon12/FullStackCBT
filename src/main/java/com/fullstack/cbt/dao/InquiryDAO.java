package com.fullstack.cbt.dao;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import com.fullstack.cbt.dto.InquiryAttachDTO;
import com.fullstack.cbt.dto.InquiryDTO;

public interface InquiryDAO {



	




	ArrayList<InquiryDTO> inquiryList();


	int write(InquiryDTO dto);


	void fileWrite(String ba_org_name, String ba_new_name, int ib_idx);


	InquiryDTO inquiryDetail(String ib_idx);


	ArrayList<InquiryAttachDTO> photoList(String ib_idx);


	int del(String ib_idx);


	ArrayList<InquiryDTO> adminInquiryList();


	InquiryDTO adminInquiryDetail(String ib_idx);


	ArrayList<InquiryAttachDTO> adminPhotoList(String ib_idx);


	

	int del2(String ib_idx);


	int update(HashMap<String, String> params);


	int adUpdate(HashMap<String, String> params);


	ArrayList<InquiryAttachDTO> photoList2(String ba_idx);


	int del3(String ba_idx);

	ArrayList<InquiryDTO> adSearchList(String ib_keyword, String ib_searchOption, String ib_status);


	ArrayList<InquiryDTO> searchList( String ib_keyword, String ib_searchOption, String ib_status);



	


	

	










	

	


	


	


	

}
