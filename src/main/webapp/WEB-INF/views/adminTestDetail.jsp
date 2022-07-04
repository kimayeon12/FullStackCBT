<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
 <h1 style="text-align : center">${testInfo.su_name} ${testInfo.tt_times}회차 시험</h1>
  <table>
    <thead>
        <tr>
        	<th>아이디</th>
            <th>시험시작일시</th>
            <th>시험제출일시</th>
            <th>점수</th>
            <th>제출상태</th>
        </tr>
    </thead>
    <tbody>
        <tr align="center">
        	<td>${testInfo.mb_id}</td>
            <td>${fn:substring(testInfo.tt_start_date,0,19)}</td>
            <td>${fn:substring(testInfo.tt_end_date,0,19)}</td>
            <td>${testInfo.tt_score}점</td>
            <td>${testInfo.tt_status}</td>
        </tr>
    </tbody>
  </table>
<!-- 반복문으로 뽑아내나 시험고유번호가 1인거 10게 --> 
 <c:forEach items="${testDetail}" var="testDetail">
	<div class="problem">
		<span class="t<c:choose><c:when test="${testDetail.ta_choice_no eq testDetail.pc_answer}">O</c:when><c:otherwise>X</c:otherwise></c:choose>">${testDetail.ta_problem_no}</span>. ${testDetail.pc_problem}
		정답 : 
		<c:choose>
		<c:when test="${testDetail.pc_answer eq 1}">➀</c:when>
		<c:when test="${testDetail.pc_answer eq 2}">➁</c:when>
		<c:when test="${testDetail.pc_answer eq 3}">➂</c:when>
		<c:when test="${testDetail.pc_answer eq 4}">➃</c:when>
		<c:otherwise>${testDetail.pc_answer}</c:otherwise>
		</c:choose>
	</div>
	<div class="answers">
		<p>${testDetail.ta_choice_no eq 1 ? '➊' : '➀'} ${testDetail.pc_answer1}</p>
		<p>${testDetail.ta_choice_no eq 2 ? '➋' : '➁'} ${testDetail.pc_answer2}</p>
		<p>${testDetail.ta_choice_no eq 3 ? '➌' : '➂'} ${testDetail.pc_answer3}</p>
		<p>${testDetail.ta_choice_no eq 4 ? '➍' : '➃'} ${testDetail.pc_answer4}</p>
	</div>
</c:forEach>
<%@ include file="../../resources/inc/footer.jsp" %>
	<script>
	</script>
</html>