<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<body>
    <h1>회원탈퇴</h1>
    <hr>
    <h2>탈퇴안내</h2>
    <p>회원탈퇴를 신청하기 전에 아래 내용을 꼭 확인해 주세요.
    <br>
    사용하고 계신 아이디(아이디 들어갈곳)는 탈퇴할 경우 동일한 아이디로 재가입이 불가능합니다.
    <br>
    탈퇴하시려면 현재 로그인 중인 계정의 비밀번호를 입력하셔야 탈퇴 가능합니다.
    </p>
    <br>
    <h2>탈퇴사유</h2>
    <table> 
        <div>
             <input name="front" type="radio"/>
            서비스 불만족
            <br>
            <input name="front" type="radio"/>
             더 이상 사용하지 않음
             <br>
             <input name="front" type="radio"/>
            실질적인 혜택부족
            <br><input name="front" type="radio"/>
            기타
            <input type="text" >
            <br>
            비밀번호 <input type="password" name="pw"/>
        </div>
        <br>
        <tr>
            <th colspan="2">
                <input type="submit" value="탈퇴"/>
            </th>
        </tr>
    </table>
</body>
<%@ include file="../../resources/inc/footer.jsp" %>
	<script></script>
</html>