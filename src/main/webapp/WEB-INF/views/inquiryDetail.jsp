<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../../resources/inc/header.jsp" %>
		<h1>1:1게시판 - 상세</h1>

		<form name="form1" method="post">
		<table class="dto">
			
				<tr>
					<th>제목</th>
					<td>${dto.ib_subject}
					</td>
				</tr>
				<tr>
					<th>작성일시</th>
					<td><fmt:formatDate value="${dto.ib_reg_date}" pattern="yyyy-MM-dd KK:mm:ss"/></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
						<c:forEach items="${list}" var="path">
								<c:choose>
									<c:when test="${fn:endsWith(path.ba_new_name,'.png')||fn:endsWith(path.ba_new_name,'.jpg')||fn:endsWith(path.ba_new_name,'.gif')}">
										<img src="/photo/${path.ba_new_name}" width="400"/>
									</c:when>
									<c:otherwise>
										<a href="/photo/${path.ba_new_name}">${path.ba_new_name} (열기)</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
					</td>
				</tr>
				<tr>
					<th>문의내용</th>
					<td>${dto.ib_content}</td>
			
				</tr>
				<tr>
					<th>답변내용</th>
					<td>${dto.ib_answer}
	
					</td>
				</tr>
			</table>
				<input type="hidden" name="idx" value="${ib_idx}">
				<input type="button" value="목록" onclick="location.href='inquiryList.go'"/>
				<input type="button" value="삭제" onclick="del(${dto.ib_idx})" style="float:right; margin-left:5px;"/>
				<input type="button" value="수정" onclick="location.href='inquryUpdate.go?ib_idx=${dto.ib_idx}'" style="float:right; margin-right:5px;"/>
		</form>		
	</body>
<%@ include file="../../resources/inc/footer.jsp" %>
<script>


 	function del(ib_idx) {
 		var chk = confirm("정말 삭제하시겠습니까?");
 		if (chk) {
 			location.href='inquiryDelete?ib_idx='+ib_idx;
 		}
 	}	
 </script>

</html>