<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
	<h3>이의제기 관리</h3>
	<div>총 이의제기 수: ${objectionList.size()} </div>
	<form action="objectionSelectList.do" method="get" id="detailForm">
		<select name="oj_status" id="oj_status">
			<option value="처리상태" ${oj_status == '' ? 'selected="selected"' : ''}>처리상태</option>
			<option value="처리대기" ${oj_status == '처리대기' ? 'selected="selected"' : ''}>처리대기</option>
			<option value="처리중" ${oj_status == '처리중' ? 'selected="selected"' : ''}>처리중</option>
			<option value="처리완료" ${oj_status == '처리완료' ? 'selected="selected"' : ''}>처리완료</option>
		</select>
		<select name="oj_searchOption" id="oj_searchOption">
			<option value="all"${oj_searchOption == 'all' ? 'selected="selected"' : ''}>전체</option>
			<option value="problem"${oj_searchOption == 'problem' ? 'selected="selected"' : ''}>문제</option>
			<option value="userId"${oj_searchOption == 'userId' ? 'selected="selected"' : ''}>사용자아이디</option>			
		</select>
		<input type="text" name="keyword" value="${keyword}">
		<input type="submit" value="검색" onclick="javascript:form.action='objectionSelectList.do';">
	</form>
	<table>
		<thead>
			<tr>
				<th>문제</th>
				<th>아이디</th>
				<th>제출일자</th>
				<th>처리상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${objectionList}" var="objectionList">
				<tr>
					<td>${objectionList.pc_problem}</td>
					<td>${objectionList.mb_id}</td>
					<td>${objectionList.oj_date}</td>
					<td>
						<c:choose>
							<c:when test="${objectionList.oj_status eq '처리대기'}">처리대기</c:when>
							<c:when test="${objectionList.oj_status eq '처리중'}">처리중</c:when>
							<c:otherwise>처리완료</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<!-- 아래는 페이징 위해 만든 부분 -->
		<div class="pageInfo_wrap" >
        	<div class="pageInfo_area">
 				<ul id="pageInfo" class="pageInfo">
	 				<!-- 이전페이지 버튼 -->
	                <c:if test="${pageMaker.prev}">
	                    <li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
	                </c:if>
 					<!-- 각 번호 페이지 버튼 -->
                	<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    	<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
                	</c:forEach>
                	<!-- 다음페이지 버튼 -->
	                <c:if test="${pageMaker.next}">
	                    <li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }">Next</a></li>
	                </c:if>			
 				</ul> 
        	</div>
    		<!-- 페이징 위해 만든 부분 이걸로 parameter 넘겨준다. -->
	    	<form id="moveForm" method="get">
	    		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
	        	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	        	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
	        	<input type="hidden" name="type" value="${pageMaker.cri.type }">		
	    	</form>
    	</div>


<%@ include file="../../resources/inc/footer.jsp" %>
<script>

$("#oj_status").on("change", function(){
	$("#detailForm").submit();
});

* 페이징 부분 기도 */
$(".pageInfo a").on("click", function(e){
	
	e.preventDefault();
    $("#moveForm").find("input[name='pageNum']").val($(this).attr("href"));
    $("#moveForm").attr("action", "/objectionList.do");
    $("#moveForm").submit();
    
});


</script>
</html>