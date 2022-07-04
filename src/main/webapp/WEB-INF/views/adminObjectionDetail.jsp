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
				  		${objectionDetail.mb_id}
				  		<input type="hidden" name="oj_idx" value="${objectionDetail.oj_idx}"/>
				  		<input type="hidden" name="mb_id" value="${objectionDetail.mb_id}"/>
				  	</td>
				</tr>
    		</thead>
    		<tbody>
				<tr>
					<th>문제</th>
					<td>
						${objectionDetail.pc_problem}
						<input type="hidden" name="pc_problem" value="${objectionDetail.pc_problem}"/>
					</td>
				</tr>
				<tr>
				  	<th>이의제기 내용</th>
				  	<td>
				  		${objectionDetail.oj_content}
				  		<input type="hidden" name="oj_content" value="${objectionDetail.oj_content}"/>
				  	</td>
				</tr>
				<tr>
				  	<th>이의제기 일시</th>
				  	<td>
				  		${objectionDetail.oj_date}
				  		<input type="hidden" name="oj_date" value="${objectionDetail.oj_date}"/>
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
       					${objectionDetail.oj_admin_id}
       					<input type="hidden" name="oj_admin_id" id="oj_admin_id" value="${objectionDetail.oj_admin_id}"/>
       				</td>
     			 </tr>
    		</thead>
    		<tbody>
      			<tr>
        			<th>관리자 메모</th>
        			<td>
        				<textarea name="oj_memo" >${objectionDetail.oj_memo}</textarea>
        			</td>
      			</tr>
      			<tr>
        			<th>이의제기 처리일시</th>
        			<td>
        				${objectionDetail.oj_proc_date}
        				<input type="hidden" name="oj_proc_date" id="oj_proc_date" value="${objectionDetail.oj_proc_date}"/>
        			</td>																														
      			</tr>
      			<tr>
       			 	<th>이의제기 처리상태</th>
         			<td>
           				<select name="oj_status" id="oj_status">
		         				<option value="" >처리상태</option>
								<option value="처리대기" ${objectionDetail.oj_status == '처리대기' ? 'selected="selected"' : ''}>처리대기</option>
								<option value="처리중" ${objectionDetail.oj_status == '처리중' ? 'selected="selected"' : ''}>처리중</option>
								<option value="처리완료" ${objectionDetail.oj_status == '처리완료' ? 'selected="selected"' : ''}>처리완료</option>           			
           				</select>
         			</td>
       			</tr>
	 		</tbody>
		</table>
	   	<input type="submit" id="saveButton" value="저장"/>
		<input type="button" value="목록" onclick="location.href='objectionList.do'"/>
		</form>   
<%@ include file="../../resources/inc/footer.jsp" %>
<script>
//이의제기 처리상태가 처리대기 일 경우
//관리자메모, 이의제기 처리상태, 저장버튼 활성화(5,7,8)

var loginId = "${loginId}";
if($("#oj_status").val()=="처리중"){
	if(loginId != $("#oj_admin_id").val()){
		$('textarea[name="oj_memo"]').attr("disabled",true);
		$("#oj_status").attr("disabled",true);
		$("#saveButton").attr("disabled",true);
	}else{
		$('textarea[name="oj_memo"]').attr("disabled",false);
		$("#oj_status").attr("disabled",false);
		$("#saveButton").attr("disabled",false);
	}
}

if($("#oj_status").val()=="처리완료"){
	$( 'textarea' ).contents().unwrap().wrap( '<p></p>' );
	$("#oj_status").attr("disabled",true);
	$("#saveButton").attr("type","hidden");
}
//이의제기 처리상태가 처리중인 경우
//- 처리자 아이디와 로그인 계정이 다르면 5,7,8영역 비활성화
//- 처리자 아이디와 로그인 계정이 일치하면 5,7,8영역 활성화

//이의제기 처리상태가 처리완료인 경우
//- 5,7영역은 일반 텍스트로 각 정보 노출
//- 8영역은 사라짐




</script>
</html>