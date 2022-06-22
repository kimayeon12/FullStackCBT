<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<%@ include file="../../resources/inc/footer.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>문제출제관리 - 수정</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	table, th, td{
        border: 1px solid black;
    }
</style>
</head>
<body>
<div>문제 출제 관리 - 수정</div>
	<form action="problemUpdate.do" method="post">
	<table>
		<tr>
			<th>과목명</th>
			<td>
				<select id="select_main">
					<option value="" selected>과목명</option>
                    <option value="JAVA">JAVA</option>
                    <option value="js/jQuery">js/jQuery</option>
                    <option value="MariaDB">MariaDB(MySQL)</option>
                </select>
			</td>
		</tr>
        <tr>
			<th>과목단원명</th>
			<td>
				<select id="select_sub">
					<option value="" selected>과목단원명</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>문제</th>
			<td><textarea rows="15" cols="30" name="problem"></textarea></td>
		</tr>
		<tr>
			<th>정답</th>
			<td>
				<input type="radio" name="answer" value="1">1
				<input type="radio" name="answer" value="2">2
				<input type="radio" name="answer" value="3">3
				<input type="radio" name="answer" value="4">4
			</td>
		</tr>
		<tr>
			<th>4지선다문항</th>
			<td>
				 ①: <input type="text" name="answer1"><br>
				 ②: <input type="text" name="answer2"><br>
				 ③: <input type="text" name="answer3"><br>
				 ④: <input type="text" name="answer4">
			</td>
		</tr>
		<tr>
			<th>해설</th>
			<td><textarea rows="5" cols="30" name="pc_explan"></textarea></td>
        </tr>
		<tr>
			<th>난이도</th>
			<td>
				<input type="radio" name="level" value="상">상
				<input type="radio" name="level" value="중">중
				<input type="radio" name="level" value="하">하
			</td>
		</tr>
		<tr>
			<th colspan="2">
			<input type="submit" value="저장"/>
			<input type="button" value="목록" onclick="location.href='adminProblemList.go'"/>
			</th>
		</tr>
	</table>
	</form>
</body>
<script></script>
</html>