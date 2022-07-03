w<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<h1>회원관리 수정</h1>
<form action="list" method="post">
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
		<th>이메일</th>
		<td>${memberList.mb_email}</td>
	</tr>
		<tr>
		<th>회원권한</th>
		<td >
			<select id="select_member2">
       		<option value="회원권한" selected>회원권한</option>
       		<option value="관리자">관리자</option>
       		<option value="최고관리자" >최고관리자</option>
       		<option value="일반회원">일반회원</option>
       		<option value="탈퇴회원">탈퇴회원</option>       		
       </select>
	       	<textarea name="mg_content" cols="30" rows="10"  placeholder="변경사유를 입력해주세요."></textarea>
       	</td>
	</tr>
		<tr>
		<th>가입일시</th>
		<td>${memberList.mb_date}</td>
	</tr>
	<tr>
		<th colspan="2">
			<input type="button" value="저장" onclick="location.href='adminMemberUpdate.do'"/>
			<input type="button" value="목록" onclick="location.href='adminMemberList.do'"/>
		</th>
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
	
	
</script>
</html>