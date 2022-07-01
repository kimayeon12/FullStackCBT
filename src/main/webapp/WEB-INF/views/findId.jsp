<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<h1>아이디 찾기</h1>
<h2>아이디는 가입시 입력한 이메일을 통해 찾을 수 있습니다.</h2>
<form action="findId.do" method="post" onsubmit="return findId()">
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
<%@ include file="../../resources/inc/footer.jsp" %>
	<script>
	function findId(){
		var name = $('#name');
		var email =$('#email');
			if(name.val()==""){
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
		location.href='findId.go';
	}
	</script>
</html>