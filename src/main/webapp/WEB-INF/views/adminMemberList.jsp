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
 <h1>회원관리 리스트</h1>
    <p>총 회원 수:${listCnt} 건</p>
    <form action="memberList.do" method="get" id="form">
       <select name="mb_grade">
       		<option value="">회원권한</option>
       		<option value="관리자" ${mb_grade == '관리자'? 'selected="selected"' : ''}>관리자</option>
       		<option value="최고관리자" ${mb_grade == '최고관리자'? 'selected="selected"' : ''}>최고관리자</option>
       		<option value="일반회원"${mb_grade == '일반회원'? 'selected="selected"' : ''}>일반회원</option>
       		<option value="탈퇴회원"${mb_grade == '탈퇴회원'? 'selected="selected"' : ''}>탈퇴회원</option>
       </select>
      		 <select name="searchOption">
				<option value="">전체</option>
				<option value="아이디" ${searchOption == '아이디'? 'selected="selected"' : ''}>아이디</option>
				<option value="이름" ${searchOption == '이름'? 'selected="selected"' : ''}>이름</option>
				<option value="이메일" ${searchOption == '이메일'? 'selected="selected"' : ''}>이메일</option>
			</select>
			<input type="text" name="search" value="" required/>
			<button type="submit">검색</button>
    </form>		
        <table>
        	<thead>
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>가입일</th>
					<th>회원권한</th>
				</tr>
		</thead>
		<tbody>
			<c:forEach items="${memberList}" var="memberList" begin="0" step="1" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td><a href="adminMemberDetail.do?mb_id=${memberList.mb_id}">${memberList.mb_id}</a></td>
					<td>${memberList.mb_name}</td>
					<td>${memberList.mb_email}</td>
					<td>${memberList.mb_date}</td>
					<td>${memberList.mb_grade}</td>
				</tr>
			</c:forEach>
		</tbody>
        </table>
<%@ include file="../../resources/inc/footer.jsp" %>
	<script>
	$("select").on("change", function(){ 
		$("#form").submit();
	});
	</script>
</html>