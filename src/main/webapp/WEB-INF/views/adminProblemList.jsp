<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
	<div>문제 출제 관리</div>
	<div>총 문제수 : </div>
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

			<select name="search">
				<option value="">전체</option>
				<option value="문제">문제</option>
				<option value="출제자 아이디">출제자 아이디</option>
			</select>
			
			<input type="text" name="pc_idx" value="${pc_idx}" maxlength="255">
			<input type="button" value="검색"/>			
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
			<tbody id="list">
				<c:forEach items="${problemList}" var="problemList">
					<tr>
						<td>${problemList.pc_idx}</td>
						<td>${problemList.su_name}</td>
						<td>${problemList.sc_name}</td>
						<td>${problemList.pc_problem}</td>
						<td>${problemList.pc_difficulty}</td>
						<td></td>
						<td></td>
						<td>${problemList.pc_date}</td>
						<td></td>
						<td><input class="move" type="button" value="수정하기" onclick="location.href='problemUpdate.go?pc_idx=${problemList.pc_idx}&su_idx=${problemList.su_idx}'"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<!-- 검색을 위한 부분 -->
		<div class="search_wrap">
	        <div class="search_area">
	        	<select name="type">
					<option value="PW" <c:out value="${pageMaker.cri.type eq 'PW'?'selected':'' }"/>>전체/option>
					<option value="P" <c:out value="${pageMaker.cri.type eq 'P'?'selected':'' }"/>>문제/option>
					<option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자/option>
	            </select>
	            <input type="text" name="keyword" value="${pageMaker.cri.keyword }">
	            <button>Search</button>
	        </div>
	    </div>
	    
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
    	</div>
    	<!-- 페이징 위해 만든 부분 -->
    	<form id="moveForm" method="get">
    		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
        	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
        	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
        	<input type="hidden" name="type" value="${pageMaker.cri.type }">		
    	</form>
			
	<input type="button" value="새로운 문제 출제" onclick="location.href='adminProblemWrite.go'"/>
<%@ include file="../../resources/inc/footer.jsp" %>
<script>

function subjectListShow(){
	$("#subjectForm").submit();	
}	

function subjectChapProblemList(){	
	$("#subjectForm").submit();
}


/* 페이징 부분 기도 */
$(".pageInfo a").on("click", function(e){
	
	e.preventDefault();
    $("#moveForm").find("input[name='pageNum']").val($(this).attr("href"));
    $("#moveForm").attr("action", "/problemList.do");
    $("#moveForm").submit();
        
});

/* $(".move").on("click", function(e){
	e.preventDefault();
	
	$("#moveForm").append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+ "'>");
	$("#moveForm").attr("action", "/problemUpdate.go");
	$("#moveForm").submit();
}); */

/* 검색 */
$(".search_area button").on("click", function(e){
	e.preventDefault();

	let type = $(".search_area select").val();
    let keyword = $(".search_area input[name='keyword']").val();
    
    if(!type){
        alert("검색 종류를 선택하세요.");
        return false;
    }
    
    if(!keyword){
        alert("키워드를 입력하세요.");
        return false;
    }
    
	let val = $("input[name='keyword']").val();
	$("#moveForm").find("input[name='keyword']").val(val);
	$("#moveForm").find("input[name='pageNum']").val(1);
	$("#moveForm").submit();
}); 






</script>
</html>













