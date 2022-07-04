<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../../resources/inc/header.jsp" %>
	<h1>1:1게시판 - 수정</h1>
	<form action="inquiryUpdate.do" method="post" enctype="multipart/form-data" id="form" onsubmit="return inquiryUpdate()">
	<table class="dto">
		<tr>
			<th>제목</th>
			<td>
				<input type="hidden" name="ib_idx" value="${dto.ib_idx}"/>
				<input type="text" name ="ib_subject" id="ib_subject" value="${dto.ib_subject}" style="width:99%;"/>
			</td>
		</tr>
        <tr>
			<th>내용</th>
			<td><textarea name="ib_content" id="ib_content">${dto.ib_content}</textarea></td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td><input type="file" name="files" multiple="multiple" onchange="checkFile(this)" accept=".gif, .jpg, .png, .doc, .docx, .hwp, .ppt, .pptx, .xls, .xlsx"/><br/>
				<div>※첨부파일은 이미지(jpg,png,gif,bmp) 또는<br/>
					 문서파일(doc,docx,hwp,ppt,pptx,xls,xlsx)만 가능합니다
				</div><br/>
				
				<c:forEach var="dto" items="${list}" >
								<p>
									<a href="#this" >${dto.ba_org_name}</a>
									<input type="checkbox"  name="ba_idx" value="${dto.ba_idx}"/>
									체크시 파일삭제				
								</p>
				</c:forEach>			
			   

			</td>
		</tr>
        
		<tr>
			<th colspan="2">
			<input type="submit" value ="저장"/>
			<input type="button" value ="목록" onclick="location.href='inquiryList.go'"/>
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
		
	if(!/\.(jpg|png|gif|bmp|doc|docx|hwp|ppt|pptx|xls|xlsx)$/i.test(file[i].name)) alert('이미지(jpg,png,gif,bmp) 또는 문서파일(doc,docx,hwp,ppt,pptx,xls,xlsx) 파일만 선택해 주세요.\n\n현재 파일 : ' + file[i].name);

	else return;
	}
	f.outerHTML = f.outerHTML;
}		

function inquiryUpdate()	{
	
	
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