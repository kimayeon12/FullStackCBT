<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>풀스택(Full-Stack) CBT</title>
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
    </style>
</head>
<body>
	<h2>과목 관리 - 등록</h2>
        <table class="tg">
       		<thead>
                <tr>
                    <th class="tg2">과목명</th>
                    <th class="tg3">
                        <input type="text" id="subject"/>
                        <button onclick="subOverlay()">중복확인</button>
                    </th>
                </tr>
            </thead>
            <tbody>
	             <tr>
	               <td class="tg1">노출여부</td>
	               <td class="tg3">
	               		<input type="checkbox" id="check" name="check" />
	               		체크 시 사용자 시험 응시 화면에 과목 선택 목록으로 노출됩니다. 
	               </td>
	             </tr>
            </tbody>
		</table>
		<input type="button" value="등록" onclick="subRegister()"/>
		<input type="button" value="목록" onclick="location.href='adminSubjectManagement.do'"/>	
</body>
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



