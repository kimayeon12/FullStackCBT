<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<h1>문제출제 관리 - 수정</h1>
	<form action="problemUpdate.do" method="get" onsubmit="return checkSubmit()">
	<table>
		<colgroup>
			<col width="150"></col>
			<col width="*"></col>
		</colgroup>
		<tr>
			<th>과목명</th>
			<td>
				<input type="hidden" name="pc_idx" value="${problemDetail.pc_idx}">
				<select name="su_idx" id="subjectList">
					<option value="">과목명</option>
                   		<c:forEach items="${subjectList}" var="item">
                   			<option value="${item.su_idx}" ${item.su_idx eq problemDetail.su_idx ? 'selected' : ''}>${item.su_name}</option>                   		
                   		</c:forEach>
                </select>
			</td>
		</tr>
        <tr>
			<th>과목단원명</th>
			<td>
				<select name="sc_idx" id="subjectChapList">
					<option value="">과목단원명</option>
					<c:forEach items="${subjectChap}" var="item">
                   		<option value="${item.sc_idx}" ${item.sc_idx eq problemDetail.sc_idx ? 'selected' : ''}>${item.sc_name}</option>                   		
                   	</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th>문제</th>
			<td>
				<input type="text" name="pc_problem" id="pc_problem" value="${problemDetail.pc_problem}" style="width:99%;"/>
			</td>
		</tr>
		<tr>
			<th>정답</th>
			<td>
				<input type="radio" name="pc_answer" id="pc_answer" value="1" <c:if test="${problemDetail.pc_answer eq '1'}">checked</c:if>/>➊
				<input type="radio" name="pc_answer" id="pc_answer" value="2" <c:if test="${problemDetail.pc_answer eq '2'}">checked</c:if>/>➋
				<input type="radio" name="pc_answer" id="pc_answer" value="3" <c:if test="${problemDetail.pc_answer eq '3'}">checked</c:if>/>➌
				<input type="radio" name="pc_answer" id="pc_answer" value="4" <c:if test="${problemDetail.pc_answer eq '4'}">checked</c:if>/>➍
			</td>
		</tr>
		<tr>
			<th>4지선다문항</th>
			<td>
				 ① <input type="text" name="pc_answer1" id="pc_answer1" value="${problemDetail.pc_answer1}" <c:if test="${problemDetail.pc_answer1 eq problemDetail.pc_answer1}">checked</c:if> style="width:90%;"/><br>
				 ② <input type="text" name="pc_answer2" id="pc_answer2" value="${problemDetail.pc_answer2}" <c:if test="${problemDetail.pc_answer1 eq problemDetail.pc_answer2}">checked</c:if> style="width:90%;"/><br>
				 ③ <input type="text" name="pc_answer3" id="pc_answer3" value="${problemDetail.pc_answer3}" <c:if test="${problemDetail.pc_answer1 eq problemDetail.pc_answer3}">checked</c:if> style="width:90%;"/><br>
				 ④ <input type="text" name="pc_answer4" id="pc_answer4" value="${problemDetail.pc_answer4}" <c:if test="${problemDetail.pc_answer1 eq problemDetail.pc_answer4}">checked</c:if> style="width:90%;"/>
			</td>
		</tr>
		<tr>
			<th>해설</th>
			<td><textarea name="pc_explan" id="pc_explan">${problemDetail.pc_explan}</textarea></td>
        </tr>
		<tr>
			<th>난이도</th>
			<td>
				<input type="radio" name="pc_difficulty" id="pc_difficulty" value="상" <c:if test="${fn:contains(problemDetail.pc_difficulty, '상')}">checked</c:if>/>상
				<input type="radio" name="pc_difficulty" id="pc_difficulty" value="중" <c:if test="${fn:contains(problemDetail.pc_difficulty, '중')}">checked</c:if>/>중
				<input type="radio" name="pc_difficulty" id="pc_difficulty" value="하" <c:if test="${fn:contains(problemDetail.pc_difficulty, '하')}">checked</c:if>/>하
			</td>
		</tr>
		<tr>
			<th colspan="2">
			<input type="submit" value="수정"/>
			<input type="button" value="목록" onclick="location.href='problemList.do'"/>
			</th>
		</tr>
	</table>
	</form>
<%@ include file="../../resources/inc/footer.jsp" %>
<script>

$("select[name='su_idx']").on("change", function(){
	
	console.log("ajax 전송");
	var subject = $("#subjectList option:selected").val();
	
	$.ajax({
		type:"post",
		url:"subjectChapList.ajax",
		data:{
			'subject' : subject
		}, 
		dataType:"JSON",
		success:function(data){
			console.log("세부과목 가져오기 : "+data.subjectChapList);
			
			if(data.subjectChapList != null) {
				drawSubjectChapList(data.subjectChapList);							
			}
		},
		error:function(error){
			console.log(error);
		}
	});
	
});

function drawSubjectChapList(subjectChapList){
	var content = '<option value="">과목단원명</option>';
	console.log(subjectChapList);
	
	subjectChapList.forEach(function(subjectChapList){
		content += '<option value="'+subjectChapList.sc_idx+'">'+subjectChapList.sc_name+'</option>';
	});
	$("#subjectChapList").empty();
	$("#subjectChapList").append(content);
	
}

function checkSubmit(){

	var pc_answer = $("#pc_answer");
	
	var pc_difficulty = $("#pc_difficulty");
	
if($('select[name="su_idx"]').val()==""){
		alert("과목을 선택해 주세요");
		$("#subjectList").focus();
		return false;
	}else if($('select[name="sc_idx"]').val()==""){
		alert("과목 단원을 선택해 주세요");
		$("#subjectChapList").focus();
		return false;
	}else if($('input[name="pc_problem"]').val()==""){
		alert("문제를 입력해 주세요");
		$("#pc_problem").focus();
		return false;
	}else if($(':radio[name="pc_answer"]:checked').length < 1){
		alert("정답을 체크해 주세요");
		pc_answer.focus();
		return false;
	}else if($('input[name="pc_answer1"]').val()==""){
		alert("4지선다 1번 문항을 입력해 주세요");
		$("#pc_answer1").focus();
		return false;
	}else if($('input[name="pc_answer2"]').val()==""){
		alert("4지선다 2번 문항을 입력해 주세요");
		$("#pc_answer2").focus();
		return false;
	}else if($('input[name="pc_answer3"]').val()==""){
		alert("4지선다 3번 문항을 입력해 주세요");
		$("#pc_answer3").focus();
		return false;
	}else if($('input[name="pc_answer4"]').val()==""){
		alert("4지선다 3번 문항을 입력해 주세요");
		$("#pc_answer4").focus();
		return false;
	}else if($('textarea[name="pc_explan"]').val()==""){
		alert("해설을 입력해 주세요");
		$("#pc_explan").focus();
		return false;
	}else if($(':radio[name="pc_difficulty"]:checked').length < 1){
		alert("난이도를 선택해 주세요");
		pc_difficulty.focus();
		return false;
	}else{
		alert("문제가 등록 되었습니다.");
	}
	
}




</script>
</html>









