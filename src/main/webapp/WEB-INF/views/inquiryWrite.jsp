<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
	<h1>1:1게시판 - 글쓰기</h1>
	<form action="inquiryWrite.do" method="post" enctype="multipart/form-data" onsubmit="return inquiryWrite()">
	
	
		<table class="ib">
			<tr>
				<th>제목</th>
				<td><input type="text" name="ib_subject" id="ib_subject" style="width:99%;"/></td>
			</tr>

			<tr>
				<th>내용</th>
				<td><textarea name="ib_content" id="ib_content"></textarea></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><input type="file" multiple ="multiple"  onchange="checkFile(this)" name="files" accept=".gif, .jpg, .png, .doc, .docx, .hwp, .ppt, .pptx, .xls, .xlsx"/><br>※첨부파일은 이미지(jpg,png,gif,bmp) 또는 문서파일(doc,docx,hwp,ppt,pptx,xls,xlsx)만 가능합니다</td> 	
			</tr>
			
			<tr>
				<th colspan="2">
					<input type="submit" value="글쓰기"/>
					<input type="button" value="목록" onclick="location.href='inquiryList.go'"/>
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
		
function inquiryWrite()	{
		
		
		if($('input[name="ib_subject"]').val()==""){
			alert("제목을 입력해주세요");
			$("#ib_subject").focus();
			return false;
		}else if($('#ib_content').val()==""){
			alert("내용을 입력해주세요");
			$("#ib_content").focus();
		return false;
		}
}
		
</script>
</html>