package com.fullstack.cbt.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.fullstack.cbt.controller.Criteria;
import com.fullstack.cbt.dto.ObjectionDTO;
import com.fullstack.cbt.dto.ProblemDTO;

public interface ObjectionDAO {

	ProblemDTO problemDto(String pc_idx);

	int objectionInsert(String content, String pc_idx, String loginId);

	ArrayList<ObjectionDTO> objectionList();

	ArrayList<ObjectionDTO> objectionSelectList(String oj_status, String oj_searchOption, String keyword);

	public ArrayList<ObjectionDTO> getListPaging(Criteria cri);

	public int getTotal(Criteria cri);

	ObjectionDTO objectionDetail(String oj_idx);

	ArrayList<ObjectionDTO> status();

	int objectionUpdate(HashMap<String, Object> params);


}
