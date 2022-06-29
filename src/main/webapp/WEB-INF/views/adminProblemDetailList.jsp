<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
	<div>문제 출제 관리</div>
	<div>총 문제수 : ${problemList.size()}</div>
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
		<!-- 게시물 갯수
		<select id="pagePerNum">
			<option value="10">10</option>
			<option value="20">20</option>
		</select> -->
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
						<td><input type="button" value="수정하기" onclick="location.href='problemUpdate.go?pc_idx=${problemList.pc_idx}&su_idx=${problemList.su_idx}'"/></td>
					</tr>
				</c:forEach>
			</tbody>
			<!-- <tr>
				<td colspan="4" id="paging">
					plugin 사용법(twbspagination)
					<div class="container">
						<nav arial-label="Page navigation" style="text-align:center">
							<ul class="pagination" id="pagination"></ul>					
						</nav>				
					</div>			
				</td>
			</tr> -->
		</table>
		
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
    	
    	<form id="moveForm" method="get">
    		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
        	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">		
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






/*
var currPage = 1;

listCall(currPage);

$('#pagePerNum').on('change', function(){
	console.log('currPage :' + currPage);
	//페이지당 보여줄 수 변경시 계산된 페이지 적용이 안 된다.(플러그인의 문제)
	//페이지당 보여줄 수 변경시 기존 페이징 요소를 없애고 다시 만들어 준다.
	// listCall(page) 메서드 $("#pagination").twbsPagination 이 부분이 그려주는 부분이기 때문에 지우기만 하면 된다. 
	$("#pagination").twbsPagination('destroy');
	listCall(currPage);
});

function listCall(page){
	
	var pagePerNum = $('#pagePerNum').val();
	console.log("param page : "+page);
	$.ajax({
		type:'GET',
		url:'list.ajax',
		data:{
			cnt : pagePerNum,
			page : page
		},
		dataType:'JSON',
		success:function(data){
			console.log(data);
			drawList(data.list);
			currPage = data.currPage;
			//불러오기가 성공되면 플러그인을 이용해 페이징 처리
			$("#pagination").twbsPagination({
				startPage:data.currPage, //시작 페이지
				totalPages:data.pages, //총 페이지(전체 게시물 수 / 한 페이지에 보여줄 게시물 수)
				visiblePages:5, //한번에 보여줄 페이지 수 [1][2][3][4][5]
				onPageClick:function(e,page){
					//console.log(e);//클릭한 페이지와 관련된 이벤트 객체
					console.log(page);//사용자가 클릭한 페이지
					currPage = page;
					listCall(page);
				}
			});
			
		},
		error:function(e){
			console.log(e);
		}
	});
	
}

function drawList(list){
	var content = '';
	list.forEach(function(item){
		//console.log(item);
		content += '<tr>';
		content += '<td>'+item.pc_idx+'</td>';
		content += '<td>'+item.su_name+'</td>';
		content += '<td>'+item.sc_name+'</td>';
		content += '<td>'+item.pc_problem+'</td>';
		content += '<td>'+item.pc_difficulty+'</td>';
		content += '<td></td>';
		content += '<td></td>';
		content += '<td>'+item.pc_date+'</td>';
		content += '<td></td>';
		content += '</tr>';
	});
	$("#list").empty();
	$("#list").append(content);
}



*/











/*

$("select[name='su_idx']").on("change", function(){
	
	$("#form").submit();
	
});

$("select[name='sc_idx']").on("click", function(){
	
	console.log("ajax 전송");	
	var subject = $("select[name='su_idx']").val();
	
	var subjectChap = $("select[name='sc_idx']").val();
	
	console.log("보내는 값:"+subjectChap);
	
	$.ajax({
		type:"post",
		url:"subjectChapList.ajax", 
		data:{
			'subject' : subject,
			'subjectChap' : subjectChap
		}, 
		dataType:"JSON",
		success:function(data){
			console.log("세부과목 가져오기 : "+data.subjectChapList);
			
			if(data.subjectChapList != null) {
				drawSubjectChapList(data.subjectChapList);
			}else{
				//alert("세부과목을 등록해 주세요");
				//세부 과목 등록 페이지로 변경
				//location.href='/';
			}
		},
		error:function(error){
			console.log(error);
		}
	});
	
});

function drawSubjectChapList(subjectChapList){
	var content = '';
	console.log(subjectChapList);
	
	subjectChapList.forEach(function(subjectChapList){
		content += '<option value="'+subjectChapList.sc_idx+'">'+subjectChapList.sc_name+'</option>';
	});
	$("#subjectChapList").empty();
	$("#subjectChapList").append(content);
}

*/
</script>
</html>













