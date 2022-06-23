<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
	<h1>회원가입 페이지</h1>
	<form action="joinForm.do" method="post" onsubmit="return joinForm()">
        <table>
            <tr>
                <td>아이디</td>
                <td><input type="text" id="id"/></td>
                <td><button>아이디 중복체크</button></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="id" id="pw"/></td>
            </tr>
            <tr>
                <td>비밀번호 확인</td>
                <td><input type="password" name="id2" id="pw2"/></td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input type="text" name="id" id="name"/></td>
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
	        var pw=$("#pw");
	        var pw2=$("#pw2");
	        var name=$("#name")
	        //console.log('test'); 
	        if(id.val()==""){
	            alert("아이디를 입력해주세요.");
	            id.focus();
	            return false;
	        }else if(email.val()==""){
	           alert("이메일을 입력해주세요.");
	           email.focus();
	           return false;
	        }else if(pw.val()==""){
	           alert("비밀번호를 입력해주세요.");
	           pw.focus();
	           return false;
	        }else if (pw2.val()==""){
	        	alert("비밀번호를 확인해주세요.");
	        	pw2.focus();
	        	return false;
	        }else if(name.val()==""){
	        	alert("이름을 입력해주세요.");
	        	name.focus();
	        }
	    }
	</script>
</html>