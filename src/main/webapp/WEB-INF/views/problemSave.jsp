<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<!--  폼 1개로 합친  버전  -->
<h1>문제보관</h1>
<p> 보관중인 문제 수 : <b>${listCnt}</b>건</p>
<form action="problemSaveList.do" method="get" id="form">
	  <select name="su_idx" style="width:100%;"> 
	        <option value="">과목명</option>
		        <c:forEach items="${subjectList}" var="subjectList">
		        	<option value="${subjectList.su_idx}" ${su_idx == subjectList.su_idx? 'selected="selected"' : ''}>${subjectList.su_name}</option>
		        </c:forEach>
	    </select>
	 	
	    <c:choose>
	    <c:when test="${saveList.size()>0}">
			    <c:forEach items="${saveList}" var="saveList">
				    <table>
					    <colgroup>
							<col width="20%"></col>
							<col width="30%"></col>
							<col width="20%"></col>
							<col width="30%"></col>
						</colgroup>
				        <tr align="center">
				            <th>과목명</th>
				            <td>${saveList.su_name}</td>
				            <th>보관일시</th>
				            <td>${fn:substring(saveList.ps_date,0,19)}</td> 
				        </tr>
				    </table>
				    
				    <div class="problem"> <!--문제,4지선다,정답 영역-->
				    	 <span>${saveList.pc_problem}</span>
							정답 : <em>
							<c:choose>
							<c:when test="${saveList.pc_answer eq 1}">➀</c:when>
							<c:when test="${saveList.pc_answer eq 2}">➁</c:when>
							<c:when test="${saveList.pc_answer eq 3}">➂</c:when>
							<c:when test="${saveList.pc_answer eq 4}">➃</c:when>
							<c:otherwise>${saveList.pc_answer}</c:otherwise>
							</c:choose>
							</em>
							<br/>
						➀ ${saveList.pc_answer1}<br/>
						➁ ${saveList.pc_answer2}<br/>
						➂ ${saveList.pc_answer3}<br/>
						➃ ${saveList.pc_answer4}<br/>
				    </div>
				    
				   <div class="explan">
				   		<c:choose>
				   			<c:when test="${saveList.pc_explan eq ''}"><p align="center">문제에 대한 해설을 준비 중입니다.</p></c:when>
				   			<c:otherwise>${fn:replace(saveList.pc_explan,newLine, '<br />')}</c:otherwise>
				   		</c:choose>
				   </div>
				   <input type="checkbox" name="chkArr" value="${saveList.ps_idx}" />문제보관삭제
				   <div style="height:60px;"></div>
			    </c:forEach>
		   		<button type="submit" style="cursor:pointer;">선택삭제</button>
	    </c:when>
	  	<c:otherwise>
	  		<p>
		    	보관한 문제가 없습니다. <br/>
		    	<a href="myTestList.do" style="color:#0000ff;">'내가 응시한 시험'</a>에서 문제 보관함 기능을 사용해보세요.
	    	</p>
	  	</c:otherwise>
	    </c:choose>
	    <input type="hidden" name="pageNum" value="1"/>
</form>  	
    
    
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

$("select").on("change",function(){
	$("#form").submit();
});
	 

$("button").on("click",function(){

   //console.log( $("input[type='checkbox']:checked").length); //length 개수로 나옴
 
    var checked = $("input[type='checkbox']:checked");
  
    
    if(checked.length>0){
        if(confirm("선택한 문제를 보관함에서 삭제 하시겠습니까?")){
        	alert("삭제가 완료되었습니다.");
        	$("#form").submit(); 
            
        } else {
           checked.prop("checked",false);
           return false;
        }
    } else {
        alert("선택한 문제가 없습니다.");
        return false;
    }

   });
   
   
//클릭했을 때 페이지 이동 	
$(".pageInfo a").on("click", function(e){
    e.preventDefault();
    
        if($("#su_idx").val()=="" ){
        	$("#moveForm").find("input[name='pageNum']").val($(this).attr("href"));
        	$("#moveForm").attr("action", "/problemSave.do");
        	$("#moveForm").submit();
        } else {
        	$("#form").find('input[name="pageNum"]').val($(this).attr("href"));
        	$("#form").submit();
        }
});
   
	</script>
</html>