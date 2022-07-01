<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<h1>최근 CBT 시험 내역</h1>
<table>
	<thead>
		<tr>
			<th>과목명</th>
			<th>회차</th>
			<th>회원아이디</th>
			<th>제출일자</th>
			<th>점수</th>
			<th>제출상태</th>
		</tr>
	</thead>
	<tbody>
    <c:choose>
	     <c:when test="${totalCbtTest > 0}">
		 	<c:forEach items="${cbtTest}" var="item">
		        <tr>
		            <td><a href="cbtTestDetail.do?tt_idx=${item.tt_idx}">${item.su_name}</a></td>
		            <td>${item.tt_times}</td>
		            <td>${item.mb_id}</td>
		            <td>${item.tt_end_date}</td>
		            <td>${item.tt_score}</td>
		            <td>${item.tt_status}</td>
		        </tr>
		 	</c:forEach>
	     </c:when>
	     <c:otherwise>
	     	<tr>
	     		<td colspan="6">최근 데이터가 없습니다</td>
	     	</tr>
	     </c:otherwise>
    </c:choose>
	</tbody>
</table>
<%@ include file="../../resources/inc/footer.jsp" %>
	<script></script>
</html>