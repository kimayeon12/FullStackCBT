<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../../resources/inc/header.jsp" %>

<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css" type="text/css">
<style>
table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
}
	
th, td{
		padding: 5px 10px;
}
	
table{
		width: 80%;
}
	
input[type='text']{
		width: 100%;
}
	
textarea{
		width: 100%;
		height: 150px;
		resize: none;
}
</style>
</head>
<body>
		<h3>1:1게시판</h3>
		<p>
		<c:choose>
				<c:when test="${dto.ib_status eq 3}">처리중</c:when>					
				<c:when test="${dto.ib_status eq 4}">답변완료</c:when>					
				<c:otherwise>답변대기</c:otherwise>					
		</c:choose></p>
		<form name="form1" method="post">
		<table class="dto">
			
				<tr>
					<th>제목</th>
					<td>${dto.ib_subject}
					</td>
				</tr>
				<tr>
					<th>작성일시</th>
					<td><fmt:formatDate value="${dto.ib_reg_date}" pattern="yyyy-MM-dd KK:mm:ss"/></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
						<c:forEach items="${list}" var="path">
								<c:choose>
									<c:when test="${fn:endsWith(path.ba_new_name,'.png')||fn:endsWith(path.ba_new_name,'.jpg')||fn:endsWith(path.ba_new_name,'.gif')}">
										<img src="/photo/${path.ba_new_name}" width="400"/>
									</c:when>
									<c:otherwise>
										<a href="/photo/${path.ba_new_name}">${path.ba_new_name} (열기)</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
					</td>
				</tr>
				<tr>
					<th>문의내용</th>
					<td>${dto.ib_content}</td>
			
				</tr>
				<tr>
					<th>답변내용</th>
					<td>${dto.ib_answer}
	
					</td>
				</tr>
			</table>
				<input type="hidden" name="idx" value="${ib_idx}">
				<input type="button" value ="목록" onclick="location.href='inquiryList.go'"/>
				<input type="button" value ="수정" onclick="location.href='inquryUpdate.go?ib_idx=${dto.ib_idx}'"/>
				<input type="button" value="삭제" onclick="del(${dto.ib_idx})" />
		</form>		
	</body>
<%@ include file="../../resources/inc/footer.jsp" %>
<script>


 	function del(ib_idx) {
 		var chk = confirm("정말 삭제하시겠습니까?");
 		if (chk) {
 			location.href='inquiryDelete?ib_idx='+ib_idx;
 		}
 	}	
 </script>

</html>