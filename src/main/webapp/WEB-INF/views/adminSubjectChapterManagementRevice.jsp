<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<%@ include file="../../resources/inc/footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<style type="text/css">
		.tg  {border-collapse:collapse;border-spacing:0;}
		.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
		  overflow:hidden;padding:10px 5px;word-break:normal;}
		.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
		  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
		.tg .tg2{background-color:#efefef;font-weight:bold;text-align:center;vertical-align:top}
		.tg .tg1{background-color:#efefef;border-color:inherit;font-weight:bold;text-align:center;vertical-align:top}
		.tg .tg3{text-align:left;vertical-align:top}
		textarea {resize: none;}
	</style>
</head>
<body>
<h2>과목 단원 관리 - 수정</h2>
	<form action ="subjectChapterUpdate.do" method="post">
        <table class="tg">
            <thead>
                <tr>
                    <th class="tg2">과목명</th>
                    <th class="tg3">
                		<input type="hidden" name="su_idx" value="${subjectselList.su_idx}"/>
                       <input type="text" id="subject" name="subject" value="${subjectselList.su_name}" readonly/>
                    </th>
                </tr>
            </thead>
            <tbody>
              <tr>
                <td class="tg1">과목단원명<td>
                	<input type="hidden" name="chapCnt" value="${chapdto.chapCnt}"/>
					<input type="hidden" name="sc_idx" value="${chapdto.sc_idx}"/>
					<input type="text" id="subChapter" name="subChapter" value="${chapdto.sc_name}"/>
                  	<input type="button" name="subCheck" value="중복확인" onclick="subChapReOverlay()">
                </td>
              </tr>
            </tbody>
            </table>
            <input type="button" value="수정" onclick="submitCheck()"/>
            <input type="button" value="목록" onclick="location.href='adminSubjectChapterManagement.do'"/>
	</form>
</body>

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
	
	//임시 테스트
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

</script>

</html>

