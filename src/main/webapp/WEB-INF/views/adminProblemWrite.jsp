<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
	<div>문제출제관리 - 출제</div>
	<form action="problemWrite.do" method="post">
      	<table>
          	<tr>
              	<th>과목명</th>
                  <td>
                  	<select name="su_name" id="subjectList">
                    	<option value="">과목명</option>
                   		<c:forEach items="${subjectList}" var="subjectList">
                   			<option value="${subjectList}">${subjectList}</option>                   		
                   		</c:forEach>       
                   </select>
                 </td>
            </tr>
               <tr>
                   <th>과목단원명</th>
                      <td>
                       	<select name="sc_name">
                           	<option value="">과목단원명</option>
                         </select>
                      </td>
               </tr>
               <tr>
                    <th>문제</th>
                    <td><textarea rows="15" cols="30" name="pc_problem"></textarea></td>
                </tr>
                <tr>
                     <th>정답</th>
                     <td>
                         <input type="radio" name="pc_answer" value="1"/>1
                         <input type="radio" name="pc_answer" value="2"/>2
                         <input type="radio" name="pc_answer" value="3"/>3
                         <input type="radio" name="pc_answer" value="4"/>4
                     </td>
                 </tr>
                 <tr>
                      <th>4지선다문항</th>
                      <td>
                          ①: <input type="text" name="pc_answer1"/><br>
                          ②: <input type="text" name="pc_answer2"/><br>
                          ③: <input type="text" name="pc_answer3"/><br>
                          ④: <input type="text" name="pc_answer4"/>
                       </td>
                  </tr>
                  <tr>
                       <th>해설</th>
                       <td><textarea rows="5" cols="30" name="pc_explan"></textarea></td>
                  </tr>
                  <tr>
                       <th>난이도</th>
                       <td>
                            <input type="radio" name="pc_difficulty" value="상"/>상
                            <input type="radio" name="pc_difficulty" value="중"/>중
                            <input type="radio" name="pc_difficulty" value="하"/>하
                        </td>
                  </tr>
                  <tr>
                       <th colspan="2">
                           <input type="submit" value="출제"/>
                           <input type="button" value="목록" onclick="location.href='adminProblemList.go'"/>
                       </th>
                   </tr>
             </table>
        </form>
<%@ include file="../../resources/inc/footer.jsp" %>
<script>

$("select[name='su_name']").on("change", function(){
	
	console.log("ajax 전송");
	
	var subject = $("#subjectList option:selected").val();
	
	$.ajax({
		type:"post",
		url:"subjectChapList.ajax", 
		data:{
			'subject' : subject
		}, 
		dataType:"JSON",
		success:function(data){
			console.log(data);
			
			
		},
		error:function(e){
			console.log(e);
		}
	});
	
	
	
});


</script>
</html>











