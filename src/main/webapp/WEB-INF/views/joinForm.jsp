<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<h1>회원가입 페이지</h1>
<form action="join.do" method="post" onsubmit="return joinForm()">
    <table>
        <tr>
            <th>아이디</th>
            <td>
            	<input type="text" id="id" name="mb_id" maxlength="20"/>
            	<button type="button" onclick="overlayId()">중복체크</button>
            </td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td>
            	<input type="password" name="mb_pw" id="pw"  maxlength="20"/>
            	영문,숫자,특수조합으로 8~20자로 작성하시오.
            </td>
        </tr>
             <tr>
            <th>비밀번호 확인</th>
            <td>
            	<input type="password"  id="pw2" maxlength="20"/>
            </td>
        </tr>
        <tr>
            <th>이름</th>
            <td>
            	<input type="text" name="mb_name" id="name"/>
            </td>
        </tr>
        <tr>
            <th>이메일</th>
            <td>
            	<input type="text" name="mb_email"  id="email" placeholder="예)cbt@example.com" />
            	<button type="button" onclick="overlayEmail()">중복체크</button>
            </td>
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
	var overChk= false;
	
	function overlayId(){
		 var id = $("#id").val();
		 console.log('아이디 중복체크:'+id);
		 var expId=/^[a-z]+[a-z0-9]{4,20}$/g;
		 
		 if(expId.test($("#id").val())){
			 
			$.ajax({
				type:'get',
				url:'overlayId.ajax',
				data:{
					chkmb_id:id
					},
				datatype:"JSON",
				success:function(data){
					//console.log(data);
					if(data.overlayId){
						alert("사용중인 아이디 입니다.")
					}else{
						alert("사용 가능한 아이디 입니다.")
						overChk = true;
					}
				},
				error:function(e){
					console.log(e);
				}
			});
			
		}else{
			alert("아이디는 영문 숫자 조합으로 4~20자로 작성해주세요.")
			return false;	
		}
	}
	
	var overChk2=false;
	
	function overlayEmail(){
		var email=$("#email").val();
		console.log("이메일중복체크:"+email);
		
		$.ajax({
			type:'get',
			url:'overlayEmail.ajax',
			data:{
				chkmb_email:email
			},
			datatype:"JSON",
			success:function(data){
				//console.log(data);
				if(data.overlayEmail){
					alert("사용중인 이메일 입니다.")
				}else{
					alert("사용가능한 이메일입니다.")
					overChk2= true;
				}
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	
		function joinForm(){
	        var $id = $("#id");
	        var expId= /^[a-z]+[a-z0-9]{4,20}$/g;
	        var $pw=$("#pw");
	        var expPw = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,20}$/;
	        var $pw2=$("#pw2");
	        var $name=$("#name")
	        var $email =$("#email");
        	var expEmail = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.[a-zA-Z]{2,4}$/;
	        //console.log('test'); 
	        if($id.val()==""){
	            alert("아이디를 입력해주세요.");
	            $id.focus();
	            return false;
	        }else if($pw.val()==""){
	           alert("비밀번호를 입력해주세요.");
	           $pw.focus();
	           return false;
	        }else if(!expPw.test($pw.val())){
	        	alert("비밀번호는 8 ~ 20자 영문, 숫자, 특수문자를 최소 한가지씩 조합으로 작성해주세요.");
	        	$pw.val('');
	        	$pw2.val('');
	        	$pw.focus();
	        	return false;  	
	        }else if($pw2.val()==""){
	           alert("비밀번호 확인을 입력해주세요.");
	           $pw2.focus();
	           return false;	
	        }else if($pw.val()!==$pw2.val()){
	        	alert("비밀번호가 일치하지 않습니다.");
	        	$pw2.val('');
	        	$pw2.focus();
	        	return false;
	        }else if ($name.val()==""){
	        	alert("이름을 입력해주세요.");
	        	$name.focus();
	        	return false;
	        }else if($email.val()==""){
	        	alert("이메일을 입력해주세요.");
	        	$email.focus();
	        	return false;
	        }else if(!expEmail.test($email.val())){
	        	alert("이메일 형식이 아닙니다.");
	        	$email.val('');
	        	$email.focus();
	        	return false;  	
	        }else{
	        	console.log("회원가입요청");
	        }
	        
	        
	    }
</script>
</html>