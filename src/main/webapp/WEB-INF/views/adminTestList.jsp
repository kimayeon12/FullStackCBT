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

/*페이징*/ 
.pageInfo{
      list-style : none;
      display: inline-block;
    margin: 50px 0 0 100px;      
  }
  .pageInfo li{
      float: left;
    font-size: 20px;
    margin-left: 18px;
    padding: 7px;
    font-weight: 500;
  }
 a:link {color:black; text-decoration: none;}
 a:visited {color:black; text-decoration: none;}
 a:hover {color:black; text-decoration: underline;}
 
 .active{
      background-color: #cdd5ec;
  }
</style>

<p>총 시험 수 : ${listCnt} 건</p>
<form action="cbtFormList.do" method="get" id="form"> <!-- get으로  -->
	  <select name="su_idx"> 
		    <option value="">과목선택</option>
			    <c:forEach items="${subjectList}" var="subjectList">
			    	<option value="${subjectList.su_idx}"  ${idx == subjectList.su_idx ? 'selected="selected"' : ''}>${subjectList.su_name}</option>
			    </c:forEach>
	  </select>

	  <select name="tt_status">
		    <option value="">제출상태</option>
		    <option value="제출완료" ${status == '제출완료' ? 'selected="selected"' : ''}>제출완료</option>
		    <option value="시간초과 제출" ${status == '시간초과 제출' ? 'selected="selected"' : ''}>시간초과 제출</option>
	  </select>


	   <input type="text" name="mb_id" placeholder="아이디를 입력해주세요." value="${id}" required/>
	    
	   <input type="hidden" name="pageNum" value=""/>
	   <button type="submit" >검색</button>
 </form>
  
  
  <table>
    <thead>
        <tr>
            <th>과목명</th>
            <th>회차</th>
            <th>회원아이디</th>
            <th>제출일자</th>
            <th>점수</th>
            <th>제출상태</th>
        </tr>
    </thead>
    <tbody>
    
    <c:choose>
	     <c:when test="${testdto.size() >0}">
		 	<c:forEach items="${testdto}" var="testdto">
		        <tr>
		            <td><a href="cbtTestDetail.do?tt_idx=${testdto.tt_idx}">${testdto.su_name}</a></td>
		            <td>${testdto.tt_times}</td>
		            <td>${testdto.mb_id}</td>
		            <td>${testdto.tt_end_date}</td>
		            <td>${testdto.tt_score}</td>
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
	        <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	  </form>
	  
<%@ include file="../../resources/inc/footer.jsp" %>
	<script>
		//파라메터 전송
		$("select").on("change", function(){ 
			$('input[name="pageNum"]').val(1);
			$("#form").submit();
			/*
			$(".pageInfo a").on("click", function(e){
				var pageNum = $(this).attr("href");  //얘가 pageNum이니까 이걸 cbtFormlist에 보내주면 되는데 
				console.log("pageNum :"  + pageNum);
				$('input [name="pageNum"]').val(pageNum);
				
			});
			*/
		});
		
		
		
		//클릭했을 때 페이지 이동 	
		$(".pageInfo a").on("click", function(e){
	        e.preventDefault();
	        $("#moveForm").find("input[name='pageNum']").val($(this).attr("href"));
	        $("#moveForm").attr("action", "/cbtList.do");
	        $("#moveForm").submit();
		});
	</script>
</html>