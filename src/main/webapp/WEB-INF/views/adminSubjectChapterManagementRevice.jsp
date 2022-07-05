<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>

<h1>과목단원 관리 - 수정</h1>
	<form action ="subjectChapterUpdate.do" method="post" onsubmit="return subjectChapUpdate()">
        <table class="tg">
            <thead>
                <tr>
                    <th>과목명</th>
                    <td>
                		<input type="hidden" name="su_idx" value="${subjectselList.su_idx}"/>
                       	<input type="text" id="subject" name="subject" value="${subjectselList.su_name}" readonly/>
                    </td>
                </tr>
        		</thead>
			<tbody>
       			<tr>
       				<th>과목단원명</th>
           			<td>
            			<input type="hidden" name="chapCnt" value="${chapdto.chapCnt}"/>
						<input type="hidden" name="sc_idx" value="${chapdto.sc_idx}"/>
						<input type="text" id="subChapter" name="subChapter" value="${chapdto.sc_name}"/>
              			<input type="button" name="subCheck" value="중복확인" onclick="subChapReOverlay()">
              		</td>
       			</tr>
           	</tbody>
		</table>
        <br>
	    <div align="center">
        	<input type="submit" value="수정"/>
        	<input type="button" value="목록" onclick="location.href='adminSubjectChapterManagement.do'"/>
        </div>
	</form>  
<%@ include file="../../resources/inc/footer.jsp" %>

<script>

	var overChk = false;
	
	function subChapReOverlay() {
		var subChapter = $("#subChapter").val();
		console.log('중복 체크 : '+subChapter);
		if(subChapter==""){
			alert("과목단원명을 입력해 주세요.");
			return false;
		}
		
		$.ajax({
			type:'get',
			url:'subChapReOverlay.ajax',
			data:{chkSubChap:subChapter},
			dataType:'JSON',
			success:function(data){
				console.log(data);
				if(data.subChapReOverlay){
					alert("이미 등록된 과목단원명 입니다.");
				}else{
					alert("사용 가능한 과목단원명 입니다.");
					overChk = true;
				}
			},
			error:function(e){
				console.log(e);
			}
		});	
	}
	
	
	function subjectChapUpdate() {
		if($("#subChapter").val() == "") {
			alert("과목명을 입력해 주세요.");
			return false;
		}else if(overChk == false){
			alert("중복체크를 진행해 주세요.");
			return false;
		}else{
			alert("수정이 완료 되었습니다.");
		}
	}
	
	
	//임시 테스트
/*
	function submitCheck() {
		console.log('과목 단원 수정');
		var subChapter = $("#subChapter");
		console.log(subChapter);

		if(overChk){
			
			console.log("과목단원명 수정 요청");
		
			$.ajax({
				type:'post',
				url:'submitCheck.ajax',
				data:{submitChk:subChapter},
				dataType:'JSON',
				success:function(data){
					console.log(data);
					if(data.submitCheck==false){
						alert("과목단원명 수정에 성공 했습니다.");
						location.href='/subjectChapterUpdate.do';
					}else{
						alert("과목단원명 수정에 실패 하였습니다.")
					}
				}
			});
		}else if(subChapter.val()==""){
			alert("과목단원명을 입력해 주세요.");
		}else{
			alert("중복체크를 진행해 주세요.")
		}	
	}
*/
</script>

</html>

