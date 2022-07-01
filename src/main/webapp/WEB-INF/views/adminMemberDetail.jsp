<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<style>
table {
	border : 1px solid black;
	border-collapse : collapse;
	width: 100%;
}

th,td {
	border : 1px solid black;
	padding : 5px 10px; 
}
</style>
<h1>회원관리 수정</h1>
<form action="adminMemberUpdate.do" method="post" onsubmit="return chkContent()">
<table>
	<tr>
		<th>아이디</th>
		<td>${memberList.mb_id}</td>
	</tr>
		<tr>
		<th>이름</th>
		<td>${memberList.mb_name}</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>${memberList.mb_pw}</td>
	</tr>
		<tr>
		<th>이메일</th>
		<td>${memberList.mb_email}</td>
	</tr>
		<tr>
		<th>회원권한</th>
		<td >
			<select name="mg_grade_after">
	       		<option value="관리자" ${memberList.mb_grade eq '관리자'? 'selected="selected"' : ''}>관리자</option>
	       		<option value="최고관리자" ${memberList.mb_grade eq '최고관리자'? 'selected="selected"' : ''}>최고관리자</option>
	       		<option value="일반회원" ${memberList.mb_grade eq '일반회원'? 'selected="selected"' : ''}>일반회원</option>
	       		<option value="탈퇴회원" ${memberList.mb_grade eq '탈퇴회원'? 'selected="selected"' : ''}>탈퇴회원</option>
       		</select>
	       		 <input type="hidden" name="mb_id" value="${memberList.mb_id}"/>
	       		 <input type="hidden" name="mg_grade_before" value="${memberList.mb_grade}"/>
		       	<textarea name="mg_content" cols="110" rows="4"  placeholder="변경사유를 입력해주세요."></textarea>
       	</td>
		</tr>
		<tr>
			<th>가입일시</th>
			<td>${memberList.mb_date}</td>
		</tr>
		<tr>
			<th colspan="2">
				<input  type="submit" value="저장" />
				<input type="button" value="목록" onclick="location.href='adminMemberList.do'"/>
			</th>
		</tr>
</table>
</form>


<h1>회원권한 변경 내역</h1>
<table>
	<thead>
				<tr>
					<th>번호</th>
					<th>변경전 권한</th>
					<th>변경후 권한</th>
					<th>변경시킨 아이디</th>
					<th>사유</th>
					<th>변경일시</th>
				</tr>
		</thead>
		<tbody>
				<c:forEach items="${gradeUpdate}" var="gradeUpdate" begin="0" step="1" varStatus="status"> 
				<tr>
					<td>${status.count}</td>
					<td>${gradeUpdate.mg_grade_before}</td>
					<td>${gradeUpdate.mg_grade_after}</td>
					<td>${gradeUpdate.mb_id}</td>
					<td>${gradeUpdate.mg_content}</td>
					<td>${gradeUpdate.mg_date}</td>
				</tr>
				</c:forEach>
		</tbody>
</table>

<%@ include file="../../resources/inc/footer.jsp" %>
<script>
	var msg ="${msg}";
	if(msg !=""){
		alert(msg);
	}
	
	function chkContent(){
		var $content = $('textarea[name="mg_content"]');
		console.log($content);
		if($content.val() == ""){
			alert("변경 사유를 입력해주세요");
			$content.focus();
			return false;
		} 
	};
	
</script>
</html>