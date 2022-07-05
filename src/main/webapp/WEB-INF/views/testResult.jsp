<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<h1>시험 결과</h1>
<div align="center">
	<h3>수고하셨습니다!</h3>
	<h2>응시 과목 : ${testResult.su_name} </h2>
	<h2>회차 : ${testResult.tt_times} 회차</h2>
	<h2>${testResult.mb_name}님의 점수는 ${testResult.tt_score}점 입니다.</h2>
	 <p>
	 	정답과 해설은 <a href="/myTestView.do?tt_idx=${testResult.tt_idx}" style="color:#0000ff;">여기</a>를 클릭하시면 확인 가능합니다.<br/>
	    문제에 대한 오류 및 의견은 '내가 응시한 시험' 상세보기에서 문제별로 이의제기 가능합니다.<br/>
	    문제보관함에서 원하는 문제를 보관하는 기능도 사용해보세요
	 </p>
	 <button type="button" onclick="location.href='main.go'">메인으로 가기</button>
</div>
<%@ include file="../../resources/inc/footer.jsp" %>
	<script>
	</script>
</html>