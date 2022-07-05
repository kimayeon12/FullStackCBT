<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
	<h1>과목 관리 - 목록</h1>
       <table>
	       <colgroup>
				<col width="50"></col>
				<col width="100"></col>
				<col width="100"></col>
				<col width="150"></col>
				<col width="100"></col>
				<col width="100"></col>
				<col width="100"></col>
				<col width="100"></col>
			</colgroup>
           <thead>
             <tr>
               <th>번호</th>
               <th>과목명</th>
               <th>과목 단원수</th>
               <th>등록된 총 문제수</th>
               <th>응시자수</th>
               <th>응시횟수</th>
               <th>노출여부</th>
               <th>관리</th>
             </tr>
           </thead>
           <tbody>
    			<c:forEach items="${list}" var="dto">       
	             	<tr>
		               <td align="center">${dto.su_idx}</td>
		               <td>${dto.su_name}</td>
		               <td align="center">${dto.chapCnt}개</td>
		               <td align="center">${dto.proCnt}개</td>
		               <td align="right">${dto.testerCnt}명</td>
		               <td align="right">${dto.ttCnt}회</td>
		               <td align="center"> ${dto.su_is_blind eq '0'? 'O' : 'X' }</td>
		               <td align="center"><button type="button" onclick="location.href='adminSubjectManagementRevice.do?su_idx=${dto.su_idx}'">과목수정</button></td>
	             	</tr>
             	</c:forEach>
           </tbody>
           </table>
       <br>
       <div align="right"><button type="button" onclick="location.href='adminSubjectManagementRegister.go'">과목등록</button></div>
<%@ include file="../../resources/inc/footer.jsp" %>
<script>

</script>
</html>