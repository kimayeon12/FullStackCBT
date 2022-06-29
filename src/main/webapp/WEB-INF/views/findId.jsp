<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<h1>아이디 찾기</h1>
<h>아이디는 가입시 입력한 이메일을 통해 찾을 수 있습니다.</h>
<form action="login.go" method="post" onsubmit="return findId()">
  <table>
   <tr>
		<th>아이디</th>
			<td>
				<input type="text" name="mb_id" id="name"/>
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
			<input type="button" value="아이디 찾기" onclick="location.href='login.go'"/>
         	<input type="button" value="취소" onclick="location.href='login.go'"/>
		</th>
	</tr>
</table>
  </form>
<%@ include file="../../resources/inc/footer.jsp" %>
	<script>
	function findId(){
		var id = $('#id');
		var email =$('#email');
			if(id.val()==""){
	            alert("아이디를 입력해주세요.");
	            id.focus();
	            return false;
			}else if(email.val()==""){
	           alert("이메일을 입력해주세요.");
	           email.focus(); 
	           return false;
	        }

	}
	</script>
</html>