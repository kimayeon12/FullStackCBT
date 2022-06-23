<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<body>
	<h1>로그인 페이지</h1>
	<form action="login.do"  method="POST" onsubmit="return login()">
        <table>
		            <tr>
		                <th>아이디</th>
		                <td>
		                	<input type="text" name="id" id="id"/>
		                </td>
		            </tr>
		            <tr>
		                <th>비밀번호</th>
		                <td>
		                	<input type="password" name="pw" id="pw"  maxlength="20"/>
		                </td>
		            </tr>
		            <tr>
		                <th colspan="2">
			                <input type="submit" value="로그인" />
			                <input type="button" value="회원가입"/>
		                </th>
		            </tr>
        <tr>
            <th colspan="2">
	            <input type="button" value="아이디 찾기"/>
	            <input type="button" value="비밀번호 찾기"/>
            </th>
        </tr>
    </table>
    </form>
  </body>
<%@ include file="../../resources/inc/footer.jsp" %>
	<script>
		function login(){
	        //console.log('test');
	        var id = $("#id");
			var pw = $("#pw");
	        if(id.val()==""){
	            alert("아이디를 입력해주세요.");
	            id.focus();
	            return false;
			}else if(pw.val()==""){
	           alert("비밀번호를 입력해주세요.");
	           pw.focus(); 
	           return false;
	        }
	    }
		
		var msg="${msg}";
		if(msg !=""){
			alert(msg);
		}
	</script>
</html>