package com.fullstack.cbt.dao;

import java.util.ArrayList;

import com.fullstack.cbt.dto.SubjectDTO;

public interface SubjectDAO {

	int reg(String subject, int chk);

	ArrayList<SubjectDTO> list();

	String overlay(String chkSub);

}
