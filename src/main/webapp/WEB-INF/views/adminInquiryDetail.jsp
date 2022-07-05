<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
	<h1>1:1게시판 관리 - 상세/수정</h1>
	<form action="adminUpdate.do" method="post" onsubmit="return inquiryDetail()">
		<input type="hidden" name="ib_answer_date" value="${dto.ib_answer_date}"/>
        <table class="dto">
           
                <tr>
                    <th>제목</th>
                    <td colspan="5">
                    <input type="hidden" name="ib_idx" value="${dto.ib_idx}"/>
                    ${dto.ib_subject}
                    </td>
                </tr>
                <tr>
                    <th width=10%>아이디</th>
                    <td width=40%>${dto.mb_id}</td>
                    <th width=10%>등록일시</th>
                    <td colspan="3">${fn:substring(dto.ib_reg_date,0,19)}</td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="5">${dto.ib_content}</td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td colspan="5">
                        <c:forEach items="${list}" var="path">
                        	<c:choose>
								<c:when test="${fn:endsWith(path.ba_new_name,'.png')||fn:endsWith(path.ba_new_name,'.jpg')||fn:endsWith(path.ba_new_name,'.gif')}">
									<p><img src="/photo/${path.ba_new_name}"  width="400"/></p>
								</c:when>							
								<c:otherwise>
									<p><a href="/photo/${path.ba_new_name}">${path.ba_new_name}</a></p>
								</c:otherwise>
							</c:choose>							
						</c:forEach>
                    </td>
                </tr>
                
                
                <tr>
                <th>답변상태</th>
                    <td>
                    	<select name="ib_status" id="ib_status">
                        	<option value="2"${dto.ib_status eq 2? 'selected':''}>답변대기</option>
                       		<option value="4"${dto.ib_status eq 4? 'selected':''}>답변완료</option>
                        </select>
                    </td>
                <th>답변관리자 아이디</th>
                    <td>${dto.ib_admin_id}</td>
                <th>답변일시</th>
                    <td>${fn:substring(dto.ib_answer_date,0,19)}</td>
                  
                <tr>
                	<th>답변내용</th>
                    <td colspan="5"><textarea name="ib_answer" id="ib_answer">${dto.ib_answer}</textarea></td>
                </tr>
                <tr>
                    <th>관리자 메모 </th>
                    <td colspan="5"><textarea name="ib_memo">${dto.ib_memo}</textarea></td>
                </tr>
              
            </table>
        

			<div align="center">
				<input type="submit" value ="저장"/>
		    	<input type="button" value ="목록" id="saveButton" onclick="location.href='adminInquiryList.go'"/>
		    </div>
	</form>
</body>
<%@ include file="../../resources/inc/footer.jsp" %>
<script>
if($("#ib_status").val()=="2"){
	
	$("#ib_status").attr("disabled",false);
	$('textarea[name="ib_answer"]').attr("disabled",false);
	}
if($("#ib_status").val()=="4"){
	
		$("#ib_status").attr("disabled",true);
		$('textarea[name="ib_answer"]').attr("disabled",true);
	}
	
	

		
function inquiryDetail()	{
	
		
		if($("#ib_status").val()=="4"){
			if($("#ib_answer").val()==""){
				alert("내용을 입력해주세요");
				$("#ib_answer").focus();
				return false;
				}
	}else if($("#ib_status").val()=="2"){
			if($("#ib_answer").val()!=""){
				alert("답변상태를 변경해주세요");
				$("#ib_status").focus();
				return false;
				}
	}else {
			alert("답변 완료되었습니다");
		}
		
}
	
</script>



</html>