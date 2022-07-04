<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
@charset "UTF-8";



 .pageInfo_wrap{
     margin-top: 30px;
    text-align: left;
 }
  
.pagination{
  display: inline-block;
 }
.pagination a{
	font-size:11px;
  	color:black;
  	float:left;
  	padding:8px 16px;
  	text-decoration: none;
}

</style>
</head>
<body>
	

	<h3>1:1게시판 관리</h3>
	<form method="get" name="form" id="form">	

				<select name="ib_status"  id="status" >
                    <option value="1">답변상태</option>
                    <option value="2"${pageMaker.ib_status == '2' ? 'selected="selected"' : ''}>답변대기</option>
                    <option value="3"${pageMaker.ib_status == '3' ? 'selected="selected"' : ''}>처리중</option>
                    <option value="4"${pageMaker.ib_status == '4' ? 'selected="selected"' : ''}>답변완료</option>
                </select>
                <select name="ib_searchOption" id="ib_searchOption">
                    <option value="all"${pageMaker.ib_searchOption == 'all' ? 'selected="selected"' : ''}> 전체</option>
                    <option value="title" ${pageMaker.ib_searchOption == 'title' ? 'selected="selected"' : ''}> 제목</option>
                    <option value="idid" ${pageMaker.ib_searchOption == 'idid' ? 'selected="selected"' : ''}> 아이디</option>
                </select>
            <input  type="search" name="ib_keyword" value="${pageMaker.ib_keyword}" id="ib_keyword">
            <input type="submit" value="검색" onclick="javascript:form.action='adminInquiryList.go';">
	
	

	<table>
	<colgroup>
		<col width="20"></col>
		<col width="50"></col>
		<col width="150"></col>
		<col width="110"></col>
		<col width="110"></col>
		<col width="70"></col>
	</colgroup>
		<thead>
			<tr>
				<th><input type="checkbox" id="all"/></th>
				<th>번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>작성일자</th>
				<th>답변상태</th>
			</tr>	
		</thead>
		
		<tbody id= "list">
			
				<c:forEach items="${inquiryList}" var="inquiryList" >
					<tr>
						<td><input type="checkbox" name="ib_idx" value="${inquiryList.ib_idx}"/></td>
						<td>${inquiryList.ib_idx}</td>
						<td><a href="adminInquiryDetail?ib_idx=${inquiryList.ib_idx}">${inquiryList.ib_subject}</a></td>
						<td>${inquiryList.mb_id}</td>
						<td>${fn:substring(inquiryList.ib_reg_date,0,10)}</td>
						<td>
							<c:choose>
								<c:when test="${inquiryList.ib_status eq 3}">처리중</c:when>					
								<c:when test="${inquiryList.ib_status eq 4}">답변완료</c:when>					
								<c:otherwise>답변대기</c:otherwise>					
							</c:choose>
						</td>
					</tr>
				</c:forEach>
		</tbody>
	</table>
	<input type="submit" id="adDelete" value="선택 삭제"onclick="javascript: form.action='adDelete';">
	</form>
	
  

	
		 <!--페이징 -->
    <div class="pageInfo_wrap" >
        <div class="pageInfo_area">
         ${pagination}
        </div>
    </div>
  

	  <form id="moveForm" method="get">
	  	 <input type="hidden" name="pageNum" value="">
	  </form>
    
		
</body>
<%@ include file="../../resources/inc/footer.jsp" %>
<script>


	
$("#status").on("change", function(){ 
	
	 $("#form").attr("action", "adminInquiryList.go");
	 $("#form").submit();
	//var status = $("select[name='tt_status'] option:selected").val();
	//console.log(status);
	//attr selected 추가 
});	


if($('#adDelete').val(ib_idx)==""){
	alert("과목을 선택해 주세요");
}

//function del(){
	//var chkArr = [];
	//var ib_idx =$('input[type="checkbox"]:checked').val()
	
	//$('input[type="checkbox"]:checked').each(function(ib_idx){
		//chkArr.push($(this).val());
	//});
	
	//console.log(chkArr);
	//location.href='adDelete'+ib_idx;
	//let form = document.createElement('form');
	//form.action = 'inquiryList';
	//form.method = 'GET';
	//form.submit}
	
	
$("#all").on("click",function(){
	$("input:checkbox").prop("checked", $(this).prop("checked"));

	
});

	
</script>
</html>
