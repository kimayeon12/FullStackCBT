<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
	<div>문제 출제 관리</div>
	<div>총 문제수 : </div>
		<form action="" class="search">
			<select id="select_main">
				<option value="" selected>과목명</option>
				<option value="JAVA">JAVA</option>
				<option value="js/jQuery">js/jQuery</option>
				<option value="MariaDB">MariaDB(MySQL)</option>
			</select>
			<select id="select_sub">
				<option value="">과목단원선택</option>
			</select>
			<select id="search">
				<option value="전체" selected>전체</option>
				<option value="문제">문제</option>
				<option value="해설">해설</option>
				<option value="출제자 아이디">출제자 아이디</option>
			</select>
			<input type="text" maxlength="255">
			<input type="button" value="검색"/>
		</form>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>과목명</th>
					<th>단원명</th>
					<th>문제</th>
					<th>난이도</th>
					<th>정답률</th>
					<th>출제자 아이디</th>
					<th>출제일</th>
					<th>문제보관사용자수</th>
					<th>수정하기</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${problemList}" var="problemList">
					<tr>
						<td>${problemList.pc_idx}</td>
						<td>${problemList.su_name}</td>
						<td>${problemList.sc_name}</td>
						<td>${problemList.pc_problem}</td>
						<td>${problemList.pc_difficulty}</td>
						<td></td>
						<td></td>
						<td>${problemList.pc_date}</td>
						<td></td>
						<td>수정하기</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	<input type="button" value="새로운 문제 출제" onclick="location.href='adminProblemWrite.go'"/>
<%@ include file="../../resources/inc/footer.jsp" %>
<script>



/* select option으로 보여줄 때 ajax를 사용할 예정

problemListCall();

function problemListCall(){

	$.ajax({
		type:'get',
		url:'problemList.ajax',
		data:{},
		dataType:'json',
		success:function(data){
			//console.log(data);
		
			console.log('테이블 그리기');
			drawProblemList(data.problemList);
		},
		error:function(error){
			console.log(error);
		}
		
	});
	
}

function drawProblemList(problemList){
	var content = '';
	
	problemList.forEach(function(problemList){
		console.log(problemList);
		content += '<tr>';
		content += '<td>'+problemList.pc_idx+'</td>';
		content += '<td>'+problemList.su_idx+'</td>';
		content += '<td>'+problemList.sc_idx+'</td>';
		content += '<td>'+problemList.pc_problem+'</td>';
		content += '<td>'+problemList.pc_difficulty+'</td>';
		content += '<td></td>';
		content += '<td></td>';
		content += '<td id="'+problemList.pc_date+'"></td>';
		content += '<td></td>';
		content += '<td></td>';
		content += '</tr>';
	});
	$("#problemList").empty();
	$("#problemList").append(content);	
}

*/

</script>
</html>











