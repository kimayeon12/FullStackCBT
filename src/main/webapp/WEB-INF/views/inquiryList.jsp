<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css" type="text/css">
<style>
@charset "UTF-8";
table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
}
	
th, td{
		padding: 5px 10px;
}
	
table{
		width: 80%;
}
	
input[type='text']{
		width: 100%;
}
	
textarea{
		width: 100%;
		height: 150px;
		resize: none;
}
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
	
	<h3>1:1 게시판</h3>
	<form action="inquiryList.go" method="get" id="search">	

				<select name="ib_status"  id="status" >
                    <option value="1">답변상태</option>
                    <option value="2"${pageMaker.ib_status == '2' ? 'selected="selected"' : ''}>답변대기</option>
                    <option value="4"${pageMaker.ib_status == '4' ? 'selected="selected"' : ''}>답변완료</option>
                </select>
                <select name="ib_searchOption" id="ib_searchOption">
                    <option value="all"${pageMaker.ib_searchOption == 'all' ? 'selected="selected"' : ''}> 전체</option>
                    <option value="title" ${pageMaker.ib_searchOption == 'title' ? 'selected="selected"' : ''}> 제목</option>
                    <option value="content" ${pageMaker.ib_searchOption == 'content' ? 'selected="selected"' : ''}> 내용</option>
                </select>
            <input type="search" name="ib_keyword" value="${pageMaker.ib_keyword}" id="ib_keyword">
             <input type="hidden" name="pageNum" value="1"/>
            <input type="submit" value="검색">
	</form>
	

		<table>
		<col width="20"></col>
		<col width="150"></col>
		<col width="90"></col>
		<col width="50"></col>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성일자</th>
					<th>답변상태</th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${inquiryList}" var="inquiryList">
					<tr>
						<td align="center">${inquiryList.ib_idx}</td>
						<td ><a href="inquiryDetail?ib_idx=${inquiryList.ib_idx}">${inquiryList.ib_subject}</a></td>
						<td align="center">${fn:substring(inquiryList.ib_reg_date,0,10)}</td>
						<td  align="center" >
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
	
	<input type="button" value ="글쓰기" onclick ="location.href='inquiryWrite.go'"/>
	
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
	

	 $("#search").submit();
	
});	


</script>
</html>
