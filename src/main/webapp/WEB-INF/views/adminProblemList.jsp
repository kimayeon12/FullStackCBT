<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
	<div>문제 출제 관리</div>
	<div>총 문제수 : ${listCnt}</div>
		<form action="problemDetailList.do" method="get" id="subjectForm">
			<select name="su_idx" id="subjectList" onchange="subjectListShow();">
				<option value="">과목명</option>
				<c:forEach items="${subjectList}" var="subjectList">
					<option value="${subjectList.su_idx}" ${su_idx == subjectList.su_idx ? 'selected="selected"' : ''}>${subjectList.su_name}</option>
				</c:forEach>	
			</select>
			<select name="sc_idx"  id="subjectChapList" onchange="subjectChapProblemList();">
				<option value="">과목단원선택</option>
				<c:forEach items="${subjectChapList}" var="subjectChapList">
					<option value="${subjectChapList.sc_idx}" ${sc_idx == subjectChapList.sc_idx ? 'selected="selected"' : ''}>${subjectChapList.sc_name}</option>
				</c:forEach>		
			</select>
			
			<button style="float:right" type="submit" >검색</button>
		    <input style="float:right" type="text" name="mb_id" id="mb_id" placeholder="아이디를 입력해주세요." value="${mb_id}" required/>
		    <!-- 페이징  -->
		    <input type="hidden" name="pageNum" value="1"/>
		</form>
	
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>과목명</th>
					<th>단원명</th>
					<th>문제</th>
					<th>난이도</th>
					<th>정답률</th>
					<th>출제자 아이디</th>
					<th>출제일</th>
					<th>문제보관사용자수</th>
					<th>수정하기</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
				<c:when test="${problemList.size() >0}">
					<c:forEach items="${problemList}" var="problemList">
						<tr>
							<td>${problemList.pc_idx}</td>
							<td>${problemList.su_name}</td>
							<td>${problemList.sc_name}</td>
							<td>${problemList.pc_problem}</td>
							<td>${problemList.pc_difficulty}</td>
							<td>${problemList.answerRate}</td>
							<td>${problemList.mb_id}</td>
							<td>${problemList.pc_date}</td>
							<td></td>
							<td><input class="move" type="button" value="수정하기" onclick="location.href='problemUpdate.go?pc_idx=${problemList.pc_idx}&su_idx=${problemList.su_idx}'"/></td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
	     			<tr>
	     				<td colspan="10" style="text-align: center">찾으시는 데이터가 없습니다.</td>
	     			</tr>
	     		</c:otherwise>
			</c:choose>
			</tbody>
		</table>
		
	    <input type="button" style="float:right" value="새로운 문제 출제" onclick="location.href='problem.go'"/>
		
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
                    	<li class='pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }'><a href="${num}">${num}</a></li>
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
/* 파라미터 전송 */
function subjectListShow(){
	$("#subjectForm").submit();	
}	

function subjectChapProblemList(){	
	$("#subjectForm").submit();
}


/* 페이징 부분 기도 */
$(".pageInfo a").on("click", function(e){
	
	e.preventDefault();
    if($("#su_idx").val()=="" && $("#sc_idx").val()=="" && $("#mb_id").val()==""){
		$("#moveForm").find("input[name='pageNum']").val($(this).attr("href"));
	    $("#moveForm").attr("action", "/problemList.do");
	    $("#moveForm").submit();    	
    }else{
    	$("#subjectForm").find('input[name="pageNum"]').val($(this).attr("href"));
    	$("#subjectForm").submit();
    }
        
});




</script>
</html>













