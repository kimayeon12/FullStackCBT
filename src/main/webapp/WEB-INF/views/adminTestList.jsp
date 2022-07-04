<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<h1>CBT 시험 관리 - 목록</h1>
<p>총 시험 수 : <b>${listCnt}</b> 건</p>
<div align="right">
	<form action="cbtFormList.do" method="get" id="form"> 
		  <select name="su_idx" id="su_idx"> 
			    <option value="">과목선택</option>
				    <c:forEach items="${subjectList}" var="subjectList">
				    	<option value="${subjectList.su_idx}"  ${idx == subjectList.su_idx ? 'selected="selected"' : ''}>${subjectList.su_name}</option>
				    </c:forEach>
		  </select>
	
		  <select name="tt_status" id="tt_status">
			    <option value="">제출상태</option>
			    <option value="제출완료" ${status == '제출완료' ? 'selected="selected"' : ''}>제출완료</option>
			    <option value="시간초과 제출" ${status == '시간초과 제출' ? 'selected="selected"' : ''}>시간초과 제출</option>
		  </select>
	
	
		   <input  type="text" name="mb_id" id="mb_id" placeholder="아이디를 입력해주세요." value="${id}" required/>
		   <button  type="submit" >검색</button>
		    <!-- 페이징  -->
		   <input type="hidden" name="pageNum" value="1"/>
	 </form>
</div>
  
  
  <table>
	  <colgroup>
	  		<col width="60"></col>
			<col width="*"></col>
			<col width="80"></col>
			<col width="120"></col>
			<col width="80"></col>
			<col width="120"></col>
			<col width="120"></col>
		</colgroup>
    <thead>
        <tr>
        	<th>번호</th>
            <th>과목명</th>
            <th>회차</th>
            <th>회원 아이디</th>
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
		        	<td align="center">${testdto.tt_idx}</td>
		            <td><a href="cbtTestDetail.do?tt_idx=${testdto.tt_idx}">${testdto.su_name}</a></td>
		            <td align="center">${testdto.tt_times}회차</td>
		            <td align="center">${testdto.mb_id}</td>
		            <td align="center">${testdto.tt_score}점</td>
		            <td align="center">${fn:substring(testdto.tt_end_date,0,10)}</td>
		            <td align="center">${testdto.tt_status}</td>
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
  
    <!--페이징 -->
    <div class="pageInfo_wrap" >
        <div class="pageInfo_area">
        		<ul id="pageInfo" class="pageInfo">
        		<!-- 이전페이지 버튼 -->
	                <c:if test="${pageMaker.prev}">
	                    <li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
	                </c:if>
	        		
	        		
	 				<!-- 각 번호 페이지 버튼 -->
	                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	                    <li class='pageInfo_btn ${pageMaker.cri.pageNum == num ? "active": "" }'><a href="${num}">${num}</a></li>
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
	  </form>
	  
<%@ include file="../../resources/inc/footer.jsp" %>
	<script>
		//파라메터 전송
		$("select").on("change", function(){ 
			$("#form").submit();
		});
		
	
		
		//클릭했을 때 페이지 이동 	
		$(".pageInfo a").on("click", function(e){
	        e.preventDefault();
		        if($("#su_idx").val()=="" && $("#tt_status").val()=="" && $("#mb_id").val()==""){
	        		$("#moveForm").find("input[name='pageNum']").val($(this).attr("href"));
		        	$("#moveForm").attr("action", "/cbtList.do");
	        		$("#moveForm").submit();
		        } else {
		        	$("#form").find('input[name="pageNum"]').val($(this).attr("href"));
		        	$("#form").submit();
		        }
		        
		});
		
		
		
		
	</script>
</html>