<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
	<h1>1:1게시판 관리 - 목록</h1>
	<div align="right">
	<form method="get" name="form1" id="form1">	

				<select name="ib_status"  id="status" >
                    <option value="1">답변상태</option>
                    <option value="2"${pageMaker.ib_status == '2' ? 'selected="selected"' : ''}>답변대기</option>
                    <option value="4"${pageMaker.ib_status == '4' ? 'selected="selected"' : ''}>답변완료</option>
                </select>
                <select name="ib_searchOption" id="ib_searchOption">
                    <option value="all"${pageMaker.ib_searchOption == 'all' ? 'selected="selected"' : ''}> 전체</option>
                    <option value="title" ${pageMaker.ib_searchOption == 'title' ? 'selected="selected"' : ''}> 제목</option>
                    <option value="idid" ${pageMaker.ib_searchOption == 'idid' ? 'selected="selected"' : ''}> 아이디</option>
                </select>
            <input  type="search" name="ib_keyword" value="${pageMaker.ib_keyword}" id="ib_keyword">
            <input type="submit" value="검색" onclick="javascript:form.action='adminInquiryList.go';">
    </form>
	</div>
	
	

	<form method="get" name="form2" id="form2">	
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
						<td align="center"><input type="checkbox" name="ib_idx" value="${inquiryList.ib_idx}"/></td>
						<td align="center">${inquiryList.ib_idx}</td>
						<td ><a href="adminInquiryDetail?ib_idx=${inquiryList.ib_idx}">${inquiryList.ib_subject}</a></td>
						<td align="center">${inquiryList.mb_id}</td>
						<td align="center">${fn:substring(inquiryList.ib_reg_date,0,10)}</td>
						<td align="center">
							<c:choose>
								<c:when test="${inquiryList.ib_status eq 2}">답변대기</c:when>					
								<c:when test="${inquiryList.ib_status eq 4}">답변완료</c:when>									
							</c:choose>
						</td>
					</tr>
				</c:forEach>
		</tbody>
	</table>
	<input type="submit" id="adDelete" value="선택 삭제" onclick="javascript: form2.action='adDelete';">
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
	
	 $("#form1").attr("action", "adminInquiryList.go");
	 $("#form1").submit();
	//var status = $("select[name='tt_status'] option:selected").val();
	//console.log(status);
	//attr selected 추가 
});	




$("#adDelete").on("click",function(){

	 
	    var checked = $("input[type='checkbox']:checked");
	  
	    
	    if(checked.length>0){
	        if(confirm("정말로 삭제하시겠습니까 ?")){
	        	$("#adDelete").submit(); 
	            
	        } else {
	           checked.prop("checked",false);
	           return false;
	        }
	    } else {
	        alert("선택한 게시글이 없습니다.");
	        return false;
	    }

	   });
	
	
$("#all").on("click",function(){
	$("input[type='checkbox']").prop("checked", $(this).prop("checked"));
});

	
</script>
</html>
