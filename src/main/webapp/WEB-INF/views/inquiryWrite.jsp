<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css" type="text/css">
<style>
table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
}
	
th, td{
		padding: 5px 10px;
}
	
table{
		width: 80%;
}
	
input[type='text']{
		width: 100%;
}
	
textarea{
		width: 100%;
		height: 150px;
		resize: none;
}
</style>
</head>
<body>
	<h3>글쓰기</h3>
	<form action="inquiryWrite.do" method="post" enctype="multipart/form-data">
	
	
		<table class="ib">
			<tr>
				<th>제목</th>
				<td><input type="text" name="ib_subject"/></td>
			</tr>

			<tr>
				<th>내용</th>
				<td><textarea name="ib_content"></textarea></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><input type="file" multiple ="multiple"  onchange="checkFile(this)" name="files" accept=".gif, .jpg, .png, .doc, .docx, .hwp, .ppt, .pptx, .xls, .xlsx"/><br>※첨부파일은 이미지(jpg,png,gif,bmp) 또는 문서파일(doc,docx,hwp,ppt,pptx,xls,xlsx)만 가능합니다</td> 	
			</tr>
			
			<tr>
				<th colspan="2">
					<input type="submit" value="글쓰기"/>
					<input type="button" value="리스트" onclick="location.href='inquiryList.go'"/>
				</th>
			</tr>			
		</table>
	</form>
</body>
<%@ include file="../../resources/inc/footer.jsp" %>
<script>

		
function checkFile(f){


	var file = f.files;

	//for문으로 파일 갯수만큼 확인
	for(var i = 0; i<file.length; i++){
	//경고창 한번으로 수정
	if(!/\.(jpg|png|gif|bmp|doc|docx|hwp|ppt|pptx|xls|xlsx)$/i.test(file[i].name)) alert('이미지(jpg,png,gif,bmp) 또는 문서파일(doc,docx,hwp,ppt,pptx,xls,xlsx) 파일만 선택해 주세요.\n\n현재 파일 : ' + file[i].name);
	
	else return;
	
	f.outerHTML = f.outerHTML;
	}
}		
		
</script>
</html>