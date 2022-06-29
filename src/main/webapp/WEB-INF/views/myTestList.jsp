<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<style>
table {
	border : 1px solid black;
	border-collapse : collapse;
	width: 100%;
}

th,td {
	border : 1px solid black;
	padding : 5px 10px; 
}
</style>

<p>총 시험 수 : ${listCnt} 건</p>
<form action="myTestSearch.do" method="get" id="form">
	<select name="su_idx"> 
		<option value="">과목선택</option>
		<c:forEach items="${subjectList}" var="subjectList">
			    	<option value="${subjectList.su_idx}" ${idx == subjectList.su_idx ? 'selected="selected"' : ''}>${subjectList.su_name}</option>
		</c:forEach>
	</select>

	<select name="tt_status">
		<option value="">제출상태</option>
		<option value="제출완료" ${status == '제출완료' ? 'selected="selected"' : ''}>제출완료</option>
		<option value="시간초과 제출" ${status == '시간초과 제출' ? 'selected="selected"' : ''}>시간초과 제출</option>
	</select>
</form>
  
  
<table>
    <thead>
        <tr>
            <th>과목명</th>
            <th>회차</th>
            <th>점수</th>
            <th>제출일자</th>
            <th>제출상태</th>
        </tr>
    </thead>
    <tbody>
    
    <c:choose>
	     <c:when test="${testdto.size() >0}">
		 	<c:forEach items="${testdto}" var="testdto">
		        <tr>
		            <td><a href="myTestView.do?tt_idx=${testdto.tt_idx}">${testdto.su_name}</a></td>
		            <td>${testdto.tt_times}</td>
		            <td>${testdto.tt_score}</td>
		            <td>${testdto.tt_end_date}</td>
		            <td>${testdto.tt_status}</td>
		        </tr>
		 	</c:forEach>
	     </c:when>
	     <c:otherwise>
	     	<tr>
	     		<td colspan="7" style="text-align: center">찾으시는 데이터가 없습니다.</td>
	     	</tr>
	     </c:otherwise>
    </c:choose>
    
    </tbody>
  </table>
  
<%@ include file="../../resources/inc/footer.jsp" %>
	<script>
		$("select").on("change", function(){ 
			$("#form").submit();
			//var status = $("select[name='tt_status'] option:selected").val();
			//console.log(status);
			//attr selected 추가 
		});
	</script>
</html>