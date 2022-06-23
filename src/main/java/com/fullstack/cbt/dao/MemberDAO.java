package com.fullstack.cbt.dao;

public interface MemberDAO {
	//DAO란 DB데이터에 접근하기 위한 객체
	String login(String mb_id, String mb_pw);

	String joinForm(String mb_id, String mb_pw, String mb_pw2, String mb_name, String mb_email);

}
