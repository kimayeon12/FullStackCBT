<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>풀스택(Full-Stack) CBT</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<style>
        
    </style>
</head>
<body>
	<h2>과목 관리 - 등록</h2>
        <table>
       		<thead>
                <tr>
                    <th>과목명</th>
                    <th>
                        <input type="text" id="subject"/>
                        <button onclick="subOverlay()">중복확인</button>
                    </th>
                </tr>
            </thead>
            <tbody>
	             <tr>
	               <td>노출여부</td>
	               <td>
	               		<input type="checkbox" id="check" name="check"/>
	               		체크 시 사용자 시험 응시 화면에 과목 선택 목록으로 노출됩니다. 
	               </td>
	             </tr>
            </tbody>
		</table>
		<input type="button" value="등록" onclick="subRegister()"/>
		<input type="button" value="목록" onclick="location.href='adminSubjectManagement.do'"/>	
</body>
<%@ include file="../../resources/inc/footer.jsp" %>
<script>
	
	var overChk = false;
	function subOverlay() {
		var subject = $("#subject").val();
		console.log('중복 체크 : '+subject);
		if(subject==""){
			alert("과목명을 입력해 주세요.");
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
	
	function subRegister() {
		console.log('과목명 등록');
		var $subject = $('#subject');
		var $check = $('#check');
		
		if(overChk){
			
			console.log("과목명 등록 요청");
			
			$.ajax({
				type:'post',
				url:'subReg.ajax',
				data:{
					subject:$subject.val(),
					check:$check.val()
				},
				dataType:'JSON',
				success:function(data){
					console.log(data);
					if(data.success){
						alert("과목 등록에 성공 했습니다.");
						location.href='/adminSubjectManagement.do';
					}else{
						alert("과목 등록에 실패 했습니다.");
					}
				},
				error:function(e){
					console.log(e);
					alert("과목 등록에 실패 했습니다.");
				}
			});
				
			} else if($subject.val()=="") {
				alert("과목명을 입력해 주세요");
			}
		
				else{
				alert("중복체크를 진행해 주세요");
				
			}
	
		
	}
    </script>
</html>



