<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<%@ include file="../../resources/inc/footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>풀스택(Full-Stack) CBT</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<style type="text/css">
		.tg  {border-collapse:collapse;border-spacing:0;}
		.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
		  overflow:hidden;padding:10px 5px;word-break:normal;}
		.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
		  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
		.tg .tg-zlqz{background-color:#c0c0c0;border-color:inherit;font-weight:bold;text-align:center;vertical-align:top}
		.tg .tg-c3ow{border-color:inherit;text-align:center;vertical-align:top}
		.tg .tg-3xi5{background-color:#ffffff;border-color:inherit;text-align:center;vertical-align:top}
 	</style>
</head>
<body>
<h2>과목 단원 관리</h2>
	<button onclick="location.href='adminSubjectChapterManagementRegister.do'">과목단원등록</button>
	<c:forEach items="${subList}" var="subList">
		<h3>${subList.su_name}</h3>
		<table class="tg">
		    <thead>
	      		<tr>
			        <th class="tg-zlqz">과목 단원명</th>
			        <th class="tg-zlqz">등록된 문제수(${subList.subCnt})</th>
			        <th class="tg-zlqz">관리</th>
		      </tr>
		    </thead>
		    <tbody>
		    	<c:forEach items="${chapList}" var="chapList">
			     	<tr>
			     		<c:if test="${chapList.su_idx eq subList.su_idx}">
			     		<input type="hidden" name="su_idx" value="${chapList.su_idx}"/>
			       		<td class="tg-3xi5">${chapList.sc_name}</td>
		       			<td class="tg-c3ow">${chapList.chapCnt}</td>
		       			<td class="tg-c3ow"><input type="button" value="과목단원수정" onclick="location.href='adminSubjectChapterManagementRevice.do?sc_idx=${chapList.sc_idx}&su_idx=${chapList.su_idx}'"/></td>
			     		</c:if>
			     	</tr>
			     </c:forEach>
		    </tbody>
		</table>
	</c:forEach>
	
	
	
</body>
</html>