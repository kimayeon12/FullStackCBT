package com.fullstack.cbt.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fullstack.cbt.dao.MainDAO;
import com.fullstack.cbt.dto.InquiryDTO;
import com.fullstack.cbt.dto.ObjectionDTO;
import com.fullstack.cbt.dto.TestDTO;

@Service
public class MainService {

	@Autowired MainDAO dao;
	
	public ArrayList<TestDTO> cbtTestList() {
		return dao.cbtTestList();
	}

	public ArrayList<ObjectionDTO> objectionList() {
		return dao.objectionList();
	}
	
	public ArrayList<InquiryDTO> inquiryList() {
		return dao.inquiryList();
	}

}
