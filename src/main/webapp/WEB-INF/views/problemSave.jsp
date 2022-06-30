<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
 <style>
            table,th,td {
	            border : 1px solid black;
	            border-collapse : collapse;
            }

            th,td { 
	            padding : 5px 10px;
            }

            td:nth-child(1), td:nth-child(3) {
                background-color: #e0e0e0;
            }

            .problem {
                width: 500px;
                height: 150px;
                border : 1px solid black;
            }
</style>
<!--  폼 1개로 합친  버전  -->
<form action="problemSaveList.do" method="get" id="form">
	  <select name="su_idx"> 
	        <option value="">과목명</option>
		        <c:forEach items="${subjectList}" var="subjectList">
		        	<option value="${subjectList.su_idx}" ${su_idx == subjectList.su_idx? 'selected="selected"' : ''}>${subjectList.su_name}</option>
		        </c:forEach>
	    </select>
	 
	    <c:choose>
	    <c:when test="${saveList.size()>0}">
			    <c:forEach items="${saveList}" var="saveList">
				    <table>
				        <tr>
				            <td>과목명</td>
				            <td>${saveList.su_name}</td>
				            <td>보관일자</td>
				            <td>${saveList.ps_date}</td> 
				        </tr>
				    </table>
				    <div class="problem"> <!--문제,4지선다,정답 영역-->
				    	${saveList.pc_problem} 정답 : ${saveList.pc_answer}
				    	<br/>
				    	1. ${saveList.pc_answer1}	<br/>
				    	2. ${saveList.pc_answer2}	<br/>
				    	3. ${saveList.pc_answer3}	<br/>
				    	4. ${saveList.pc_answer4}
				    </div>
				    
				    <div class="problem"><!-- 해설 영역-->
				    	${saveList.pc_explan}
				    </div>
				    <input type="checkbox" name="chkArr" value="${saveList.ps_idx}"/>문제보관삭제
			    </c:forEach>
		   		<button type="submit">선택삭제</button>
	    </c:when>
	  	<c:otherwise>
	  		<p>
		    	보관한 문제가 없습니다. <br/>
		    	<a href="myTestList.do">'내가 응시한 시험'</a>에서 문제 보관함 기능을 사용해보세요.
	    	</p>
	  	</c:otherwise>
	    </c:choose>
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
        	$("#form").submit(); 
            
        } else {
           checked.prop("checked",false);
           return false;
        }
    } else {
        alert("선택한 문제가 없습니다.");
    }

   });
   
   
	</script>
</html>