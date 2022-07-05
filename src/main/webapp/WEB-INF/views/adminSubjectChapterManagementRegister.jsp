<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<h1>과목단원 관리 - 등록</h1>
	<table class="tg">
        <thead>
            <tr>
                <th class="tg2">과목명</th>
                <td class="tg3">
                   <select name="su_idx" id="subjectList">
                        <option value="0">과목선택</option>
                        <c:forEach items="${subjectList}" var="subjectList">
                        		<option value="${subjectList.su_idx}">${subjectList.su_name}</option>
                        </c:forEach>
                   </select> 
                </td>
        	</tr>
        </thead>
   		<tbody>
              <tr>
                <th align="center">과목단원명</th>
                <td>
                <input type="text" id="chapter"/>
                <button onclick="subChapOverlay()">중복확인</button>
                </td>
              </tr>
    	</tbody>
	</table>
			<br>
        <div align="center">
            <input type="button" value="등록" onclick="subChapRegister()"/>
            <input type="button" value="목록" onclick="location.href='adminSubjectChapterManagement.go'"/>
        </div>
<%@ include file="../../resources/inc/footer.jsp" %>
<script>
	var overChk = false;
	
	function subChapOverlay() {
		var chapter = $("#chapter").val();
		console.log('과목 단원명 중복체크 : '+chapter);
		
		var subject = $("#subjectList").val();
		console.log(subject);
		if(subject==0){
			alert("과목명을 선택해 주세요.");
			$("#subjectList").focus();
			return false;
		}
		
		
		$("#subjectList").on("change", function(){
			var subsel = $("option:selected", this).attr("value");
			console.log(subsel);
		});
	
		
		
			if(chapter==""){
				alert("과목단원명을 입력해 주세요.");
				$("#chapter").focus();
				return false;
			}
			$.ajax({
				type:'get',
				url:'subChapOverlay.ajax',
				data:{chksubChap:chapter},
				dataType:'JSON',
				success:function(data){
					console.log(data);
					if(data.subChapOverlay){
						alert("이미 등록된 과목단원명 입니다.");
						$("#chapter").val("");
					}else{
						alert("사용 가능한 과목단원명 입니다.");
						overChk = true;
					}
				}
			});
	}
	
	function subChapRegister(){
		console.log('과목단원명 등록');
		var subject = $("#subjectList option:selected").val()
		console.log(subject);
		var chapter = $("#chapter").val()
		console.log(chapter);
		console.log(overChk);
		if(overChk) {
			
			console.log("과목단원명 등록 요청");
			
			$.ajax({
				type:'post',
				url:'subChapReg.ajax',
				data:{
					subject:subject,
					chapter:chapter
				},
				dataType:'JSON',
				success:function(data){
					console.log(data);
					if(data.success){
						alert("과목 등록에 성공 했습니다.");
						location.href='/adminSubjectChapterManagement.do';
					}else{
						alert("과목 등록에 실패 했습니다.");
					}
				},
				error:function(e){
					console.log(e)
					alert("과목 등록에 실패 했습니다.");
				}
			});
			
		} else if(subject==0){
			alert("과목명을 선택해 주세요.");
			$("#subjectList").focus();
		}else if(chapter==""){
			alert("과목단원명을 입력해 주세요.");
			$("#chapter").focus();
		}else{
			alert("중복체크를 진행해 주세요.");
		}
		
	}
	

</script>
</html>