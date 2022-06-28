<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<h4>수고하셨습니다!</h4>
   <h3>응시 과목 : ${testResult.su_name} </h3>
   <h3>회차 : ${testResult.tt_times} 회차</h3>
   <h3>${testResult.mb_name}님의 점수는 ${testResult.tt_score}점 입니다.</h3>
    <p>정답과 해설은 <a href="/testDetail.do?tt_idx=${testResult.tt_idx}">내가 응시한 시험</a>에서 확인 가능합니다.<br/>
    문제에 대한 오류 및 의견은 '내가 응시한 시험' 상세보기에서 문제별로 이의제기 가능합니다.<br/>
    문제보관함에서 원하는 문제를 보관하는 기능도 사용해보세요</p>
    <button onclick="location.href='/'">메인으로 가기</button> <!-- 메인 링크로 이동 -->
<%@ include file="../../resources/inc/footer.jsp" %>
	<script>
	//function? 시작하자마자 이래야되는딩 
	//컨트롤러서 뷰로 보낸걸 다시 컨트롤러로(testResult.do) .. 보내야함 // 아니근데 파라메터로??? 꼭파라메터로 안받아도 서비스에 보내기만 하면되는데 
	//그럼 컨트롤러에서 컨트롤러로 tt_idx를 가지고 갈 수 없나?
	//시험화면에 버튼 이동할 때 파라메터 값으로 해당tt_idx 주면될것같은디 그걸 왜 자바에서 한거지? <<<<<<<<<<<<<< 
	//model에 담긴 tt_idx를 가지고 testResult.do 로 가면되나 
	//var idx = ${"tt_idx"};
	//location.href="testResult.do>tt_idx=idx"  ??
	var tt_idx = "${tt_idx}";
	//	redirect:/testResult.do?tt_idx=
	</script>
</html>