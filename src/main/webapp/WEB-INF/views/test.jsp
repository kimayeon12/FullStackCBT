<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<h1>시험 응시</h1>
<span id="timer">10:00</span>
<form id="test" action="testReg.do" method="post" onsubmit="return test()">
	<input type="hidden" name="su_idx" value="${su_idx}"/>
<ol id="questionBox">
<c:forEach items="${problemList}" var="item" begin="0" end="10" step="1" varStatus="status">
	<input type="hidden" name="idx${status.count}" value="${item.pc_idx}"/>
	<li id="q${status.count}">
		${status.count}. ${item.pc_problem}
		<ul class="answer">
			<li data="a${status.count}_1"><input type="radio" name="pc_answer${status.count}" id="a${status.count}_1" value="1"><label for="a${status.count}_1">${item.pc_answer1}</label></li>
			<li data="a${status.count}_2"><input type="radio" name="pc_answer${status.count}" id="a${status.count}_2" value="2"><label for="a${status.count}_2">${item.pc_answer2}</label></li>
			<li data="a${status.count}_3"><input type="radio" name="pc_answer${status.count}" id="a${status.count}_3" value="3"><label for="a${status.count}_3">${item.pc_answer3}</label></li>
			<li data="a${status.count}_4"><input type="radio" name="pc_answer${status.count}" id="a${status.count}_4" value="4"><label for="a${status.count}_4">${item.pc_answer4}</label></li>
		</ul>
	</li>
</c:forEach>
</ol>
	<div align="center">
		<input type="button" value="◀ 이전문제" id="btnPrev"/>
		<input type="button" value="다음문제 ▶" id="btnNext"/>
	</div>
	<p id="noProblem">풀지 않은 문제 : <em>10</em>개</p>
	<div id="answerBox">
		<p>답안지</p>
		<div id="choice">
			<table>
				<tbody>
				<c:forEach begin="1" end="10" step="1" varStatus="status">
					<tr data="q${status.index}">
						<th><a href="#">${status.index}</a></th>
						<td data="a${status.index}_1"><input type="checkbox" value="1"></td>
						<td data="a${status.index}_2"><input type="checkbox" value="2"></td>
						<td data="a${status.index}_3"><input type="checkbox" value="3"></td>
						<td data="a${status.index}_4"><input type="checkbox" value="4"></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		<div align="right"><input type="submit" value="답안제출"/></div>
	</div>
</form>
<%@ include file="../../resources/inc/footer.jsp" %>
	<script>
		var currentProblem = 1;
		var beforeChecked = -1;
		
		function test() {
			if($('ul.answer > li > input:checked').length < 10 && !confirm("풀지 않은 문제가 있습니다. 정말 제출하시겠습니까?")) {
				var noProblem = 0;
				
				$('.answer').each(function() {
					if(noProblem < 1 && $(this).find('li > input[type="radio"]').is(':checked') == false) {
						noProblem = $(this).parent().attr('id').replace('q', '');
					}
				});
				
				$('#answerBox > div > table > tbody > tr[data="q' + noProblem + '"]').find('th > a').trigger('click');
				
				return false;
			}
			
			if(!confirm("정말 제출하시겠습니까?")) {
				return false;
			}
		}
		
		$('#btnPrev').on('click', function() {
			currentProblem--;
			
			if(currentProblem <= 1) {
				currentProblem = 1;
				
				$(this).hide();
			}
			
			beforeChecked = $('#q'+currentProblem+' input[type="radio"]:checked').parent().index();
			
			$('#btnNext').show();
			$('#questionBox > li').hide();
			$('#questionBox > li').eq(currentProblem - 1).show();
		});
		
		$('#btnNext').on('click', function() {
			
			currentProblem++;
			
			if(currentProblem >= 10) {
				currentProblem = 10;
				
				$(this).hide();
			}
			
			beforeChecked = $('#q'+currentProblem+' input[type="radio"]:checked').parent().index();
			
			$('#btnPrev').show();
			$('#questionBox > li').hide();
			$('#questionBox > li').eq(currentProblem - 1).show();
		});

		$('#answerBox > div > table > tbody > tr > th > a').on('click', function() {
			currentProblem = parseInt($(this).closest('tr').attr('data').replace('q', ''));
			
			$('#btnPrev, #btnNext').show();
			
			if(currentProblem <= 1) {
				currentProblem = 1;
				
				$('#btnPrev').hide();
			} else if(currentProblem >= 10) {
				currentProblem = 10;

				$('#btnNext').hide();
			}
			
			beforeChecked = $('#q'+currentProblem+' input[type="radio"]:checked').parent().index();
			
			$('#questionBox > li').hide();
			$('#questionBox > li').eq(currentProblem - 1).show();
		});
		
		$('input[type="radio"]').on('click',function(){
	         var index = $(this).parent().index();
	         
	         if(beforeChecked == index) {
	         	beforeChecked = -1;
	         	$(this).prop("checked", false);
	         } else {
	         	beforeChecked = index;
	         }
		});
		
		var limitSecond = 600; // 시험 제한시간(초 단위 / 10분 = 600초)
		
		var timerFunc = window.setInterval(function() {
			limitSecond--;
			
			if(limitSecond <= 0) {
				document.getElementById('test').submit();
				
				window.clearInterval(timerFunc);
			}
			
			var minute = Math.floor(limitSecond / 60);
			var second = limitSecond % 60;
			
			if(minute < 10) {
				minute = '0' + minute;
			}
			
			if(second < 10) {
				second = '0' + second;
			}
			
			$("#timer").text(minute + ":" + second);
		}, 1000);
		
		$('ul.answer > li > input[type="radio"],table > tbody > tr > td > input[type="checkbox"]').on('click',function(){
			$('[data="'+$(this).parent().attr('data')+'"]').siblings().find('input').prop('checked',false);
			$('[data="'+$(this).parent().attr('data')+'"]').find('input').prop('checked',$(this).prop('checked'));
			$('p > em').text($('ol > li').length-$('ul.answer > li > input:checked').length);
		});
		
	</script>
</html>