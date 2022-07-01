<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script> 
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
	<h3>1:1게시판</h3>
	<form action="adminUpdate.do" method="post">
        <table class="dto">
           
                <tr>
                    <th>제목</th>
                    <td colspan="5">
                    <input type="hidden" name="ib_idx" value="${dto.ib_idx}"/>
                    ${dto.ib_subject}
                    </td>
                </tr>
                <tr>
                    <th width=10%>아이디</th>
                    <td width=40%>${dto.mb_id}</td>
                    <th width=10%>등록일시</th>
                    <td colspan="3">${dto.ib_reg_date}</td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="5">${dto.ib_content}</td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td colspan="5">
                        <c:forEach items="${list}" var="path">
                        	<c:choose>
								<c:when test="${fn:endsWith(path.ba_new_name,'.png')||fn:endsWith(path.ba_new_name,'.jpg')||fn:endsWith(path.ba_new_name,'.gif')}">
									<p><img src="/photo/${path.ba_new_name}"  width="400"/></p>
								</c:when>							
								<c:otherwise>
									<p><a href="/photo/${path.ba_new_name}">${path.ba_new_name}</a></p>
								</c:otherwise>
							</c:choose>							
						</c:forEach>
                    </td>
                </tr>
                
                
                <tr>
                <th>답변상태</th>
                    <td>
                    	<select name="ib_status" id="ib_status">
                        	<option value="2"${dto.ib_status eq 2? 'selected':''}>답변대기</option>
                        	<option value="3"${dto.ib_status eq 3? 'selected':''}>처리중</option>
                       		<option value="4"${dto.ib_status eq 4? 'selected':''}>답변완료</option>
                        </select>
                    </td>
                <th>답변관리자 아이디</th>
                    <td>${dto.ib_admin_id}</td>
                <th>답변일시</th>
                    <td>${dto.ib_answer_date}</td>
                <tr>
                	<th>답변내용</th>
                    <td colspan="5"><textarea name="ib_answer">${dto.ib_answer}</textarea></td>
                </tr>
                <tr>
                    <th>관리자 메모 </th>
                    <td colspan="5"><textarea name="ib_memo">${dto.ib_memo}</textarea></td>
                </tr>
              
            </table>
        

		<input type="submit" value ="저장"/>
	    <input type="button" value ="목록" onclick="location.href='adminInquiryList.go'"/>
	</form>
</body>
<%@ include file="../../resources/inc/footer.jsp" %>

 <script>    
 //var date = new Date();  
 //$('.dateview1').html(moment(date).format('YYYY MM DD HH:mm:ss'));

</script>
</html>