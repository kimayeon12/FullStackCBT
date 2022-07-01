<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<h1>비밀번호 찾기</h1>
<h2>비밀번호는 가입시 입력한 이메일을 통해 찾을 수 있습니다.</h2>
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
			<td>이메일</td>
			<td><input type="text" name="mb_email" id="email"/></td>
		</tr>
        <tr>
			<th colspan="2">
			<input type="submit" value="비밀번호 찾기"/>
            <input type="button" value="취소"/>
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