<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<h2>과목 단원 관리</h2>
	<button onclick="location.href='adminSubjectChapterManagementRegister.do'">과목단원등록</button>
	<c:forEach items="${subList}" var="subList">
		<h3>${subList.su_name}</h3>
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
</body>
<%@ include file="../../resources/inc/footer.jsp" %>
</html>
<script>

</script>


<!-- <c:forEach items="${chapList}" var="chapList">
			     	<tr>
			     		<c:if test="${chapList.su_idx eq subList.su_idx}">
			     		<input type="hidden" name="su_idx" value="${chapList.su_idx}"/>
			       		<td>${chapList.sc_name}</td>
		       			<td align="center">${chapList.chapCnt}</td>
		       			<td align="center"><input type="button" value="과목단원수정" onclick="location.href='adminSubjectChapterManagementRevice.do?sc_idx=${chapList.sc_idx}&su_idx=${chapList.su_idx}'"/></td>
			     		</c:if>
			     	</tr>
			     </c:forEach> -->