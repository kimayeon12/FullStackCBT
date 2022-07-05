<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
    <h1>과목관리 - 수정</h1>
        <form action="subjectUpdate.do" method="post" onsubmit="return subjectUpdate()">
	        <table>
	            <thead>
		            <tr>
		                <th>과목명</th>
		                <td>
		                	<input type="hidden" id="su_idx" name="su_idx" value="${dto.su_idx}"/>
		                    <input type="text" id="subject" name="subject" value="${dto.su_name}"/>
		                    <input type="button" id="subCheck" name="subCheck" value="중복확인" onclick="subOverlay()">
		                </td>
		            </tr>
	            </thead>
	            <tbody>
	            <tr>
	                <th>노출여부</th>
	                <td>
		                	<input type="checkbox" id="check" name="check" value="on" ${dto.su_is_blind eq 0? 'checked= "checked"' : ''} />	
	                		체크 시 사용자 시험 응시 화면에 과목 선택 목록으로 노출됩니다.
	                </td>
	            </tr>
	            </tbody>
	        </table>
	        <br>
	        <div align="center">
	        	<input type="submit" value="수정"/>
	        	<input type="button" value="목록" onclick="location.href='adminSubjectManagement.do'"/>
	        </div>
		</form>
</body>
<%@ include file="../../resources/inc/footer.jsp" %>
<script>
	var overChk = false;
	function subOverlay() {
		var subject = $("#subject").val();
		console.log('중복 체크 : '+subject);
		if(subject==""){
			alert("과목명을 입력해 주세요.");
			$("#subject").focus();
			return false;
		}
  		$.ajax({
  			type:'get',
  			url:'subOverlay.ajax',
  			data:{chkSub:subject},
  			dataType:'JSON',
  			success:function(data){
  				console.log(data.suboverlay);
  				if(data.suboverlay){
  					alert("이미 등록된 과목명 입니다.");
  					$("#subject").val("");
  				}else{
  					alert("사용 가능한 과목명 입니다.");
  					overChk = true;
  				}
  			},
  			error:function(e){
  				console.log(e);
  			}
  		});
  	}
	
	function subjectUpdate() {
		if($("#subject").val() == "") {
			alert("과목명을 입력해 주세요.");
			$("#subject").focus();
			return false;
		}else if(overChk == false){
			alert("중복체크를 진행해 주세요.");
			return false;
		}else{
			alert("수정이 완료 되었습니다.");
		}
	}
	
	/*
	function submitSubRevice() {
		console.log('과목명 수정');
		var subject = $('#subject').val();
		var check = $('#check').val();
		var su_idx = $('#su_idx').val();
			
		
			console.log(subject,check,su_idx);
		
		
			
			$.ajax({
				type:'post',
				url:'subRev.ajax',
				data:{
					su_idx:su_idx,
					subject:subject,
					check:check
				},
				dataType:'JSON',
				success:function(data){
					console.log(data);
					if(data.success){
						alert("과목 등록에 성공했습니다.");
					}
				},
				error:function(e){
					console.log(e);
				}
				
			});
			
	}
	*/
    
    </script>
</html>