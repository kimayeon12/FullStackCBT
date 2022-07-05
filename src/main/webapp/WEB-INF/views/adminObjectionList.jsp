<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
	<h1>이의제기 관리 - 목록</h1>
	<p>총 이의제기 수:<b> ${listCnt}</b>건</p>
	<form action="objectionSelectList.do" method="get" id="detailForm">
	<button style="float:right" type="submit" >검색</button>
	<input style="float:right" type="text" name="pc_problem" id="pc_problem" placeholder="문제를 입력해주세요." value="" required/>
		<select style="float:right" name="oj_status" id="oj_status">
			<option value="" ${oj_status == '' ? 'selected="selected"' : ''}>처리상태</option>
			<option value="처리대기" ${oj_status == '처리대기' ? 'selected="selected"' : ''}>처리대기</option>
			<option value="처리중" ${oj_status == '처리중' ? 'selected="selected"' : ''}>처리중</option>
			<option value="처리완료" ${oj_status == '처리완료' ? 'selected="selected"' : ''}>처리완료</option>
		</select>
		<!-- 페이징 부분 -->
		<input type="hidden" name="pageNum" value="1"/>
	</form>
	<table>
		<colgroup>
	  		<col width="*"></col>
			<col width="140"></col>
			<col width="140"></col>
			<col width="140"></col>
		</colgroup>
		<thead>
			<tr>
				<th>문제</th>
				<th>아이디</th>
				<th>이의제기 일자</th>
				<th>처리상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${objectionList}" var="objectionList" varStatus="i">
				<tr>
					<td><a href="/adminObjectionDetail.go?oj_idx=${objectionList.oj_idx}">${listCnt - (pageNum-1)*10 - i.index}</a></td>
					<td align="center">${objectionList.mb_id}</td>
					<td align="center">${fn:substring(objectionList.oj_date,0,10)}</td>
					<td align="center">
						<c:choose>
							<c:when test="${objectionList.oj_status eq '처리대기'}">처리대기</c:when>
							<c:when test="${objectionList.oj_status eq '처리중'}">처리중</c:when>
							<c:when test="${objectionList.oj_status eq '처리완료'}">처리완료</c:when>
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
	    	</form>
    	</div>


<%@ include file="../../resources/inc/footer.jsp" %>
<script>

$("#oj_status").on("change", function(){
	$("#detailForm").submit();
});

//클릭했을 때 페이징
$(".pageInfo a").on("click", function(e){
	
	e.preventDefault();
	if($("#oj_status").val()==""){
	    $("#moveForm").find("input[name='pageNum']").val($(this).attr("href"));
	    $("#moveForm").attr("action", "/objectionList.do");
	    $("#moveForm").submit();		
	}else {
		$("#detailForm").find('input[name="pageNum"]').val($(this).attr("href"));
    	$("#detailForm").submit();
	}
	
    
});


</script>
</html>