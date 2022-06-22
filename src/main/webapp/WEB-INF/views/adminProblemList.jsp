<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<%@ include file="../../resources/inc/footer.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>문제출제관리</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	table, th, td{
        border: 1px solid black;
    }
</style>
</head>
<body>
	<div>문제 출제 관리</div>
	<div>총 문제수 : </div>
		<form action="method" class="search">
			<select id="select_main">
				<option value="" selected>과목명</option>
				<option value="JAVA">JAVA</option>
				<option value="js/jQuery">js/jQuery</option>
				<option value="MariaDB">MariaDB(MySQL)</option>
			</select>
			<select id="select_sub">
				<option value="">과목단원선택</option>
			</select>
			<select id="search">
				<option value="전체" selected>전체</option>
				<option value="문제">문제</option>
				<option value="해설">해설</option>
				<option value="출제자 아이디">출제자 아이디</option>
			</select>
			<input type="text" maxlength="255">
			<input type="button" value="검색"/>
		</form>
		<table>
			<thead>
				<tr>
					<td>번호</td>
					<td>과목명</td>
					<td>단원명</td>
					<td>문제</td>
					<td>난이도</td>
					<td>정답률</td>
					<td>출제자 아이디</td>
					<td>출제일</td>
					<td>문제보관사용자수</td>
					<td>수정하기</td>
				</tr>
			</thead>
			<tbody id="list">
					
			</tbody>
		</table>
	<input type="button" value="새로운 문제 출제" onclick="location.href='adminProblemWrite.go'"/>
</body>
<script></script>
</html>