package com.fullstack.cbt.dao;

import java.util.ArrayList;

public interface ProblemDAO {

	ArrayList<String> subjectList();

	ArrayList<String> chapList(String subject);

}
