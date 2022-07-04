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
        <div id="findId">
			<h1>아이디 찾기</h1>
			<form action="findId.do" method="POST" onsubmit="return findId()">
				<table>
				   <tr>
						<th>이름</th>
							<td>
								<input type="text" name="mb_name" id="name"/>
							</td>
					</tr>
				     <tr>
						<th>이메일</th>
						<td>
							<input type="text" name="mb_email" id="email"/>
						</td>
					</tr>
				     <tr>
						<th colspan="2">
							<input type="submit" value="아이디 찾기"/>
				         	<input type="button" value="취소" onclick="location.href='login.go'"/>
						</th>
					</tr>
				</table>
			</form>
		</div>
<%@ include file="../../resources/inc/footer.jsp" %>
	<script>
	function findId(){
		var $name = $("#name");
		var $email =$("#email");
		var expEmail = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.[a-zA-Z]{2,4}$/;
			
		if($name.val()==""){
           alert("이름을 입력해주세요.");
           $name.focus();
           return false;
           
		}if($email.val()==""){
          alert("이메일을 입력해주세요.");
          $email.focus();
          return false;
          
		}if(!expEmail.test($email.val())){
	       	alert("이메일 형식이 아닙니다.");
	       	$email.val('');
	       	$email.focus();
	       	return false;  
		}

	}
	</script>
</html>