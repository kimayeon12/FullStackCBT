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
<h2>과목 단원 관리 - 등록</h2>
	<table class="tg">
        <thead>
            <tr>
                <th class="tg2">과목명</th>
                <th class="tg3">
                   <select name="su_idx" id="subjectlist">
                        <option value="">과목선택</option>
                        <c:forEach items="${subjectlist}" var="subjectlist">
                        		<option value="${subjectList.su_idx}">${subjectlist.su_name}</option>
                        </c:forEach>
                   </select> 
                </th>
        	</tr>
        </thead>
   		<tbody>
              <tr>
                <td class="tg1">과목단원명</td>
                <td>
                <input type="text" id="chapter"/>
                <button onclick="overlay()">중복확인</button>
                </td>
              </tr>
    	</tbody>
	</table>
            <input type="button" value="등록" onclick="register()"/>
            <input type="button" value="목록" onclick="location.href='adminSubjectChapterManagement.go'"/>
</body>
</html>