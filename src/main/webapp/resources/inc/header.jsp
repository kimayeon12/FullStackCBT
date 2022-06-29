<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8"/>
        <title>풀스택(Full-Stack) CBT</title>
        <script src="//code.jquery.com/jquery-latest.min.js"></script>
        <!-- 아래 script, link는 페이징 처리하려고 추가한 것  -->
        <script type="text/javascript" src="resources/js/jquery.twbsPagination.js"></script>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
		<script type="text/javascript" src="resources/js/jquery.twbsPagination.js"></script>
        <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <!-- 위 사항까지 추가했슴  -->
        <link rel="stylesheet" href="resources/css/common.css" type="text/css"/>
        <link rel="stylesheet" href="//fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"/>
    </head>
<!-- 틀 확인하려고 내가 만든 것, 나중에 지울 예정 -->
<style>
	table, th, td{
        border: 1px solid black;
    }

</style>
    <body>
        <div id="wrap">
            <nav>
				<p id="logo"><a href="javascript:;">풀스택(Full-Stack) CBT</a></p>
				<ul>
                    <!-- 관리자 메뉴 -->
                    <li><a href="javascript:;">메인</a></li>
                    <li><a href="javascript:;">CBT 시험관리</a></li>
                    <li><a href="javascript:;">문제 출제 관리</a></li>
                    <li><a href="javascript:;">과목 관리</a></li>
                    <li><a href="javascript:;">과목 단원 관리</a></li>
                    <li><a href="javascript:;">회원 관리</a></li>
                    <li><a href="javascript:;">이의제기 관리</a></li>
                    <li><a href="javascript:;">1:1게시판 관리</a></li>

                    <!-- 사용자 메뉴 -->
					<li><a href="javascript:;">메인</a></li>
                    <li><a href="javascript:;">시험 응시</a></li>
                    <li><a href="javascript:;">내가 응시한 시험</a></li>
                    <li><a href="javascript:;">문제 보관함</a></li>
                    <li><a href="javascript:;">1:1게시판</a></li>
				</ul>
			</nav>
            <div id="container">
                <aside><strong>홍길동(hgd1234)</strong>님 <a href="javascript:;">내정보</a> | <a href="javascript:;">로그아웃</a> <a href="javascript:;">관리자페이지 이동 혹은 사용자페이지로 이동</a></aside>