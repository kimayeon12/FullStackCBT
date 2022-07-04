<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <div id="findPw">
			<h1>비밀번호 찾기</h1>
			<form action="findPw.do" method="POST" onsubmit="return findPw()">
				<table>
			        <tr>
						<th>아이디</th>
						<td><input type="text" name="mb_id" id="id"/></td>
					</tr>
			        <tr>
						<th>이름</th>
						<td><input type="text" name="mb_name" id="name"/></td>
					</tr>
			        <tr>
						<th>이메일</th>
						<td><input type="text" name="mb_email" id="email"/></td>
					</tr>
			        <tr>
						<th colspan="2">
							<input type="submit" value="비밀번호 찾기"/>
				            <input type="button" value="취소" onclick="location.href='login.go'"/>
						</th>
					</tr>
				</table>
			</form>
<%@ include file="../../resources/inc/footer.jsp" %>
	<script>
	function findPw(){
		var id = $('#id');
		var name = $('#name');
		var email =$('#email');
			if(id.val()==""){
	            alert("아이디를 입력해주세요.");
	            id.focus();
	            return false;
			}else if(name.val()==""){
	            alert("이름을 입력해주세요.");
	            name.focus();
	            return false;
			}else if(email.val()==""){
	           alert("이메일을 입력해주세요.");
	           email.focus(); 
	           return false;
	        }

	}
	
	var msg = "${msg}";
	
	if(msg != "") {
		alert(msg);
		location.href='findPw.go';
	}
	</script>
</html>