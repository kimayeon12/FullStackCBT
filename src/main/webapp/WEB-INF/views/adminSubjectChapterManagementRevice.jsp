<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<%@ include file="../../resources/inc/footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<style type="text/css">
		.tg  {border-collapse:collapse;border-spacing:0;}
		.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
		  overflow:hidden;padding:10px 5px;word-break:normal;}
		.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
		  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
		.tg .tg2{background-color:#efefef;font-weight:bold;text-align:center;vertical-align:top}
		.tg .tg1{background-color:#efefef;border-color:inherit;font-weight:bold;text-align:center;vertical-align:top}
		.tg .tg3{text-align:left;vertical-align:top}
	</style>
</head>
<body>
<h2>과목 단원 관리 - 수정</h2>
	<form>
        <table class="tg">
            <thead>
                <tr>
                    <th class="tg2">과목명</th>
                    <th class="tg3">
                       <select name="su_idx" id="subjectList">
                          <c:forEach items="${subjectList}" var="subjectList">
                          		<option value="${subjectList.su_idx}">${subjectList.su_name}</option>
                          </c:forEach>
                       </select> 
                    </th>
                </tr>
            </thead>
            <tbody>
              <tr>
                <td class="tg1">과목단원명<td>
					<input type="hidden" name="sc_idx" value="${chapdto.sc_idx}"/>
					<input type="text" id="subchapRevice" name="subchapRevice" value="${chapdto.sc_name}"/>
                  	<button onclick="overlay()">중복확인</button>
                </td>
              </tr>
            </tbody>
            </table>
            <input type="button" value="저장" onclick="register()"/>
            <input type="button" value="목록" onclick="location.href='adminSubjectChapterManagement.do'"/>
	</form>
</body>
</html>