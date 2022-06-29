<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<form action="login" method="POST" onsubmit="return findPw()">
        <tr>
			<th>아이디</th>
			<td><input type="text" name="mb_id" id="id"/></td>
		</tr>
        <tr>
			<th>이름</th>
			<td><input type="text" name="mb_name" id="pw"/></td>
		</tr>
        <tr>
			<td>이메일</td>
			<td><input type="text" id="mb_email" id="name"/></td>
		</tr>
        <tr>
			<th colspan="2">
			<input type="submit" value="비밀번호 찾기"/>
            <input type="submit" value="취소"/>
			</th>
		</tr>
    </form>
<%@ include file="../../resources/inc/footer.jsp" %>
	<script></script>
</html>