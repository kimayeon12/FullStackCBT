<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<h1>새 비밀번호 설정</h1>
<h2>비밀번호는 DB에 암호화 되어 저장되므로 새로운 비밀번호를 설정해야 합니다.</h2>
<form action="pwChange.do" method="post" onsubmit="return pwChange()">
	<table>
        <tr>
			<th>아이디</th>
			<td>${mb_id}</td>
		</tr>
        <tr>
			<th>새 비밀번호</th>
			<td><input type="password" name="pw" id="pw"/></td>
		</tr>
        <tr>
			<td>새 비밀번호 확인</td>
			<td><input type="password" name="pw2" id="pw2"/></td>
		</tr>
        <tr>
			<th colspan="2">
			<input type="submit" value="비밀번호 설정"/>
            <input type="button" value="취소"/>
			</th>
		</tr>
	</table>
</form>
<%@ include file="../../resources/inc/footer.jsp" %>
	<script>
	function pwChange(){
		var $pw = $('#pw');
		var $pw2 = $('#pw2');
        var expPw = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,20}$/;
		
		if($pw.val()==""){
            alert("새 비밀번호를 입력해주세요.");
            $pw.focus();
            return false;
		}else if(!expPw.test($pw.val())){
        	alert("새 비밀번호는 8 ~ 20자 영문, 숫자, 특수문자를 최소 한가지씩 조합으로 작성해주세요.");
        	$pw.val('');
        	$pw2.val('');
        	$pw.focus();
        	return false;  
		}else if($pw2.val()==""){
            alert("새 비밀번호 확인을 입력해주세요.");
            $pw2.focus();
            return false;
		}else if($pw.val()!=$pw2.val()) {
			alert("비밀번호가 일치하지 않습니다.");
			$pw2.val('').focus();
			return false;
		}

	}
	
	var msg = "${msg}";
	
	if(msg != "") {
		alert(msg);
		location.href='pwChange.go';
	}
	</script>
</html>