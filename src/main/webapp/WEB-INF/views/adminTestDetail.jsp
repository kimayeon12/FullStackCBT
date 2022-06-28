<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
 <style>
 		table { 
 			width: 100%;
 		}
 
         table,th,td {
            border : 1px solid black;
            border-collapse : collapse;
}

        th,td { 
            padding : 5px 10px;
        }
       
        th {
       		background-color: #e0e0e0;
        }
        
        .problem {
        	margin: 10px 0px;
        	border : 1px solid black;
        	width: 100%;
        	height : 50px;
        }
       
       .answers {
       		margin: 10px 0px;
        	border : 1px solid black;
        	width: 100%;
        	height : 120px;
       }
        </style>

 <h2 style="text-align : center">${testInfo.su_name} ${testInfo.tt_times}회차 시험</h2>
  <table>
    <thead>
        <tr>
        	<th>아이디</th>
            <th>시험시작시간</th>
            <th>시험제출시간</th>
            <th>점수</th>
            <th>제출상태</th>
        </tr>
    </thead>
    <tbody>
        <tr>
        	<td>${testInfo.mb_id}</td>
            <td>${testInfo.tt_start_date}</td>
            <td>${testInfo.tt_end_date}</td>
            <td>${testInfo.tt_score}</td>
            <td>${testInfo.tt_status}</td>
        </tr>
    </tbody>
  </table>
<!-- 반복문으로 뽑아내나 시험고유번호가 1인거 10게 --> 
 <c:forEach items="${testDetail}" var="testDetail">
	<div class="problem">
		${testDetail.ta_problem_no}. ${testDetail.pc_problem}
		정답 : ${testDetail.pc_answer}
	</div>
	<div class = "answers">
		<span ${testDetail.ta_choice_no == '1'? 'style="color:red"' : ''}>1</span> ${testDetail.pc_answer1}<br/>
		<span ${testDetail.ta_choice_no == '2'? 'style="color:red"' : ''}>2</span> ${testDetail.pc_answer2}<br/>
		<span ${testDetail.ta_choice_no == '3'? 'style="color:red"' : ''}>3</span> ${testDetail.pc_answer3}<br/>
		<span ${testDetail.ta_choice_no == '4'? 'style="color:red"' : ''}>4</span> ${testDetail.pc_answer4}
	</div>
</c:forEach>
<%@ include file="../../resources/inc/footer.jsp" %>
	<script>
	</script>
</html>