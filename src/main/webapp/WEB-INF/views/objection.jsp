<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<p style="color:Red">이의제기를 장난처럼 이용하여 불건전한 정보를 올릴 경우 회원 계정이 강제 탈퇴 처리 될 수 있습니다.</p>
<div class = "problem">
	 ${problemdto.pc_problem}
		정답 : 
		<c:choose>
		<c:when test="${problemdto.pc_answer eq 1}">➀</c:when>
		<c:when test="${problemdto.pc_answer eq 2}">➁</c:when>
		<c:when test="${problemdto.pc_answer eq 3}">➂</c:when>
		<c:when test="${problemdto.pc_answer eq 4}">➃</c:when>
		<c:otherwise>${problemdto.pc_answer}</c:otherwise>
		</c:choose>
		<br/>
	➀ ${problemdto.pc_answer1}<br/>
	➁ ${problemdto.pc_answer2}<br/>
	➂ ${problemdto.pc_answer3}<br/>
	➃ ${problemdto.pc_answer4}<br/>
</div>

<h3>이의제기 내용 작성</h3>
<p style="color:blue">아래 입력란에 위 문제에 대한 이의제기할 내용을 작성해주세요.</p>

<form action="objectionInsert.do" method="post" onsubmit="return checkSubmit()">
	<input type="hidden" name="pc_idx" value="${problemdto.pc_idx}"/>
	<textarea name="content"></textarea>
	<p style="color:Red">이의제기는 묻고 답하는 공간이 아닙니다.<br/>
	문의 사항은 1:1 게시판을 이용해 주세요.</p>
	<input type="hidden" name="tt_idx" value="${tt_idx}"/>
	<input type="button" value="취소" onclick="location.href='myTestView.do?tt_idx=${tt_idx}'">
	<input type="submit" value="제출"/>
</form>

<%@ include file="../../resources/inc/footer.jsp" %>
<script>
 function checkSubmit(){
	if($('textarea[name=content]').val()==""){
		alert("이의제기 내용을 작성해주세요");
		$("textarea").focus();
		return false;
	}else if(!confirm("이의제기 내용을 제출하시겠습니까?") ){
		return false;
	} else {
		alert("제출 되었습니다.");
	}
} 
</script>
</html>