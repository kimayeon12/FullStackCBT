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
       
       .explan {
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
            <th>시험시작시간</th>
            <th>시험제출시간</th>
            <th>점수</th>
            <th>제출상태</th>
        </tr>
    </thead>
    <tbody>
        <tr>
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
	<div class="answers">
		<span ${testDetail.ta_choice_no == '1'? 'style="color:red"' : ''}>1</span> ${testDetail.pc_answer1}<br/>
		<span ${testDetail.ta_choice_no == '2'? 'style="color:red"' : ''}>2</span> ${testDetail.pc_answer2}<br/>
		<span ${testDetail.ta_choice_no == '3'? 'style="color:red"' : ''}>3</span> ${testDetail.pc_answer3}<br/>
		<span ${testDetail.ta_choice_no == '4'? 'style="color:red"' : ''}>4</span> ${testDetail.pc_answer4}
	</div>
	<div class="explan">${testDetail.pc_explan}</div>
	<button onclick="location.href='/objection.do?pc_idx=${testDetail.pc_idx}&tt_idx=${testDetail.tt_idx}'">이의제기</button>
	<input type="checkbox" class="isSave" value="${testDetail.pc_idx}" <c:if test="${testDetail.cnt > 0}">checked</c:if>/>문제보관
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
						alert("문제보관 처리 중 오류가 발생하였습니다.");
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