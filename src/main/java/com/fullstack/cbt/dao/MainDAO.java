package com.fullstack.cbt.dao;

import java.util.ArrayList;

import com.fullstack.cbt.dto.InquiryDTO;
import com.fullstack.cbt.dto.ObjectionDTO;
import com.fullstack.cbt.dto.TestDTO;

public interface MainDAO {

	ArrayList<TestDTO> cbtTestList();

	ArrayList<ObjectionDTO> objectionList();

	ArrayList<InquiryDTO> inquiryList();

}
