package com.fullstack.cbt.dao;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import com.fullstack.cbt.controller.Criteria;
import com.fullstack.cbt.controller.PageMaker2;
import com.fullstack.cbt.dto.InquiryAttachDTO;
import com.fullstack.cbt.dto.InquiryDTO;

public interface InquiryDAO {



	




	int write(InquiryDTO dto);


	void fileWrite(String ba_org_name, String ba_new_name, int ib_idx);


	InquiryDTO inquiryDetail(String ib_idx);


	ArrayList<InquiryAttachDTO> photoList(String ib_idx);


	int del(String ib_idx);


	InquiryDTO adminInquiryDetail(String ib_idx);


	ArrayList<InquiryAttachDTO> adminPhotoList(String ib_idx);

	

	int del2(String ib_idx);


	int update(HashMap<String, String> params);


	int adUpdate(HashMap<String, String> params);


	ArrayList<InquiryAttachDTO> photoList2(String ba_idx);


	int del3(String ba_idx);

	ArrayList<InquiryDTO> adSearchList(String ib_keyword, String ib_searchOption, String ib_status);


	
	//사용자 리스트 검색

	ArrayList<InquiryDTO> inquirySearch(PageMaker2 pageMaker);

	int listPageCount(PageMaker2 pageMaker);
	
	//관리자 리스트 검색

	ArrayList<InquiryDTO> adInquirySearch(PageMaker2 pageMaker);
	
	int adListPageCount(PageMaker2 pageMaker);


	


	

	



	


	

	










	

	


	


	


	

}
