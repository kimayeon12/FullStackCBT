<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<style>
table {
	border : 1px solid black;
	border-collapse : collapse;
	width: 50%;
}
th,td {
	border : 1px solid black;
	padding : 10px 15px ; 
}


</style>
<h1>내 정보</h1>
      <form action="myInfoUpdate.do" method="post" onsubmit="return myPage()">
           <table>
               <tr>
                   <th>아이디</th>
                   <td>${sessionScope.loginId}</td>
               </tr>
               <tr>
                   <th>현재 비밀번호</th>
                   <td><input type="password" name="current_pw" id="currentPw" maxlength="20"/></td>
               </tr>
               <tr>
                   <th>새 비밀번호</th>
                   <td><input type="password" name="pw" id="pw" maxlength="20"/></td>
               </tr>
               <tr>
                   <th>새 비밀번호 확인</th>
                   <td><input type="password" name="pw2" id="pw2" maxlength="20"/></td>
               </tr>
               <tr>
                   <th>이름</th>
                   <td><input type="text" name="mb_name" id="name" value="${memberList.mb_name}"/></td>
               </tr>
               <tr>
                   <th>이메일</th>
                   <td><input type="text" name="mb_email" id="email" value="${memberList.mb_email}"/> <button type="button" onclick="overlayEmail()">중복확인</button></td>
               </tr>
               <tr>
                   <th colspan="2">
                       <input type="submit" value="수정완료"/>
                   </th>
               </tr>
           </table>
       </form>
       <br/>
    <h1>회원탈퇴</h1>
    <hr>
    <h2>탈퇴안내</h2>
    <p>회원탈퇴를 신청하기 전에 아래 내용을 꼭 확인해 주세요.
    <br>
    사용하고 계신 아이디는 탈퇴할 경우 동일한 아이디로 재가입이 불가능합니다.
    <br>
    탈퇴하시려면 현재 로그인 중인 계정의 비밀번호를 입력하셔야 탈퇴 가능합니다.
    </p>
    <br>
    <h2>탈퇴사유</h2>
 	  <form id="frmMbDel" action="memberDelete.do" method="post" onsubmit="return memberDelete()">
        <div>
             <input name="mg_content" type="radio" value="서비스 불만족"/>
            서비스 불만족
            <br>
            <input name="mg_content" type="radio" value="더 이상 사용하지 않음"/>
             더 이상 사용하지 않음
             <br>
             <input name="mg_content" type="radio" value="실질적인 혜택부족"/>
            실질적인 혜택부족
            <br><input name="mg_content" type="radio" value="기타"/>
            기타
            <input type="text" name="mg_content_other" id="contentOther" disabled/>
            <br>
            비밀번호 <input type="password" name="pw" id="pass"/>
        </div>
        <br>
	    <input type="submit" value="탈퇴"/>
    </form>
<%@ include file="../../resources/inc/footer.jsp" %>
<script>
	var overChk3= false;
	
	function overlayEmail(){
		var $email=$("#email");
    	var expEmail = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.[a-zA-Z]{2,4}$/;
		console.log("이메일중복체크:"+$email.val());
		
	    if($email.val()==""){
    		alert("이메일을 입력해주세요.");
    		$email.focus();
    		return false;
	    }
	    
    	if(!expEmail.test($email.val())){
    		alert("이메일 형식이 아닙니다.");
    		$email.val('');
    		$email.focus();
    		return false;
    	}
		
		$.ajax({
			type:'get',
			url:"overlayEmail.ajax",
			data:{
				chkmb_email:$email.val()
			},
			datatype:"JSON",
			success:function(data){
				//console.log(data)
				if(data.overlayEmail){
					alert("사용중인 이메일 입니다.");
					$email.val('');
		    		$email.focus();
				}else{
					alert("사용 가능한 이메일 입니다.");
					overChk3 = true;
				}
			},
			error:function(e){
				//console.log(e)
			}
		});
	
	}
		
		function myPage(){
			var $currentPw = $("#currentPw");
			var $pw = $("#pw");
			var $pw2 = $("#pw2");
	        var expPw = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,20}$/;
			var $name = $("#name");
			var $email = $("#email");
        	var expEmail = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.[a-zA-Z]{2,4}$/;
	         
	        if($currentPw.val()==""){
	           alert("현재 비밀번호를 입력해주세요.");
	           $currentPw.focus();
	           return false;
	        }
	        
	        if($currentPw.val()!=$("#currentPw")){
		           alert("현재 비밀번호가 일치하지 않습니다.");
		           $currentPw.focus();
		           $currentPw.val('');
		           return false;
		        }
	        
	        if($pw.val()!=""||$pw2.val()!="") {
	        	if($pw.val()=="") {
	        		alert("새 비밀번호를 입력해주세요.");
	        		$pw.focus();
	        		return false;
	        	}
	        	
	        	if($pw2.val()=="") {
	        		alert("새 비밀번호 확인을 입력해주세요.");
	        		$pw2.focus();
	        		return false;
	        	}
	        	
		        if(!expPw.test($pw.val())){
		        	alert("새 비밀번호는 8 ~ 20자 영문, 숫자, 특수문자를 최소 한가지씩 조합으로 작성해주세요.");
		        	$pw.val('');
		        	$pw2.val('');
		        	$pw.focus();
		        	return false;  	
		        }
	        	
	        	if($pw.val()!=$pw2.val()) {
	        		alert("새 비밀번호가 일치하지 않습니다.");
	        		$pw2.val("").focus();
	        		return false;
	        	}
	        }
	        
	        if ($name.val()==""){
	        	alert("이름을 입력해주세요.");
	        	$name.focus();
	        	return false;
	        }
	        
	        if($email.val()==""){
	        	alert("이메일을 입력해주세요.");
	        	$email.focus();
	        	return false;
	        }
	        
	        if(!expEmail.test($email.val())){
	        	alert("이메일 형식이 아닙니다.");
	        	$email.val('');
	        	$email.focus();
	        	return false;  	
	        }
	        
		}
		
		function memberDelete() {
			var $pass=$("#pass");
			var $currentPw = $("#currentPw");
			
			if($('input[name="mg_content"]').is(":checked") == false) {
				alert("탈퇴 사유를 체크해 주세요.");
				return false;
			}
			
			if($('input[name="mg_content"][value="기타"]').is(":checked") == true && $("#contentOther").val() == '') {
				alert("기타 사유를 입력해 주세요.");
				$('#contentOther').focus();
				return false;
			}
			
			if($("#pass").val() == ''){
				alert("비밀번호를 입력해주세요.");
				$("#pass").focus();
				return false;
			}
			
			if($pass.val() !=$currentPw.val()){
				alert("비밀번호가 일치하지 않습니다.");
				$pass.val('');
				$pass.focus();
				return false;
			}
			
						
			if(!confirm("정말 회원탈퇴 하시겠습니까?")) {
				
				return false;
			}
		}
		
		$('input[name="mg_content"]').on('click',function(){
			if($(this).val() == "기타") {
				$('#contentOther').prop('disabled', false).val('').focus();
			} else {
				$('#contentOther').prop('disabled', true).val('');
			}
		});
	        
	</script>
</html>