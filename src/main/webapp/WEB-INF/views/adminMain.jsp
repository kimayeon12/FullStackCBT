<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<h1>최근 CBT 시험 내역</h1>
<table>
	<colgroup>
		<col width="*"></col>
		<col width="100"></col>
		<col width="200"></col>
		<col width="150"></col>
		<col width="100"></col>
		<col width="150"></col>
	</colgroup>
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
		            <td align="center">${item.tt_times}회차</td>
		            <td align="center">${item.mb_id}</td>
		            <td align="center">${fn:substring(item.tt_end_date,0,10)}</td>
		            <td align="center">${item.tt_score}점</td>
		            <td align="center">${item.tt_status}</td>
		        </tr>
		 	</c:forEach>
	     </c:when>
	     <c:otherwise>
	     	<tr align="center">
	     		<td colspan="6">최근 데이터가 없습니다</td>
	     	</tr>
	     </c:otherwise>
    </c:choose>
	</tbody>
</table>
<h1>최근 이의제기 내역</h1>
<table>
	<colgroup>
		<col width="*"></col>
		<col width="200"></col>
		<col width="150"></col>
		<col width="150"></col>
	</colgroup>
	<thead>
		<tr>
			<th>문제</th>
			<th>회원아이디</th>
			<th>이의제기 일자</th>
			<th>처리상태</th>
		</tr>
	</thead>
	<tbody>
    <c:choose>
	     <c:when test="${totalObjection > 0}">
		 	<c:forEach items="${objection}" var="item">
		        <tr>
		            <td><a href="adminObjectionDetail.go?oj_idx=${item.oj_idx}">${item.pc_problem}</a></td>
		            <td align="center">${item.mb_id}</td>
		            <td align="center">${fn:substring(item.oj_date,0,10)}</td>
		            <td align="center">${item.oj_status}</td>
		        </tr>
		 	</c:forEach>
	     </c:when>
	     <c:otherwise>
	     	<tr align="center">
	     		<td colspan="4">최근 데이터가 없습니다</td>
	     	</tr>
	     </c:otherwise>
    </c:choose>
	</tbody>
</table>
<h1>최근 1:1게시판 문의 내역</h1>
<table>
	<colgroup>
		<col width="*"></col>
		<col width="200"></col>
		<col width="150"></col>
		<col width="150"></col>
	</colgroup>
	<thead>
		<tr>
			<th>제목</th>
			<th>아이디</th>
			<th>등록일자</th>
			<th>답변상태</th>
		</tr>
	</thead>
	<tbody>
    <c:choose>
	     <c:when test="${totalInquiry > 0}">
		 	<c:forEach items="${inquiry}" var="item">
		        <tr>
		            <td><a href="adminInquiryDetail?ib_idx=${item.ib_idx}">${item.ib_subject}</a></td>
		            <td align="center">${item.mb_id}</td>
		            <td align="center">${fn:substring(item.ib_reg_date,0,10)}</td>
		            <td align="center">
						<c:choose>
							<c:when test="${item.ib_status eq 2}">답변대기</c:when>
							<c:when test="${item.ib_status eq 3}">처리중</c:when>
							<c:when test="${item.ib_status eq 4}">답변완료</c:when>	
							<c:otherwise>${item.ib_status}</c:otherwise>
						</c:choose>
		            </td>
		        </tr>
		 	</c:forEach>
	     </c:when>
	     <c:otherwise>
	     	<tr align="center">
	     		<td colspan="4">최근 데이터가 없습니다</td>
	     	</tr>
	     </c:otherwise>
    </c:choose>
	</tbody>
</table>
<%@ include file="../../resources/inc/footer.jsp" %>
	<script></script>
</html>