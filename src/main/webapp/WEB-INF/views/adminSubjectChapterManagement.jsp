<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<h1>과목단원 관리 - 목록</h1>
	<c:forEach items="${subList}" var="subList">
		<h3 align="center">${subList.su_name}</h3>
		<table>
			<colgroup>
				<col width="50%"></col>
				<col width="150"></col>
				<col width="120"></col>
			</colgroup>
		    <thead>
	      		<tr>
			        <th>과목 단원명</th>
			        <th>등록된 문제수(${subList.subCnt})</th>
			        <th>관리</th>
		      </tr>
		    </thead>
		    <tbody>
		    	<c:forEach items="${chapList}" var="chapList">
			     	<tr>
			     		<c:if test="${chapList.su_idx eq subList.su_idx}">
			     		<input type="hidden" name="su_idx" value="${chapList.su_idx}"/>
			       		<td>${chapList.sc_name}</td>
		       			<td align="center">${chapList.chapCnt}</td>
		       			<td align="center"><input type="button" value="과목단원수정" onclick="location.href='adminSubjectChapterManagementRevice.do?sc_idx=${chapList.sc_idx}&su_idx=${chapList.su_idx}'"/></td>
			     		</c:if>
			     	</tr>
			     </c:forEach>
		    </tbody>
		</table>
	</c:forEach>
	<br/>
	<div align="right"><button type="button" onclick="location.href='adminSubjectChapterManagementRegister.do'">과목단원등록</button></div>
<%@ include file="../../resources/inc/footer.jsp" %>
<script>

</script>

</html>
<%-- <c:forEach items="${chapList}" var="chapList">
			     	<tr>
			     		<c:if test="${chapList.su_idx eq subList.su_idx}">
			     		<input type="hidden" name="su_idx" value="${chapList.su_idx}"/>
			       		<td>${chapList.sc_name}</td>
		       			<td align="center">${chapList.chapCnt}</td>
		       			<td align="center"><input type="button" value="과목단원수정" onclick="location.href='adminSubjectChapterManagementRevice.do?sc_idx=${chapList.sc_idx}&su_idx=${chapList.su_idx}'"/></td>
			     		</c:if>
			     	</tr>
			     </c:forEach> --%>