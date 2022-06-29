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
<form action="saveList.do" method="get">
  <select name="su_idx"> 
        <option value="">과목명</option>
	        <c:forEach items="${subjectList}" var="subjectList">
	        	<option value="${subjectList.su_idx}">${subjectList.su_name}</option>
	        </c:forEach>
    </select>
</form>
    
    <!--c: if 태그 뷰 2개 -->
    <table>
        <tr>
            <td>과목명</td>
            <td>JAVA</td><!-- 가져올 것 : 문제출제 테이블 -->
            <td>보관일자</td>
            <td>2022-06-15 23:55:43</td> <!-- 가져올 것 :문제보관테이블-->
        </tr>
    </table>
    <div class="problem"></div> <!--문제,4지선다,정답 영역-->
    <div class="problem"></div><!-- 해설 영역-->
    <input type="checkbox"/>문제보관삭제
    <button>선택삭제</button>

<%@ include file="../../resources/inc/footer.jsp" %>
	<script>
	 //데이터가 있는 경우 없는 경우
    //데이터가 없는경우 화면을 완전히 다르게 보여주는 것만 설정할 수 없나..
    //데이터가 들어온 경우에 그려주는걸로 해야하나요
    //function drawProblemSave(){
       // var content = '';
   // }

$("button").on("click",function(){

   console.log( $("input[type='checkbox']:checked").length); //length 개수로 나옴
 
    var checked = $("input[type='checkbox']:checked").length;
    
    if(checked>0){
        if(confirm("정말 삭제 하시겠습니까?")){
            alert("확인"); //삭제된 이후에 화면이 보여야함 //아작스써야하나바..왜냐면 여기서 확인을 
            //누를 때 넘어가는거니까 
        } else {
            alert("취소"); //아무 변화없는 현재페이지 

        }
    } else {
        alert("선택된 문제가 없습니다.");
    }



   });
	</script>
</html>