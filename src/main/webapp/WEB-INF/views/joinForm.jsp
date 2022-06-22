<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
	<h1>회원가입 페이지</h1>
	<form action="join" method="post" onsubmit="return joinForm()">
        <table>
            <br>
            <br>
            <tr>
                <td>아이디</td>
                <td><input type="text" id="id"/></td>
                <td><button>아이디 중복체크</button></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" id="pw"/></td>
            </tr>
            <tr>
                <td>비밀번호 확인</td>
                <td><input type="password" id="pw2"/></td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input type="text" id="name"/></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td><input type="text" id="email"/></td>
                <td><button>이메일 중복체크</button></td>
            </tr>
            <tr>
                <th colspan="2">
                    <input type="submit" value="회원가입"/>
                </th>
            </tr>
        </table>
     </form>
<%@ include file="../../resources/inc/footer.jsp" %>
	<script>
		function joinForm(){
	        var id = $("#id");
	        var email =$("#email");
	        var pw
	        //console.log('test');
	        if(id.val()==""){
	            alert("아이디를 입력해주세요.");
	            id.focus();
	        }else if(email.val()==""){
	           alert("이메일을 입력해주세요.");
	           email.focus();
	        }else {
	           alert("아이디 중복체크를 진행해주세요.");
	           id.focus();
	        }
	    }
	</script>
</html>