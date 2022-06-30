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
      <form action="myPage.do" method="post" onsubmit="return myPage()">
           <table>
               <tr>
                   <th>아이디</th>
                   <td>${memberList.mb_id}</td>
               </tr>
               <tr>
                   <td>현재 비밀번호</td>
                   <td>${memberList.mb_pw}</td>
               </tr>
               <tr>
                   <td>새 비밀번호</td>
                   <td><input type="password" id="pw" maxlength="20"/></td>
               </tr>
               <tr>
                   <td>새 비밀번호 확인</td>
                   <td><input type="password" id="pw2" maxlength="20"/></td>
               </tr>
               <tr>
                   <td>이름</td>
                   <td><input type="text" id="name" name="name"/></td>
               </tr>
               <tr>
                   <td>이메일</td>
                   <td><input type="text" id="email" name="mb_email"/></td>
                   <td><button type="button" onclick="overlayEmail()">중복체크</button></td>
               </tr>
               <tr>
                   <th colspan="2">
                       <input type="submit" value="수정완료"/>
                   </th>
               </tr>
           </table>
       </form>
<%@ include file="../../resources/inc/footer.jsp" %>
<script>
	var overChk3= false;
	
	function overlayEmail(){
		var email=$("#email").val();
		console.log("이메일중복체크:"+email);
		
		$.ajax({
			type:'get',
			url:"overlayEmail.ajax",
			data:{
				chkmb_email:email
			},
			datatype:"JSON",
			success:function(data){
				//console.log(data)
			},
			error:function(e){
				//console.log(e)
			}
		});
	
	}
	
		var msg = "${msg}";
	
		if(msg !=""){
			alert(msg);	
		};
	</script>
</html>