<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<h1>회원관리 - 상세/수정</h1>
<form action="adminMemberUpdate.do" method="post" onsubmit="return chkContent()">
	<table>
		<colgroup>
			<col width="150"></col>
			<col width="*"></col>
		</colgroup>
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
				<select name="mg_grade_after">
		       		<option value="일반회원" ${memberList.mb_grade eq '일반회원'? 'selected="selected"' : ''}>일반회원</option>
		       		<option value="탈퇴회원" ${memberList.mb_grade eq '탈퇴회원'? 'selected="selected"' : ''}>탈퇴회원</option>
		       		<option value="관리자" ${memberList.mb_grade eq '관리자'? 'selected="selected"' : ''}>관리자</option>
		       		<option value="최고관리자" id="superAdmin" ${memberList.mb_grade eq '최고관리자'? 'selected="selected"' : ''}>최고관리자</option>
	       		</select>
		       		 <input type="hidden" name="mb_id" value="${memberList.mb_id}"/>
		       		 <input type="hidden" name="mg_grade_before" value="${memberList.mb_grade}"/>
			       	<textarea name="mg_content" cols="110" rows="4"  placeholder="변경사유를 입력해주세요."></textarea>
		    </td>
		</tr>
		<tr>
			<th>가입일시</th>
			<td>${fn:substring(memberList.mb_date,0,19)}</td>
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
	<colgroup>
		<col width="80"></col>
		<col width="100"></col>
		<col width="100"></col>
		<col width="150"></col>
		<col width="*"></col>
		<col width="200"></col>
	</colgroup>
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
					<td align="center">${status.count}</td>
					<td align="center">${fn:substring(gradeUpdate.mg_grade_before,0,19)}</td>
					<td align="center">${fn:substring(gradeUpdate.mg_grade_after,0,19)}</td>
					<td align="center">${gradeUpdate.mg_id}</td>
					<td>${gradeUpdate.mg_content}</td>
					<td align="center">${fn:substring(gradeUpdate.mg_date,0,19)}</td>
				</tr>
			</c:forEach>
		</tbody>
</table>

<%@ include file="../../resources/inc/footer.jsp" %>
<script>
	function chkContent(){
		var $content = $('textarea[name="mg_content"]');
		console.log($content);
		if($content.val() == ""){
			alert("변경 사유를 입력해주세요");
			$content.focus();
			return false;
		} 
	};

	var mb_grade = "${mb_grade}";
		console.log(mb_grade);

	if(mb_grade != "최고관리자"){ 
		$("#superAdmin").attr("disabled" , true);
	}else {
		$("#superAdmin").attr("disabled" , false);
	}
</script>
</html>