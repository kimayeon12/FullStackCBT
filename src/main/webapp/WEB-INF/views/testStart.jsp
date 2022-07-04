<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<h1>시험 응시</h1>
<div align="center">
	<h2>응시하고 싶은 과목을 선택해 주세요</h2>
    <p>시험은 랜덤으로 총 10문제 출제되며, 제한시간(10분)이 초과되면 자동 제출됩니다.</p>
    
   
    <form action="test.do" method="post" onsubmit="return checkSubject()"> <!-- 클릭이나 엔터했을 때  -->
        <select name="su_idx"> <!--파라메터를 name으로 받는대-->
            <option value="">응시과목선택</option>
            <c:forEach items="${subjectList}" var="subjectList">
            <option value="${subjectList.su_idx}">${subjectList.su_name}</option>
            </c:forEach>
        </select>
        <input type="submit" value="시험시작"/> 
    </form>
</div>
<%@ include file="../../resources/inc/footer.jsp" %>
   <script>
 
   
      function checkSubject() {
          var $subjectSelect = $('select[name="su_idx"]');
          
         if($subjectSelect.val() == ""){
            alert("과목을 선택해 주세요");
            $subjectSelect.focus();
            return false; //이걸 해줘야 false 를 반환
         }
      }
   </script>
</html>