<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<%@ include file="../../resources/inc/footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>풀스택(Full-Stack) CBT</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<style type="text/css">
          .tg  {border-collapse:collapse;border-spacing:0;}
          .tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
            overflow:hidden;padding:10px 5px;word-break:normal;}
          .tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
            font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
          .tg .tg-zlqz{background-color:#c0c0c0;border-color:inherit;font-weight:bold;text-align:center;vertical-align:top}
          .tg .tg-baqh{text-align:center;vertical-align:top}
          .tg .tg-lqy6{text-align:right;vertical-align:top}
          .tg .tg-u1yq{background-color:#c0c0c0;font-weight:bold;text-align:center;vertical-align:top}
          .tg .tg-i81m{background-color:#ffffff;text-align:center;vertical-align:top}
          .tg .tg-0lax{text-align:left;vertical-align:top}
	</style>
</head>
<body>
	<h2>과목 관리</h2>
       <table class="tg">
           <thead>
             <tr>
               <th class="tg-zlqz">번호</th>
               <th class="tg-u1yq">과목명</th>
               <th class="tg-u1yq">과목 단원수</th>
               <th class="tg-u1yq">등록된 총 문제수</th>
               <th class="tg-u1yq">응시자수</th>
               <th class="tg-u1yq">응시횟수</th>
               <th class="tg-u1yq">노출여부</th>
               <th class="tg-u1yq">관리</th>
             </tr>
           </thead>
           <tbody>
             <tr>
               <td class="tg-i81m">3</td>
               <td class="tg-baqh">JAVA</td>
               <td class="tg-baqh">4</td>
               <td class="tg-lqy6">100</td>
               <td class="tg-lqy6">222명</td>
               <td class="tg-lqy6">333회</td>
               <td class="tg-baqh">O</td>
               <td class="tg-0lax"><button onclick="location.href='adminSubjectRevice'">과목수정</button></td>
             </tr>
             <tr>
               <td class="tg-i81m">2</td>
               <td class="tg-baqh">MariaDB(MySQL)</td>
               <td class="tg-baqh">5</td>
               <td class="tg-lqy6">100</td>
               <td class="tg-lqy6">333명</td>
               <td class="tg-lqy6">444회</td>
               <td class="tg-baqh">O</td>
               <td class="tg-0lax"><button onclick="location.href='adminSubjectRevice'">과목수정</button></td>
             </tr>
             <tr>
               <td class="tg-i81m">1</td>
               <td class="tg-baqh">js/jQuery</td>
               <td class="tg-baqh">5</td>
               <td class="tg-lqy6">100</td>
               <td class="tg-lqy6">444명</td>
               <td class="tg-lqy6">555회</td>
               <td class="tg-baqh">X</td>
               <td class="tg-0lax"><button onclick="location.href='adminSubjectRevice'">과목수정</button></td>
             </tr>
           </tbody>
           </table>
       <button onclick="location.href='adminSubjectManagementRegister'">과목등록</button>
</body>
<script>
	var msg = "${msg}";
	
	if(msg != ""){
		alert(msg);
	}
</script>
</html>