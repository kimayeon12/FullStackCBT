<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
	<h2>이의제기 관리</h2>
  		<form action="objectionUpdate.do" method="get">
  		<table>
    		<thead>
				<tr>
				  	<th>아이디</th>
				  	<td>
				  		<input type="hidden" name="oj_idx" value="${objectionDetail.oj_idx}"/>
				  		<input type="text" name="mb_id" value="${objectionDetail.mb_id}" style="border:0 solid black;" readonly/>
				  	</td>
				</tr>
    		</thead>
    		<tbody>
				<tr>
					<th>문제</th>
					<td>
						<input type="text" name="pc_problem" value="${objectionDetail.pc_problem}" style="border:0 solid black;" readonly/>
					</td>
				</tr>
				<tr>
				  	<th>이의제기 내용</th>
				  	<td>
				  		<input type="text" name="oj_content" value="${objectionDetail.oj_content}" style="border:0 solid black;" readonly/>
				  	</td>
				</tr>
				<tr>
				  	<th>이의제기 일자</th>
				  	<td>
				  		<input type="text" name="oj_date" value="${objectionDetail.oj_date}" style="border:0 solid black;" readonly/>
				  	</td>
				</tr>
   			 </tbody>
  		</table>
	
	<h2>이의제기 처리사항</h2>
  		<table>
    		<thead>
      			<tr>
        			<th>처리자 아이디</th>
       				<td>
       					<input type="text" name="oj_admin_id" value="${objectionDetail.oj_admin_id}" style="border:0 solid black;" readonly/>
       				</td>
     			 </tr>
    		</thead>
    		<tbody>
      			<tr>
        			<th>관리자 메모</th>
        			<td>
        				<input type="text" name="oj_memo" value="${objectionDetail.oj_memo}"/>
        			</td>
      			</tr>
      			<tr>
        			<th>이의제기 처리일자</th>
        			<td>
        				<input type="text" name="oj_proc_date" value="${objectionDetail.oj_proc_date}" style="border:0 solid black;" readonly/>
        			</td>
      			</tr>
      			<tr>
       			 	<th>이의제기 처리상태</th>
         			<td>
           				<select name="oj_status">
           					<option value="">처리상태</option>
		         			<c:forEach items="${statusList}" var="item">
        	     				<option value="${item.oj_status}" ${item.oj_status eq objectionDetail.oj_status ? 'selected' : ''}>${item.oj_status}</option>
		           			</c:forEach>	
           				</select>
         			</td>
       			</tr>
	 		</tbody>
		</table>
	   	<input type="submit" value="저장"/>
		<input type="button" value="목록" onclick="location.href='objectionList.do'"/>
		</form>   
<%@ include file="../../resources/inc/footer.jsp" %>
<script>






</script>
</html>