<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8"/>
        <title>풀스택(Full-Stack) CBT</title>
        <script src="//code.jquery.com/jquery-latest.min.js"></script>
        <link rel="stylesheet" href="resources/css/common.css" type="text/css"/>
        <link rel="stylesheet" href="//fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"/>
    </head>
    <body>
        <div id="wrap">
            <nav>
				<p id="logo"><img src="resources/images/logo.jpg" alt="CBT" /></p>
                <c:if test="${sessionScope.isAdmin.equals('true')}">
				<ul id="adminMenu">
                    <li><a href="adminMain.do">관리자 메인</a></li>
                    <li><a href="cbtList.do">CBT 시험관리</a></li>
                    <li><a href="problemList.do">문제 출제 관리</a></li>
                    <li><a href="adminSubjectManagement.do">과목 관리</a></li>
                    <li><a href="adminSubjectChapterManagement.do">과목 단원 관리</a></li>
                    <li><a href="adminMemberList.do">회원 관리</a></li>
                    <li><a href="objectionList.do">이의제기 관리</a></li>
                    <li><a href="adminInquiryList.go">1:1게시판 관리</a></li>
                </ul>
                </c:if>
				
                <ul>
					<li><a href="main.go">메인</a></li>
                    <li><a href="testStart.do">시험 응시</a></li>
                    <li><a href="myTestList.do">내가 응시한 시험</a></li>
                    <li><a href="problemSave.do">문제 보관함</a></li>
                    <li><a href="inquiryList.go">1:1게시판</a></li>
				</ul>
			</nav>
            <div id="container">
				<c:if test="${sessionScope.loginId != null}">
                <aside><strong>${sessionScope.loginName}(${sessionScope.loginId})</strong>님 <a href="myPage.do">내정보</a> <span>|</span> <a href="logout.do">로그아웃</a><%--  <c:if test="${sessionScope.isAdmin.equals('true')}"><a href="adminMain.do" target="_blank">관리자페이지</a></c:if><c:if test="${!sessionScope.isAdmin.equals('true')}"><a href="main.go" target="_blank">사용자페이지</a></c:if> --%></aside>
				</c:if>