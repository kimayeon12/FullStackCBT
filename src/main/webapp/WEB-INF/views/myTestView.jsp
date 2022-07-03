<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<%@ include file="../../resources/inc/header.jsp" %>
 <h1 align="center">${testInfo.su_name} ${testInfo.tt_times}회차 시험</h1>
  <table>
    <thead>
        <tr>
            <th>시험시작시간</th>
            <th>시험제출시간</th>
            <th>점수</th>
            <th>제출상태</th>
        </tr>
    </thead>
    <tbody>
        <tr align="center">
            <td>${fn:substring(testInfo.tt_start_date,0,19)}</td>
            <td>${fn:substring(testInfo.tt_end_date,0,19)}</td>
            <td>${testInfo.tt_score}</td>
            <td>${testInfo.tt_status}</td>
        </tr>
    </tbody>
  </table>
 <c:forEach items="${testDetail}" var="testDetail">
	<div class="problem">
		<span class="t<c:choose><c:when test="${testDetail.ta_choice_no eq testDetail.pc_answer}">O</c:when><c:otherwise>X</c:otherwise></c:choose>">${testDetail.ta_problem_no}</span>. ${testDetail.pc_problem}
		정답 : 
		<c:choose>
		<c:when test="${testDetail.pc_answer eq 1}">➀</c:when>
		<c:when test="${testDetail.pc_answer eq 2}">➁</c:when>
		<c:when test="${testDetail.pc_answer eq 3}">➂</c:when>
		<c:when test="${testDetail.pc_answer eq 4}">➃</c:when>
		<c:otherwise>${testDetail.pc_answer}</c:otherwise>
		</c:choose>
	</div>
	<div class="answers">
		<p>${testDetail.ta_choice_no eq 1 ? '➊' : '➀'} ${testDetail.pc_answer1}</p>
		<p>${testDetail.ta_choice_no eq 2 ? '➋' : '➁'} ${testDetail.pc_answer2}</p>
		<p>${testDetail.ta_choice_no eq 3 ? '➌' : '➂'} ${testDetail.pc_answer3}</p>
		<p>${testDetail.ta_choice_no eq 4 ? '➍' : '➃'} ${testDetail.pc_answer4}</p>
	</div>
	<div class="explan">${fn:replace(testDetail.pc_explan,newLine, '<br />')}</div>
	<input type="checkbox" class="isSave" value="${testDetail.pc_idx}" <c:if test="${testDetail.cnt > 0}">checked</c:if>/>문제보관
	<button onclick="location.href='/objection.do?pc_idx=${testDetail.pc_idx}&tt_idx=${testDetail.tt_idx}'">이의제기</button>
</c:forEach>
<%@ include file="../../resources/inc/footer.jsp" %>
	<script>
		$('.isSave').on('click', function(){
			var $this = $(this);
			var chk = $this.is(':checked');
			var confMsg = chk == true ? '보관' : '삭제';
			
			if(confirm("문제를 " + confMsg + "하시겠습니까?") == true) {
				$.ajax({
					type:"get",
					url:"problemSave.ajax",
					data:{
						isSave:chk,
						pc_idx:$this.val()
					},
					dataType:"json",
					success:function(data){
						
					},
					error:function(e){
						alert("처리 중 오류가 발생하였습니다.");
					}
				});
			} else {
				if(chk == true) {
					$this.prop('checked', false);
				} else {
					$this.prop('checked', true);
				}
			}
		});
	</script>
</html>